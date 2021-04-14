import { TestBed } from '@angular/core/testing';

import { MemberDetailedResolver } from './member-detailed.resolver';

describe('MemberDetailedResolver', () => {
  let resolver: MemberDetailedResolver;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    resolver = TestBed.inject(MemberDetailedResolver);
  });

  it('should be created', () => {
    expect(resolver).toBeTruthy();
  });
});
