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

public class InsurantDataPage {
	public WebDriver driver;

	public InsurantDataPage(WebDriver driver)
	{
		this.driver = driver;
		
	}
	By firstNameField = By.id("firstname");
	By lastnameField = By.id("lastname");
	By dateOfBirthField = By.id("birthdate");
	By genderMaleRadioButton = By.id("gendermale");
	By genderFemaleRadioButton = By.id("genderfemale");
	By streetAddressField = By.id("streetaddress");
	By countryDropDown = By.id("country");
	By zipCodeField = By.id("zipcode");
	By cityField = By.id("city");
	By occupationDropDown = By.id("occupation");
	By hobbiesCheckBox = By.name("Hobbies");
	By websiteField = By.id("website");
	By pictureField = By.id("picture");
	By nextButton = By.id("nextenterproductdata");
	By startDateField = By.id("startdate");
	public void informFirstName(String firstName) {
		if(!firstName.equalsIgnoreCase("null")) {
			driver.findElement(firstNameField).sendKeys(firstName);
		}
	}
	public void informLastName(String lastName) {
		if(!lastName.equalsIgnoreCase("null")) {
			driver.findElement(lastnameField).sendKeys(lastName);
		}
	}
	public void informDateOfBirth (String dateOfBirth) {
		LocalDate todayUnformatted = LocalDate.now();
		DateTimeFormatter dtfMain = DateTimeFormatter.ofPattern("dd/MM/aaaa");
		LocalDate today = LocalDate.parse(todayUnformatted.format(dtfMain));

		DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("ddMMaaaa");
		LocalDate today1 = LocalDate.parse(todayUnformatted.format(dtf1));

		DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern("MM/dd/aaaa");
		LocalDate today2 = LocalDate.parse(todayUnformatted.format(dtf2));

		String dateOfBirthToInput = "";
		if(!dateOfBirth.equalsIgnoreCase("null")) {
			switch(dateOfBirth) {
				case "71 anos":
					dateOfBirthToInput = String.valueOf(today.minus(71L, ChronoUnit.YEARS));
					break;
				case "70 anos":
					dateOfBirthToInput = String.valueOf(today.minus(70L, ChronoUnit.YEARS));
					break;
				case "20 anos":
					dateOfBirthToInput = String.valueOf(today.minus(20L, ChronoUnit.YEARS));
					break;
				case "18 anos":
					dateOfBirthToInput = String.valueOf(today.minus(18L, ChronoUnit.YEARS));
					break;
				case "17 anos":
					dateOfBirthToInput = String.valueOf(today.minus(17L, ChronoUnit.YEARS));
					break;
				case "hoje":
					dateOfBirthToInput = String.valueOf(today);
					break;
				case "ddMMaaaa":
					dateOfBirthToInput = String.valueOf(today1);
					break;
				case "MM/dd/aaaa":
					dateOfBirthToInput = String.valueOf(today2);
					break;
			}
			driver.findElement(dateOfBirthField).sendKeys(dateOfBirthToInput);
		}
	}
	public void selectGender(String gender) {
		if(gender.equalsIgnoreCase("male")) {
			driver.findElement(genderMaleRadioButton).click();
		} else if (gender.equalsIgnoreCase("female")) {
			driver.findElement(genderFemaleRadioButton).click();
		}
	}
	public void informStreetAddress(String streetAddress) {
		if(!streetAddress.equalsIgnoreCase("null")) {
			driver.findElement(streetAddressField).sendKeys(streetAddress);
		}
	}
	public void selectCountry(String country) {
		if(country.contains("válido")) {
			Select countryDD = new Select(driver.findElement(countryDropDown));
			countryDD.selectByIndex(1);
		}
	}
	public void informZipCode(String zipCode) {
		if(!zipCode.equalsIgnoreCase("null")) {
			driver.findElement(zipCodeField).sendKeys(zipCode);
		}
	}
	public void informCity(String city) {
		if(!city.equalsIgnoreCase("null")) {
			driver.findElement(cityField).sendKeys(city);
		}
	}
	public void selectOccupation(String occupation) {
		if(occupation.contains("válido")) {
			Select occupationDD = new Select(driver.findElement(occupationDropDown));
			occupationDD.selectByIndex(1);
		}
	}
	public void selectHobbies(String hobbies) {
		if(hobbies.contains("1")) {
			driver.findElements(hobbiesCheckBox).get(1).click();
		} else if (hobbies.contains("todas")) {
			Integer hobbiesLength = driver.findElements(hobbiesCheckBox).size();
			for(int i = 0; i < hobbiesLength; i++) {
				driver.findElements(hobbiesCheckBox).get(i).click();
			}
		}
	}
	public void informWebsite(String website) {
		if(!website.equalsIgnoreCase("null")) {
			driver.findElement(websiteField).sendKeys(website);
		}
	}
	public void selectPicture(String picture) {
		if(!picture.equalsIgnoreCase("null")) {
			switch (picture) {
				case ".pdf":
					driver.findElement(pictureField).sendKeys("");
					break;
				case ".csv":
					driver.findElement(pictureField).sendKeys("");
					break;
				case ".mp4":
					driver.findElement(pictureField).sendKeys("");
					break;
				case ".jpg 5 MB":
					driver.findElement(pictureField).sendKeys("");
					break;
				case ".jpg 100 MB":
					driver.findElement(pictureField).sendKeys("");
					break;
			}
		}
	}
	public void clickOnNextButton() {
		driver.findElement(nextButton).click();
	}
	public Boolean checkRedirect(String redirect) {
		Boolean check;
		if(redirect.equalsIgnoreCase("true")) {
			WebElement waitForRedirect = new WebDriverWait(driver, Duration.ofSeconds(15))
					.until(ExpectedConditions.visibilityOf(driver.findElement(startDateField)));
			check = driver.findElement(startDateField).isDisplayed();
		}
		else {
			check = driver.findElement(firstNameField).isDisplayed();
		}
		return check;
	}
	public void fillInsurantDataForm() {
		informFirstName("Joao");
		informLastName("Joao");
		informDateOfBirth("20 anos");
		selectGender("male");
		informStreetAddress("abc");
		selectCountry("valor válido");
		informZipCode("12345678");
		informCity("abc");
		selectOccupation("valor válido");
		selectHobbies("1 seleção");
		informWebsite("www.google.com");
		selectPicture(".jpg 5 MB");
		clickOnNextButton();
	}
}
