package pageObjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class PriceOptionDataPage {
	public WebDriver driver;

	public PriceOptionDataPage(WebDriver driver)
	{
		this.driver = driver;
		
	}

	By silverRadioButton = By.id("selectsilver");
	By goldRadioButton = By.id("selectgold");
	By platiniumRadioButton = By.id("selectplatinum");
	By ultimateRadioButton = By.id("selectultimate");
	By viewQuoteButton = By.id("viewquote");
	By downloadQuoteButton = By.id("downloadquote");
	By nextButton = By.id("nextsendquote");
	By previousButton = By.id("prevselectpriceoption");
	By emailField = By.id("email");
	public void selectPriceOption (String option) {
		switch (option) {
			case "silver":
				driver.findElement(silverRadioButton).click();
				break;
			case "gold":
				driver.findElement(goldRadioButton).click();
				break;
			case "platinum":
				driver.findElement(platiniumRadioButton).click();
				break;
			case "ultimate":
				driver.findElement(ultimateRadioButton).click();
				break;
		}
	}
	public Boolean clickToViewQuote() {
		driver.findElement(viewQuoteButton).click();
		Boolean checkViewQuoteButton= new WebDriverWait(driver, Duration.ofSeconds(20))
				.until(ExpectedConditions.urlToBe("http://sampleapp.tricentis.com/101/tcpdf/pdfs/quote.php"));
		driver.close();
		return checkViewQuoteButton;
	}
	public Boolean clickToDownloadQuote() {
		driver.findElement(previousButton).click();
		driver.findElement(downloadQuoteButton).click();
		WebElement DownloadQuoteButton= new WebDriverWait(driver, Duration.ofSeconds(20))
				.until(ExpectedConditions.visibilityOf(driver.findElement(emailField)));
		Boolean checkDownloadQuoteButton = driver.findElement(emailField).isDisplayed();
		driver.findElement(previousButton).click();
		return checkDownloadQuoteButton;
	}
	public void clickOnNextButton () {
		driver.findElement(nextButton).click();
	}
	public Boolean checkRedirect(String redirect) {
		Boolean check;
		if(redirect.equalsIgnoreCase("true")) {
			WebElement waitForRedirect = new WebDriverWait(driver, Duration.ofSeconds(15))
					.until(ExpectedConditions.visibilityOf(driver.findElement(emailField)));
			check = driver.findElement(emailField).isDisplayed();
		}
		else {
			check = driver.findElement(silverRadioButton).isDisplayed();
		}
		return check;
	}
	public void selectPriceOption() {
		selectPriceOption("válido");
		clickOnNextButton();
	}
	
}
