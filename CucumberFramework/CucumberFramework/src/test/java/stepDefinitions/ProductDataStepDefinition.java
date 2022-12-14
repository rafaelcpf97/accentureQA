package stepDefinitions;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.WebDriver;
import pageObjects.InsurantDataPage;
import pageObjects.ProductDataPage;
import pageObjects.VehicleDataPage;
import utils.TestContextSetup;

import static org.testng.AssertJUnit.assertTrue;

public class ProductDataStepDefinition {
	public WebDriver driver;
	public VehicleDataPage vehicleDataPage;
	public InsurantDataPage insurantDataPage;
	public ProductDataPage productDataPage;
	TestContextSetup testContextSetup;
	//Spring framework, EJB,
//SRP
//
	public ProductDataStepDefinition(TestContextSetup testContextSetup) {
		this.testContextSetup=testContextSetup;
		this.vehicleDataPage = testContextSetup.pageObjectManager.getVehicleDataPage();
		this.insurantDataPage = testContextSetup.pageObjectManager.getInsurantDataPage();
		this.productDataPage = testContextSetup.pageObjectManager.getProductDataPage();
	}
	@Given("usuário preencheu corretamente o formulário de dados do responsável")
	public void usuário_preencheu_corretamente_o_formulário_de_dados_do_responsável() {
		vehicleDataPage.fillVehicleDataForm();
		insurantDataPage.fillInsurantDataForm();
	}
	@When("^usuário informar (.+) data de início$")
	public void usuário_informar_data_de_início(String startDate) {
		productDataPage.informStartDate(startDate);
	}
	@When("^usuário selecionar (.+) valor do seguro$")
	public void usuário_selecionar_valor_do_seguro(String insuranceSum) {
		productDataPage.selectInsuranceSum(insuranceSum);
	}
	@When("^usuário selecionar (.+) avalição de mérito$")
	public void usuário_selecionar_avalição_de_mérito(String meritRating) {
		productDataPage.selectMeritRating(meritRating);
	}
	@When("^usuário selecionar (.+) seguro de danos$")
	public void usuário_selecionar_seguro_de_danos(String damageInsurance) {
		productDataPage.selectDamageInsurance(damageInsurance);
	}
	@When("^usuário selecionar (.+) produtos opcionais$")
	public void usuário_selecionar_produtos_opcionais(String optionalProducts) {
		productDataPage.selectOptionalProducts(optionalProducts);
	}
	@When("^usuário selecionar (.+) carro de cortesia$")
	public void usuário_selecionar_carro_de_cortesia(String courtesyCar) {
		productDataPage.selectCourtesyCar(courtesyCar);
	}
	@When("usuário clicar no botão next da página de dados do produto")
	public void usuário_clicar_no_botão_next_da_página_de_dados_do_produto() {
		productDataPage.clickOnNextButton();
	}
	@Then("^usuário será redirecionado (.+) para opções de preço$")
	public void usuário_será_redirecionado_para_opções_de_preço(String redirect) {
		assertTrue(productDataPage.checkRedirect(redirect));
	}
	
}
