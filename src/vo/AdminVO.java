package vo;

public class AdminVO {	
	private String adId;
	private String adPass;

	public AdminVO() {
	}
	public AdminVO(String adId, String adPass) {
		this.adId = adId;
		this.adPass = adPass;
	}
	public String getAdId() {
		return adId;
	}
	public void setAdId(String adId) {
		this.adId = adId;
	}	
	public String getAdPass() {
		return adPass;
	}	
	public void setAdPass(String adPass) {
		this.adPass = adPass;
	}	
	
}
