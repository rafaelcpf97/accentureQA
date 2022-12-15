package stepDefinitions;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.WebDriver;
import pageObjects.InsurantDataPage;
import pageObjects.PriceOptionDataPage;
import pageObjects.ProductDataPage;
import pageObjects.VehicleDataPage;
import utils.TestContextSetup;

import java.text.ParseException;

import static org.testng.AssertJUnit.assertTrue;

public class PriceOptionDataStepDefinition {
	public WebDriver driver;
	public VehicleDataPage vehicleDataPage;
	public InsurantDataPage insurantDataPage;
	public ProductDataPage productDataPage;
	public PriceOptionDataPage priceOptionDataPage;
	TestContextSetup testContextSetup;
	//Spring framework, EJB,
//SRP
//
	public PriceOptionDataStepDefinition(TestContextSetup testContextSetup) {
		this.testContextSetup=testContextSetup;
		this.vehicleDataPage = testContextSetup.pageObjectManager.getVehicleDataPage();
		this.insurantDataPage = testContextSetup.pageObjectManager.getInsurantDataPage();
		this.productDataPage = testContextSetup.pageObjectManager.getProductDataPage();
		this.priceOptionDataPage = testContextSetup.pageObjectManager.getPriceOptionDataPage();
	}
	@Given("usuário preencheu corretamente o formulário de dados do produto")
	public void usuário_preencheu_corretamente_o_formulário_de_dados_do_produto() throws ParseException {
		vehicleDataPage.fillVehicleDataForm();
		insurantDataPage.fillInsurantDataForm();
		productDataPage.fillProductDataForm();
	}
	@When("^usuário selecionar (.+) opção de plano$")
	public void usuário_selecionar_opção_de_plano(String option) {
		priceOptionDataPage.selectPriceOption(option);
	}
	@When("usuário clicar para visualizar proposta")
	public void usuário_clicar_para_visualizar_proposta() {
		assertTrue(priceOptionDataPage.clickToViewQuote());
	}
	@When("usuário clicar para baixar proposta")
	public void usuário_clicar_para_baixar_proposta() {
		assertTrue(priceOptionDataPage.clickToDownloadQuote());
	}
	@When("usuário clicar no botão next da página de opção de preço")
	public void usuário_clicar_no_botão_next_da_página_de_opção_de_preço() {
		priceOptionDataPage.clickOnNextButton();
	}
	@Then("^usuário será redirecionado (.+) para enviar proposta$")
	public void usuário_será_redirecionado_para_enviar_proposta(String redirect) {
		assertTrue(priceOptionDataPage.checkRedirect(redirect));
	}
	
}
