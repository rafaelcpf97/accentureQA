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
import java.util.Properties;
import java.util.Random;

public class VehicleDataPage {
	public WebDriver driver;

	public VehicleDataPage(WebDriver driver)
	{
		this.driver = driver;
		
	}
	By makeDropDown = By.id("make");
	By modelDropDown = By.id("model");
	By cylinderCapacityField = By.id("cylindercapacity");
	By enginePerformanceField = By.id("engineperformance");
	By dateOfManufactureField = By.id("dateofmanufacture");
	By numberOfSeatsDropDown = By.id("numberofseats");
	By fuelTypeDropDown = By.id("fuel");
	By listPriceField = By.id("listprice");
	By licensePlateNumberField = By.id("licenseplatenumber");
	By annualMileageField = By.id("annualmileage");
	By nextButton = By.id("nextenterinsurantdata");
	By firstNameField = By.id("firstname");

	public Boolean getPage() {
		Boolean checkCurrentUrl = new WebDriverWait(driver, Duration.ofSeconds(5))
				.until(ExpectedConditions.urlToBe("http://sampleapp.tricentis.com/101/app.php"));
		Boolean checkVisibilityOfFirstElement = driver.findElement(makeDropDown).isDisplayed();
		return checkCurrentUrl && checkVisibilityOfFirstElement;
	}
	public void selectVehicleMaker(String make) {
		if(make.contains("válido")) {
			Select makeDD = new Select(driver.findElement(makeDropDown));
			makeDD.selectByIndex(1);
		}
	}
	public void informEnginePerformance (String enginePerformance) {
		if(!enginePerformance.equalsIgnoreCase("null")) {
			driver.findElement(enginePerformanceField).sendKeys(enginePerformance);
		}
	}
	public void informDateOfManufacture (String dateOfManufacture) {
		LocalDate todayUnformatted = LocalDate.now();
		DateTimeFormatter dtfMain = DateTimeFormatter.ofPattern("dd/MM/aaaa");
		LocalDate today = LocalDate.parse(todayUnformatted.format(dtfMain));

		DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("ddMMaaaa");
		LocalDate today1 = LocalDate.parse(todayUnformatted.format(dtf1));

		DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern("MM/dd/aaaa");
		LocalDate today2 = LocalDate.parse(todayUnformatted.format(dtf2));

		String dateOfManufactureToInput = "";
		if(!dateOfManufacture.equalsIgnoreCase("null")) {
			switch(dateOfManufacture) {
				case "-50 anos":
					dateOfManufactureToInput = String.valueOf(today.minus(50L, ChronoUnit.YEARS));
					break;
				case "dia anterior":
					dateOfManufactureToInput = String.valueOf(today.minus(1L, ChronoUnit.DAYS));
					break;
				case "hoje":
					dateOfManufactureToInput = String.valueOf(today);
					break;
				case "amanhã":
					dateOfManufactureToInput = String.valueOf(today.plus(1L, ChronoUnit.DAYS));
					break;
				case "+50 anos":
					dateOfManufactureToInput = String.valueOf(today.plus(50L, ChronoUnit.YEARS));
					break;
				case "ddMMaaaa":
					dateOfManufactureToInput = String.valueOf(today1);
					break;
				case "MM/dd/aaaa":
					dateOfManufactureToInput = String.valueOf(today2);
					break;
			}
			driver.findElement(dateOfManufactureField).sendKeys(dateOfManufactureToInput);
		}
	}
	public void selectNumberOfSeats (String numberOfSeats) {
		if(numberOfSeats.contains("válido")) {
			Select numberOfSeatsDD = new Select(driver.findElement(numberOfSeatsDropDown));
			numberOfSeatsDD.selectByIndex(1);
		}
	}
	public void selectFuelType (String fuelType) {
		if(fuelType.contains("válido")) {
			Select fuelTypeDD = new Select(driver.findElement(fuelTypeDropDown));
			fuelTypeDD.selectByIndex(1);
		}
	}
	public void informListPrice (String listPrice) {
		if(!listPrice.equalsIgnoreCase("null")) {
			driver.findElement(listPriceField).sendKeys(listPrice);
		}
	}
	public void informeLicensePlateNumber (String licensePlateNumber) {
		if(!licensePlateNumber.equalsIgnoreCase("null")) {
			driver.findElement(licensePlateNumberField).sendKeys(licensePlateNumber);
		}
	}
	public void informAnnualMileage (String annualMileage) {
		if(!annualMileage.equalsIgnoreCase("null")) {
			driver.findElement(annualMileageField).sendKeys(annualMileage);
		}
	}
	public void clickOnNextButton () {
		driver.findElement(nextButton).click();
	}
	public Boolean checkRedirect(String redirect) {
		Boolean check;
		if(redirect.equalsIgnoreCase("true")) {
			WebElement waitForRedirect = new WebDriverWait(driver, Duration.ofSeconds(15))
					.until(ExpectedConditions.visibilityOf(driver.findElement(firstNameField)));
			check = driver.findElement(firstNameField).isDisplayed();
		}
		else {
			check = driver.findElement(makeDropDown).isDisplayed();
		}
		return check;
	}
	public void fillVehicleDataForm() {
		getPage();
		selectVehicleMaker("válido");
		informEnginePerformance("1");
		informDateOfManufacture("hoje");
		selectNumberOfSeats("válido");
		selectFuelType("válido");
		informListPrice("500");
		informeLicensePlateNumber("abcde1");
		informAnnualMileage("100");
		clickOnNextButton();
	}
	
}
