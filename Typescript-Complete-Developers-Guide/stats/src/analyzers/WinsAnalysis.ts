import { MatchData } from '../MatchData';
import {Analyzer} from '../Summary'
import {MatchResult} from '../MatchResult'

export class WinsAnalysis implements Analyzer {
  constructor(public team: string) {}

  run(matches: MatchData[]): string {
    
    let wins = 0;
    let total = 0;
    for (let match of matches) {
      total++;
      if (match[1] === 'Man United' && match[5] === MatchResult.HomeWin) {
        wins++;
      } else if (match[2] === 'Man United' && match[5] === MatchResult.AwayWin) {
        wins++;
      }
    }

    return `This team won ${wins} of ${total} games.`
  }

}