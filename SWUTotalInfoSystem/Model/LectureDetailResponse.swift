// 강의자료 디테일
//
//week - 몇 주 차 강의자료인지
//text - 본문 내용
//attfileUrl - 첨부파일 url (첨부파일은 배열로 여러개가 갈 수 있음)
//attfileText - 첨부파일 이름 (마찬가지로 배열)

struct LectureDetailResponse: Codable {
    struct Response: Codable {
        let week: String
        let text: String
        let attfileUrl: [String]
        let attfileText: [String]
    }
    let status: Int
    let message: String
    let reponse: Response
}
