package board.vo;

public class BoardVO {
	private int id;
	private String title;
	private String writer;
	private String content;
	private int replyCount;
	public BoardVO() {}
	
	public BoardVO(int id, String title, String writer, String content, int replyCount) {
		super();
		this.id = id;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.replyCount = replyCount;
	}
	
	public BoardVO(int id, int replyCount) {
		this.id = id;
		this.replyCount= replyCount;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
}
