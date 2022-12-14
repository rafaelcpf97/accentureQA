package stepDefinitions;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.WebDriver;
import pageObjects.VehicleDataPage;
import utils.TestContextSetup;

import static org.testng.AssertJUnit.assertTrue;

public class VehicleDataStepDefinition {
	public WebDriver driver;
	public VehicleDataPage vehicleDataPage;
	TestContextSetup testContextSetup;
	//Spring framework, EJB,
//SRP
//
	public VehicleDataStepDefinition(TestContextSetup testContextSetup) {
		this.testContextSetup=testContextSetup;
		this.vehicleDataPage = testContextSetup.pageObjectManager.getVehicleDataPage();
	}
	@Given("usuário acessou página do formulário de dados do veículo")
	public void usuário_acessou_página_do_formulário_de_dados_do_veículo() {
		assertTrue(vehicleDataPage.getPage());
	}
	@When("^usuário selecionar (.+) marca do veículo$")
	public void usuário_selecionar_marca_do_veículo(String make) {
		vehicleDataPage.selectVehicleMaker(make);
	}
	@When("^usuário informar (.+) desempenho do motor$")
	public void usuário_informar_desempenho_do_motor(String enginePerformance) {
		vehicleDataPage.informEnginePerformance(enginePerformance);
	}
	@When("^usuário informar (.+) data de fabricação$")
	public void usuário_informar_data_de_fabricação(String dateOfManufacture) {
		vehicleDataPage.informDateOfManufacture(dateOfManufacture);
	}
	@When("^usuário selecionar (.+) número de bancos$")
	public void usuário_selecionar_número_de_bancos(String numberOfSeats) {
		vehicleDataPage.selectNumberOfSeats(numberOfSeats);
	}
	@When("^usuário selecionar (.+) tipo de combustível$")
	public void usuário_selecionar_tipo_de_combustível(String fuelType) {
		vehicleDataPage.selectFuelType(fuelType);
	}
	@When("^usuário informar (.+) preço listado$")
	public void usuário_informar_preço_listado(String listPrice) {
		vehicleDataPage.informListPrice(listPrice);
	}
	@When("^usuário informar (.+) número da placa$")
	public void usuário_informar_número_da_placa(String licensePlateNumber) {
		vehicleDataPage.informeLicensePlateNumber(licensePlateNumber);
	}
	@When("^usuário informar (.+) quilometragem$")
	public void usuário_informar_quilometragem(String annualMileage) {
		vehicleDataPage.informAnnualMileage(annualMileage);
	}
	@When("usuário clicar no botão next da página de dados do veículo")
	public void usuário_clicar_no_botão_next_da_página_de_dados_do_veículo() {
		vehicleDataPage.clickOnNextButton();
	}
	@Then("^usuário será redirecionado (.+) para formulário de dados do assegurado$")
	public void usuário_será_redirecionado_para_formulário_de_dados_do_assegurado(String redirect) {
		assertTrue(vehicleDataPage.checkRedirect(redirect));
	}
	
}
