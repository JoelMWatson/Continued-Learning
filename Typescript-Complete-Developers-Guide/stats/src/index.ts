import { MatchReader } from './MatchReader';
import { CsvFileReader } from './CsvFileReader';
import { Summary } from './Summary';
import { WinsAnalysis } from './analyzers/WinsAnalysis';
import { ConsoleReport } from './reportTargets/ConsoleReport';
import { HtmlReport } from './reportTargets/HtmlReport';

// OBJ implementing DataReader interface
const csvFileReader = new CsvFileReader('football.csv');
// OBJ to pass DataReader to, which supplies the tuple type
const matchReader = new MatchReader(csvFileReader);

// load to matchReader.matches
matchReader.load();

// set analysis and output
// const summary = new Summary(
//   new WinsAnalysis('Man United'),
//   new HtmlReport() //  new ConsoleReport()
// );

const summary = Summary.defaultReport('Man United');

// run the report
summary.buildAndPrintReport(matchReader.matches)
