package pageObjects;

import org.openqa.selenium.WebDriver;

public class PageObjectManager {

	public WebDriver driver;
	public VehicleDataPage vehicleDataPage;
	public InsurantDataPage insurantDataPage;
	public ProductDataPage productDataPage;
	public PriceOptionDataPage priceOptionDataPage;
	public SendQuotePage sendQuotePage;
	
	public PageObjectManager(WebDriver driver)
	{
		this.driver = driver;
	}
	
	public VehicleDataPage getVehicleDataPage()	{
		vehicleDataPage = new VehicleDataPage(driver);
	 	return vehicleDataPage;
	}
	public InsurantDataPage getInsurantDataPage() {
		insurantDataPage = new InsurantDataPage(driver);
		return insurantDataPage;
	}
	public ProductDataPage getProductDataPage() {
		productDataPage = new ProductDataPage(driver);
		return productDataPage;
	}
	public PriceOptionDataPage getPriceOptionDataPage() {
		priceOptionDataPage = new PriceOptionDataPage(driver);
		return priceOptionDataPage;
	}
	public SendQuotePage getSendQuotePage() {
		sendQuotePage = new SendQuotePage(driver);
		return sendQuotePage;
	}
}
