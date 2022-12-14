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

public class ProductDataPage {
	public WebDriver driver;

	public ProductDataPage(WebDriver driver)
	{
		this.driver = driver;
		
	}
	By startDateField = By.id("startdate");
	By insuranceSumDropDown = By.id("insurancesum");
	By meritRatingDropDown = By.id("meritrating");
	By damageInsuranceDropDown = By.id("damageinsurance");
	By euroProtectionCheckBox = By.id("EuroProtection");
	By legalDefenseInsuranceCheckBox = By.id("LegalDefenseInsurance");
	By courtesyCarDropDown = By.id("courtesycar");
	By nextButton = By.id("nextselectpriceoption");
	By silverRadioButton = By.id("selectsilver");

	public void informStartDate (String startDate) {
		LocalDate todayUnformatted = LocalDate.now();
		DateTimeFormatter dtfMain = DateTimeFormatter.ofPattern("MM/dd/aaaa");
		LocalDate today = LocalDate.parse(todayUnformatted.format(dtfMain));

		DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("ddMMaaaa");
		LocalDate today1 = LocalDate.parse(todayUnformatted.format(dtf1));

		DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern("dd/MM/aaaa");
		LocalDate today2 = LocalDate.parse(todayUnformatted.format(dtf2));

		String startDateToInput = "";
		if(!startDate.equalsIgnoreCase("null")) {
			switch(startDate) {
				case "1 mês anterior":
					startDateToInput = String.valueOf(today.minus(1L, ChronoUnit.MONTHS));
					break;
				case "hoje":
					startDateToInput = String.valueOf(today);
					break;
				case "1 mês no futuro":
					startDateToInput = String.valueOf(today.plus(1L, ChronoUnit.MONTHS));
					break;
				case "30 dias no futuro":
					startDateToInput = String.valueOf(today.plus(30L, ChronoUnit.DAYS));
					break;
				case "1 ano no futuro":
					startDateToInput = String.valueOf(today.plus(1L, ChronoUnit.YEARS));
					break;
				case "ddMMaaaa":
					startDateToInput = String.valueOf(today1);
					break;
				case "MM/dd/aaaa":
					startDateToInput = String.valueOf(today2);
					break;
			}
			driver.findElement(startDateField).sendKeys(startDateToInput);
		}
	}
	public void selectInsuranceSum (String insuranceSum) {
		if(insuranceSum.contains("válido")) {
			Select insuranceSumDD = new Select(driver.findElement(insuranceSumDropDown));
			insuranceSumDD.selectByIndex(1);
		}
	}
	public void selectMeritRating(String meritRating) {
		if(meritRating.contains("válido")) {
			Select meritRatingDD = new Select(driver.findElement(meritRatingDropDown));
			meritRatingDD.selectByIndex(1);
		}
	}
	public void selectDamageInsurance(String damageInsurance) {
		if(damageInsurance.contains("válido")) {
			Select damageInsuranceDD = new Select(driver.findElement(damageInsuranceDropDown));
			damageInsuranceDD.selectByIndex(1);
		}
	}
	public void selectOptionalProducts (String optionalProducts) {
		if(optionalProducts.contains("1")) {
			driver.findElement(euroProtectionCheckBox).click();
		} else if (optionalProducts.contains("todos")) {
			driver.findElement(euroProtectionCheckBox).click();
			driver.findElement(legalDefenseInsuranceCheckBox).click();
		}
	}
	public void selectCourtesyCar(String courtesyCar) {
		if(courtesyCar.contains("válido")) {
			Select courtesyCarDD = new Select(driver.findElement(courtesyCarDropDown));
			courtesyCarDD.selectByIndex(1);
		}
	}
	public void clickOnNextButton () {
		driver.findElement(nextButton).click();
	}
	public Boolean checkRedirect(String redirect) {
		Boolean check;
		if(redirect.equalsIgnoreCase("true")) {
			WebElement waitForRedirect = new WebDriverWait(driver, Duration.ofSeconds(15))
					.until(ExpectedConditions.visibilityOf(driver.findElement(silverRadioButton)));
			check = driver.findElement(silverRadioButton).isDisplayed();
		}
		else {
			check = driver.findElement(startDateField).isDisplayed();
		}
		return check;
	}
	public void fillProductDataForm() {
		informStartDate("hoje");
		selectInsuranceSum("válido");
		selectMeritRating("válido");
		selectDamageInsurance("válido");
		selectOptionalProducts("1");
		selectCourtesyCar("válido");
		clickOnNextButton();
	}
	
}
