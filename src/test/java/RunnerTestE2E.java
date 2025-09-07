import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

class RunnerTestE2E {

    @Test
    @DisplayName("Ejecución paralela Karate (falla si hay escenarios fallidos)")
    void testParallel() {
        int threads = Integer.parseInt(System.getProperty("threads", "4"));

        Results results = Runner.path("classpath:karate/e2e/add_Pet.feature")
                .outputCucumberJson(true)
                .parallel(threads);

        generateReport(results.getReportDir());

        // Totales compatibles con Karate 1.x
        int featuresTotal = results.getFeaturesPassed() + results.getFeaturesFailed();
        int scenariosTotal = results.getScenariosPassed() + results.getScenariosFailed();

        assertTrue(featuresTotal > 0, "No se ejecutó ningún feature (revisa la ruta/tags).");
        assertTrue(scenariosTotal > 0, "No se ejecutó ningún escenario (revisa filtros/tags).");

        // Falla el build si hubo fallos
        assertEquals(0, results.getFailCount(),
                "Escenarios fallidos: " + results.getFailCount() +
                        "\n" + results.getErrorMessages());
    }

    static void generateReport(String karateOutputPath) {
        File reportDir = new File(karateOutputPath);
        Collection<File> jsonFiles = org.apache.commons.io.FileUtils.listFiles(
                reportDir, new String[]{"json"}, true);

        List<String> jsonPaths = new ArrayList<>();
        for (File file : jsonFiles) {
            jsonPaths.add(file.getAbsolutePath());
        }

        File target = new File("target"); // en Gradle podría ser "build"
        Configuration config = new Configuration(target, "Karate E2E");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
