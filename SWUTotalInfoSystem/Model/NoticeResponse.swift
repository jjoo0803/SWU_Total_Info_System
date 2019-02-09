// 공지사항
//
//link - 각 공지사항 게시물로 들어갈 수 있는 url
//number - 공지사항 게시물 번호
//title - 게시물 이름
//writer - 작성자
//postDate - 게시물 생성 일자
//fixed - 고정게시물인지 아닌지
//file - 첨부자료의 유무

struct NoticeResponse: Codable {
    struct Response: Codable {
        let link: String
        let number: String
        let title: String
        let writer: String
        let postDate: String
        let fixed: Bool
        let file: Bool
    }
    let status: Int
    let message: String
    let reponse: [Response]
}
