package pageObjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

public class SendQuotePage {
	public WebDriver driver;

	public SendQuotePage(WebDriver driver)
	{
		this.driver = driver;
		
	}

	By emailField = By.id("email");
	By phoneField = By.id("phone");
	By userNameField = By.id("username");
	By passwordField = By.id("password");
	By confirmPasswordField = By.id("confirmpassword");
	By commentsField = By.id("Comments");
	By sendButton = By.id("sendemail");
	By successButton = By.className("confirm");

	public void informEmail(String email) {
		if(!email.equalsIgnoreCase("null")) {
			WebElement wait = new WebDriverWait(driver, Duration.ofSeconds(15))
					.until(ExpectedConditions.visibilityOf(driver.findElement(emailField)));
			driver.findElement(emailField).sendKeys(email);
		}
	}
	public void informPhone(String phone) {
		if(!phone.equalsIgnoreCase("null")) {
			driver.findElement(phoneField).sendKeys(phone);
		}
	}
	public void informUsername(String username) {
		if(!username.equalsIgnoreCase("null")) {
			driver.findElement(userNameField).sendKeys(username);
		}
	}
	public void informPassword(String password) {
		if(!password.equalsIgnoreCase("null")) {
			driver.findElement(passwordField).sendKeys(password);
		}
	}
	public void confirmPassword(String confirmPassword, String password) {
		if(confirmPassword.equalsIgnoreCase("igual")) {
			driver.findElement(confirmPasswordField).equals(password);
		} else if(confirmPassword.equalsIgnoreCase("diferente")) {
			driver.findElement(confirmPasswordField).sendKeys("Abcde2");
		}
	}
	public void informComments(String comments) {
		if(!comments.equalsIgnoreCase("null")) {
			driver.findElement(commentsField).sendKeys(comments);
		}
	}
	public void clickOnSendButton() {
		driver.findElement(sendButton).click();
	}
	public Boolean checkRedirect(String status) {
		Boolean check;
		if(status.equalsIgnoreCase("true")) {
			WebElement waitForRedirect = new WebDriverWait(driver, Duration.ofSeconds(15))
					.until(ExpectedConditions.visibilityOf(driver.findElement(successButton)));
			check = driver.findElement(successButton).isDisplayed();
			driver.findElement(successButton).click();
		}
		else {
			check = driver.findElement(emailField).isDisplayed();
		}
		return check;
	}
}
