package stepDefinitions;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.WebDriver;
import pageObjects.*;
import utils.TestContextSetup;

import static org.testng.AssertJUnit.assertTrue;

public class SendQuoteStepDefinition {
	public WebDriver driver;
	public VehicleDataPage vehicleDataPage;
	public InsurantDataPage insurantDataPage;
	public ProductDataPage productDataPage;
	public PriceOptionDataPage priceOptionDataPage;
	public SendQuotePage sendQuotePage;
	TestContextSetup testContextSetup;
	//Spring framework, EJB,
//SRP
//
	public SendQuoteStepDefinition(TestContextSetup testContextSetup) {
		this.testContextSetup=testContextSetup;
		this.vehicleDataPage = testContextSetup.pageObjectManager.getVehicleDataPage();
		this.insurantDataPage = testContextSetup.pageObjectManager.getInsurantDataPage();
		this.productDataPage = testContextSetup.pageObjectManager.getProductDataPage();
		this.priceOptionDataPage = testContextSetup.pageObjectManager.getPriceOptionDataPage();
		this.sendQuotePage = testContextSetup.pageObjectManager.getSendQuotePage();
	}
	@Given("usuário selecionar corretamente opção de preço")
	public void usuário_selecionar_corretamente_opção_de_preço() {
		vehicleDataPage.fillVehicleDataForm();
		insurantDataPage.fillInsurantDataForm();
		productDataPage.fillProductDataForm();
		priceOptionDataPage.selectPriceOption();
	}
	@When("^usuário informar (.+) email$")
	public void usuário_informar_email(String email) {
		sendQuotePage.informEmail(email);
	}
	@When("^usuário informar (.+) telefone$")
	public void usuário_informar_telefone(String phone) {
		sendQuotePage.informPhone(phone);
	}
	@When("^usuário informar (.+) nome de usuário$")
	public void usuário_informar_nome_de_usuário(String username) {
		sendQuotePage.informUsername(username);
	}
	@When("^usuário informar (.+) senha$")
	public void usuário_informar_senha(String password) {
		sendQuotePage.informPassword(password);
	}
	@When("^usuário informar (.+) senha (.+) novamente$")
	public void usuário_informar_senha_novamente(String confirmPassword, String password) {
		sendQuotePage.confirmPassword(confirmPassword, password);
	}
	@When("^usuário informar (.+) comentários$")
	public void usuário_informar_comentários(String comments) {
		sendQuotePage.informComments(comments);
	}
	@When("usuário clicar no botão send")
	public void usuário_clicar_no_botão_send() {
		sendQuotePage.clickOnSendButton();
	}
	@Then("^proposta (.+) será enviada$")
	public void proposta_será_enviada(String status) {
		assertTrue(sendQuotePage.checkRedirect(status));
	}
	
}
