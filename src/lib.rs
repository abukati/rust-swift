use scraper;

pub struct StoreInfo {
    chain: String,
    branch: String,
    list_type: String,
    date: String,
    list: String,
}

trait New<T> {
    fn new() -> T;
}

trait ParseStringHtml<String> {
    fn parse(&self, pattern: &str) -> String;
}

impl ParseStringHtml<String> for String {
    fn parse(&self, pattern: &str) -> String {
        self.split(pattern).collect::<String>().trim().to_owned()
    }
}

impl New<StoreInfo> for StoreInfo {
    fn new() -> StoreInfo {
        StoreInfo {
            chain: "".to_owned(),
            branch: "".to_owned(),
            list_type: "".to_owned(),
            date: "".to_owned(),
            list: "to_do!".to_owned(),
        }
    }
}

pub fn scrape() -> Vec<StoreInfo> {
    let response =
        reqwest::blocking::get("http://matrixcatalog.co.il/NBCompetitionRegulations.aspx")
            .unwrap()
            .text()
            .unwrap();

    let document = scraper::Html::parse_document(&response);

    let html_table_selector =
        scraper::Selector::parse("#download_content>table>tbody>tr:not(:nth-child(1))").unwrap();
    let html_table = document
        .select(&html_table_selector)
        .map(|x| x.inner_html());

    let mut stores: Vec<StoreInfo> = Vec::new();

    html_table.zip(0..150).for_each(|(row, idx)| {
        let mut y = row.split("<td>").collect::<Vec<_>>();
        y.reverse();

        let download_link = y[0].to_owned();
        let unparsed_date = y[1].to_owned();
        let unparsed_list_type = y[4].to_owned();
        let unparsed_branch_name = y[5].to_owned();
        let unparsed_chain_name = y[6].to_owned();

        let date: String = unparsed_date.parse("</td>\n");
        let list_type: String = unparsed_list_type.parse("</td>\n");
        let branch: String = unparsed_branch_name.parse("</td>\n");
        let chain: String = unparsed_chain_name.parse("</td>\n");

        let store = StoreInfo {
            chain,
            branch,
            list_type,
            date,
            list: download_link,
        };

        stores.push(store);
    });

    stores
}

#[swift_bridge::bridge]
mod ffi {

    extern "Rust" {
        type StoreInfo;

        #[swift_bridge(rust_name = "scrape")]
        fn scrape() -> Vec<StoreInfo>;
    }
}

// #[cfg(test)]
// mod tests {
//     use super::*;
//     use tokio;

//     #[test]
//     fn it_works() {
//         let result = hi();
//         scrape();
//         assert_eq!(result, "Hi");
//     }

//     #[tokio::test]
//     async fn test_scrape() {
//         scrape();
//     }
// }
