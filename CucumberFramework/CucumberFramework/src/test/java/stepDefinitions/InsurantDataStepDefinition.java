package stepDefinitions;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.WebDriver;
import pageObjects.InsurantDataPage;
import pageObjects.VehicleDataPage;
import utils.TestContextSetup;

import static org.testng.AssertJUnit.assertTrue;

public class InsurantDataStepDefinition {
	public VehicleDataPage vehicleDataPage;
	public InsurantDataPage insurantDataPage;
	TestContextSetup testContextSetup;
	//Spring framework, EJB,
//SRP
//
	public InsurantDataStepDefinition(TestContextSetup testContextSetup) {
		this.testContextSetup=testContextSetup;
		this.vehicleDataPage = testContextSetup.pageObjectManager.getVehicleDataPage();
		this.insurantDataPage = testContextSetup.pageObjectManager.getInsurantDataPage();
	}
	@Given("usuário preencheu corretamente o formulário de dados do veículo")
	public void usuário_preencheu_corretamente_o_formulário_de_dados_do_veículo() {
		vehicleDataPage.fillVehicleDataForm();
	}
	@When("^usuário informar (.+) primeiro nome$")
	public void usuário_informar_primeiro_nome(String firstName) {
		insurantDataPage.informFirstName(firstName);
	}
	@When("^usuário informar (.+) último nome$")
	public void usuário_informar_último_nome(String lastName) {
		insurantDataPage.informLastName(lastName);
	}
	@When("^usuário informar (.+) data de nascimento$")
	public void usuário_informar_data_de_nascimento(String dateOfBirth) {
		insurantDataPage.informDateOfBirth(dateOfBirth);
	}
	@When("^usuário selecionar (.+) gênero$")
	public void usuário_selecionar_gênero(String gender) {
		insurantDataPage.selectGender(gender);
	}
	@When("^usuário informar (.+) logradouro$")
	public void usuário_informar_logradouro(String streetAddress) {
		insurantDataPage.informStreetAddress(streetAddress);
	}
	@When("^usuário selecionar (.+) país$")
	public void usuário_selecionar_país(String country) {
		insurantDataPage.selectCountry(country);
	}
	@When("^usuário informar (.+) ZIP code$")
	public void usuário_informar_ZIP_code(String zipCode) {
		insurantDataPage.informZipCode(zipCode);
	}
	@When("^usuário informar (.+) cidade$")
	public void usuário_informar_cidade(String city) {
		insurantDataPage.informCity(city);
	}
	@When("^usuário selecionar (.+) ocupação$")
	public void usuário_selecionar_ocupação(String occupation) {
		insurantDataPage.selectOccupation(occupation);
	}
	@When("^usuário selecionar (.+) seus hobbies$")
	public void usuário_selecionar_seus_hobbies(String hobbies) {
		insurantDataPage.selectHobbies(hobbies);
	}
	@When("^usuário informar (.+) website$")
	public void usuário_informar_website(String website) {
		insurantDataPage.informWebsite(website);
	}
	@When("^usuário realizar upload (.+) de foto$")
	public void usuário_realizar_upload_de_foto(String picture) {
		insurantDataPage.selectPicture(picture);
	}
	@When("usuário clicar no botão next da página de dados do responsável")
	public void usuário_clicar_no_botão_next_da_página_de_dados_do_responsável() {
		insurantDataPage.clickOnNextButton();
	}
	@Then("^usuário será redirecionado (.+) para formulário de dados do produto$")
	public void usuário_será_redirecionado_para_formulário_de_dados_do_produto(String redirect) {
		assertTrue(insurantDataPage.checkRedirect(redirect));
	}
	
}
