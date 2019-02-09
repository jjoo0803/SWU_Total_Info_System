// 강의자료

//link - 각 강의자료 게시물로 들어갈 수 있는 url
//title - 게시물 이름
//writer - 작성자
//postDate - 게시물 생성 일자

struct LectureResponse: Codable {
    struct Response: Codable {
        let title: String
        let writer: String
        let postDate: String
        let link: String
    }
    let status: Int
    let message: String
    let reponse: [Response]
}
