Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF0DA35
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 23:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721432323; cv=fail; b=dLEYerXxZQHmKam3v/FaDa7loR3dLPzfzRCJlg1+OtCzBjfJdKf6zcDogvxh29iYUC3zAxadwxwHp3443cOWw1Uaz3GLvHEXg1ZCTGoYgD4kOlxImux+CBiiUcXuNsnPmqYaeZa/RPY5namTeFPj0dGPcNIuQrF2ONV8+FSw1dI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721432323; c=relaxed/simple;
	bh=KZl2XcpyVPXkOZ0BS+3bVu3WvRSxO5Sv1LZ6ZWPiw0w=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MaclbblSJo2Emroo7AHc1yWNne1TdrRDdb9tOk8lGphQ00YbhdPXyl9UUajCw9Sx1EzsCj9I4T2WXEPplA90+dMUBBagvDtqXQsKOQtVV5nFSKoyBfPuOOo8Qq6zVAx7l3UUHt32GFxixgjaptbDFqYPd4+RucYmIMkaxUbVcqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CKsd3pLu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rCBSDOUB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CKsd3pLu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rCBSDOUB"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JNFdEt031240
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 23:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=yxY92wzsS7h87Pa2AjA/dB8F6hqZ9ScVxAGHlE9FKbU=; b=
	CKsd3pLuUDIbR8R0AeXsZOcX0mqzrFNynZASWm5/zRqbGe4oVsp4YagHtTn6sOnC
	NOp4hxhUR9gKRFJXHK/GvFKHGQI51UekmVsGi3s+CBOjPq3IFCdDedpkhqh5LbMI
	m1D+Qm35cHKFi+n9YfHBr4qNKw6fQrUtMvZxeBMYRLO6oJAmaMtufzb2rNFEOTLA
	OGbuxCgcrgG5+FjEiS2lHLPUNDQ2L2Az7I4tmbS3jbim3NJdWWFAo+UJfhv4Yj7m
	pddj7+i0zbUjiE6vadKYma0n8dmJS8SxWCK/cNP4pS4mrZ00k99bP2S5rrcJjIfV
	mfIxdc/UYXh/TqsvQEStpg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40g1ner0k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 23:38:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46JLrrXa021743
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 23:38:40 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwewg0sw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 23:38:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olmBQBLIdKKIjoq7xlXmMsMsc/o6lwi/NjEehCWXxOH3Fs+/hMUsp1apIw80s93yqMEwUROI6fDRueLXImnR6NZkmj3jwWAC2rkXJ45RHdP2Y5jgNO8i11X81YnfgFPWzwrFT9TTq42Z/WuAZVYyJddrKIfuSv5o1xDsSBxl711D8EPznTboDPYQJn7dU9IhyebqjQAwlSPwD3+bEjn1IO/APs7wuH7g9UljI1YqAUjN4y5R25Gvo7FkfzfKDeb+uYDbFAStPvAmEzyWH4IzeEJK8jfDW9irLXaM7IOtj0hCer9a47ZS9KQefTvPMjR1CuLGBUZsLFPasaYoUWiEIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxY92wzsS7h87Pa2AjA/dB8F6hqZ9ScVxAGHlE9FKbU=;
 b=XVIxMiJ2WxIx7vXnvnx/QSMHef+pjyD46YjDegFYRk4EhNLGzR8kZh4gHRlXwwH3veAUOKUPtKHfhU4ycFji04ltieaPE0Kri9vMer95vvouy8tMFbxLKRkSO0yP6LVdmFy7nV6XPIUowu+G/n1f0fveO9KpsywKEmGbdcDzQn5xGawmIEOGI2F4+fdjlUgPp2QkorkXyAPe1rZkIatqGKTVh/3L/EZTjBBzMsqQIiWWw0GZBW/wQnn/O2tyRExZd1LE3JGjselvg1PIM3TpxOw8kVq2l9D5Ek4ZzV4M4ysSknCKrAfaK/ts/KcoRDc+5BDmZo0oDOxcX3kvbx2QaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxY92wzsS7h87Pa2AjA/dB8F6hqZ9ScVxAGHlE9FKbU=;
 b=rCBSDOUBqqwwN2OtUft8i/QXxQ3rbtcYjce6NZZOj8eXhJtuC0otX2BSqwetrh9crSzGCgus0hZK35ffWn0nTl7njZqkucs1H3oiSedLJS+0Sla9n+mdCYlarkafEq2m2J/VxtgulaOFs6exwbqB9xXvzYyJgHLQKI5uYAOVQXc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BY5PR10MB4321.namprd10.prod.outlook.com (2603:10b6:a03:202::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Fri, 19 Jul
 2024 23:38:36 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 23:38:36 +0000
Message-ID: <01ed8c58-ee33-c568-0767-2e246564e1a2@oracle.com>
Date: Fri, 19 Jul 2024 19:38:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 26/38] test: Annotate xfail (chill not implemented yet)
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-7-eugene.loh@oracle.com> <ZprWruD8mYUA7zW0@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZprWruD8mYUA7zW0@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR1501CA0014.namprd15.prod.outlook.com
 (2603:10b6:207:17::27) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BY5PR10MB4321:EE_
X-MS-Office365-Filtering-Correlation-Id: 2382a709-ad2c-48eb-5ea8-08dca84be902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?USs5L1Z5clY1Z3lBZ0Flb2tnQTRZMXdqbHpTcWJsZG1DMlp5b3ZYUTFBeVpt?=
 =?utf-8?B?bkQxcDFkNDdhelpIUTFWdmRxaUdHUTYxQXU3T21NQVhSdExySUdidzlnZDRY?=
 =?utf-8?B?RkVrbENmQzJXWmxXNWpZcmxudGZWcWJzaFJBMHlBQXFUQ2RocFk1SDFtVlhs?=
 =?utf-8?B?QWs5U1E5cTJJTkUwdm9yeEdhdmNydUFoK1JKZldGUmgwOVNxcGhPd2NTUlpZ?=
 =?utf-8?B?OXkzQlJEMVlSa3FLVWV1blJjU2hmY1RuaGR6cFdOS2IvVFZxamhVcGJqRW1x?=
 =?utf-8?B?eVl2dlloWEg5czlZMGhWaEVVSFpUNTFaZ0pyVUNBcyswTVg4djcrVzJmaS9a?=
 =?utf-8?B?enJGQUlJcjlhdjJWS0U4RWtoY2FlT1cvbnVQdDEzOW4vaGFaK3lCTnJtYmtw?=
 =?utf-8?B?eHZBTGJYYWVtVmpNSVBqZU9MNzcreUorN1h6alVxMDdPQVJqTjF6ZU92U1VC?=
 =?utf-8?B?R2ZHem1lcHI0WW1pc0FFd3JQNVZZeWdnZWFYN2l2eFc4WXZsUFlITk9Lb1FW?=
 =?utf-8?B?cEE3ZjlaMkE4RUFLTlJGVDQvMVZMSUJMN21qUnpjZ3RYWE9sVmRVd2pFaTh5?=
 =?utf-8?B?eXVlaXJRNUd4UlNmc2xpcHpscitFRjRoVWZFcHlzWVVxZnRJZkpDdjE3TG5y?=
 =?utf-8?B?bnVmbzhNQmVIeDlwKzBUdUJ0dWlCNzRqbmdqeVdwQ2ZqcUR2RExtS0ppdTZl?=
 =?utf-8?B?UWdhYmhMMnJ1cmpRRW1BNU1QaWEzREowSjZCUk8xNjJGZFVBV211cytkODBk?=
 =?utf-8?B?QUdrY2cyNHRkMkMxMVhHRm1weTlFb2c4ajlMRkk0R0hRTS9Wa21McklGSUlD?=
 =?utf-8?B?ZzZMMmhrMDE1N0pUMnFSbGNrRnRsemNTWktsSnNwditmakU0bUJWUHd5aWlC?=
 =?utf-8?B?VndlalNpKys0bmtSMHlxUUR6YjNyMlRZcUhBZ1BMU1d4UlhmSWlidFIzQ3FK?=
 =?utf-8?B?VHcxRTA3Mm9KMzJlTHIxaXFQcThSNEFrNlVIQ0M1dG1BUjROTkg1T2IvU3Nl?=
 =?utf-8?B?ZUlyMDZiYVBXSEg1NG95eXNiM2FHVkdRazRVUlFCQjRveDdjRy9JVmJXWEdW?=
 =?utf-8?B?ZUx0WDRZaExmcmRLeHdmeWJsOVpRRnpsOWtVT3JBVUQ2MTUwakVXYnNBeGJh?=
 =?utf-8?B?bGx1MnFOYmpIbDdwVHJxNS9mQXRqQmpGL3hxcDVBMW50NlMrVU9GMHJMaWNz?=
 =?utf-8?B?Q1Y3cW5CQ0dZSDY2aXR0ODJFRmtBcDI1YUpiRlcza3Q2U1dodFhpWEpCOWZI?=
 =?utf-8?B?NUpXR0JJRFA4cW54WDQyNks2Zys1OWI0NkRvR09Ra0xXdmtQcjdnSU1DYXE5?=
 =?utf-8?B?QWxydDg5eHFZeXcrSmExYXVnc3BxTXlBbGxseXNHUzJ3VHpsRHpPZlFqajBG?=
 =?utf-8?B?MWRmQTNFdnNRdFkwajJwMWYxbEJta09mdWhVbmUweHU3OS8vUG54WnV0Wkdq?=
 =?utf-8?B?M2ZQUUFrWGgwVTN3VnlSNjZybVNZREp3VThLdjloQXQ3NHlZNXJQdnRLa2Rm?=
 =?utf-8?B?NXpqVDZFSHhRMkJRT0x5YTF6U252VlZjcHNNQ2lGdlhsLzJoa1huUFpGSlVL?=
 =?utf-8?B?YXlRR2ExYlkzUFJqUGZqdWpjalUvV0xTUGRaZzJOTmZhWWRDODlwUVVwclBD?=
 =?utf-8?B?Szd4NWJHZlB2NHpWdEg5SGhBUzhFZkxZYkFFck45UHBvYXhtWG9iWFdhMnd0?=
 =?utf-8?B?VjlhbDFMc3pkZ0lRWkIrU3NCemhvZG9CUE45aVpoV2VvK0NpTHBHYzcvd1FP?=
 =?utf-8?B?OTFTdVF1ZFkxaUhSclZRL0NhMFpUNFRsSDR5MVpxemx5WXFFdUQrT0NtVjJ3?=
 =?utf-8?B?bUNxSGxOZ1RSaFhsVnhmQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VzgvOTFQRTNpU2dBL0F0ZlVJZ2RXY2tQdmRTVCtKd2dRZVFPclRPS2FPRlhr?=
 =?utf-8?B?QytaNk9NS1AzalhOU0s0UjRwWHZ1L21YNEg1RGVTVFhFRGw5TDAwRk8wc1hG?=
 =?utf-8?B?NkpHUnFNR1p0cVBMRkR4OFFVL2duL05HLzhwNGJIMUZNdEhhQS9DaUhWVms0?=
 =?utf-8?B?bkVLK0NJRDRsYWdFWGlpdjUrZExlc2MzTGdxUTBjSEEwcHdMUmgreGhMMlBN?=
 =?utf-8?B?dVJQT0c2NXd4d2crT1l0dkszMlhmVStKdFRPeGZIOVY4UjRJN2UyaStuOE5K?=
 =?utf-8?B?cURuK3pVU0tMOWlIMTlza3gxVzBRdnE5YTJvVkUvb2FGcGdIaHVWOEpLT2Ns?=
 =?utf-8?B?MlJsSlJFR3dMS1dEOVBWSHlhTnMvYTl6SGJSeGc3RGdMR3U0VmVkVDFsU0Fv?=
 =?utf-8?B?SkdjR05FWDNTQ01WYkVKcXhhdzRPSjIvUTJKNmJ4S3JTZGJCeXYyblJkOCtU?=
 =?utf-8?B?dG5DUmttWS9vbSt3aXJlbzN0NFdNYkkwVUtiVWxkMFQvbk81Zi8ycnhzQVpC?=
 =?utf-8?B?aEkxb09zd1B2cC80eDJ5eXgzNnhycVRxejAxNzBsaVpZaDJ4QUFZNU05WnZ3?=
 =?utf-8?B?c2xkbmQ3TGUxVmZTeVc2ZXJuVndJK2tDdC85SkMvaDhjRHJuZldhWk5MeUdL?=
 =?utf-8?B?QUxGV1BZbm5GcWxycXZCL0JNUzlxTkZORm5YYnpESFQ3TWl5dlpDL2c5cEhE?=
 =?utf-8?B?VHJYQUduMWY0L2tLdk9YRWprb3pCZC84WUIxWng5ZHNqcjhSTmEramJhRUx0?=
 =?utf-8?B?QWR5VFhEWVlYYkNQYkxtcmZSdThrTkJpc2RSd2g3SHpBbjVOUkVmdTBmNlBO?=
 =?utf-8?B?VzZhM2lwQVI2bk5Gc0ZHS3FLd21oTk5ZUDBLS1l0TDZPYnpGclF3TmZFVDgw?=
 =?utf-8?B?MmJ3VWZ6TEo5RTc2a1VnMTFMUGNaRG1UblpqMngya2lzbEE5TWtoYTRvTy84?=
 =?utf-8?B?MnZpcFhVNmZCOFRIdGxMUkZFVFRiZ25kZkVva2ZkYStOeGgzTFgxWTV5OXhn?=
 =?utf-8?B?VFMvWDFPRENjbFFyRERQbWd1VTF6VDFJTDRZbC84RXRPUW1URDIzb0dZYmty?=
 =?utf-8?B?dEZtMVo4b3dUbEhYbDFSS3RrZTcwV0lzS1NDenhacEJmMVlaMTF1enA4YVdO?=
 =?utf-8?B?blluakJYcjZPa1oySGE4NkNIeDIrMGZVK3JWZ3RLOFYyY1Y4OU05WXhyMFFL?=
 =?utf-8?B?S1lmQWxVZTl0b0tRM0Q5NzFZdDhxa2xXOVlQNmh2aUtFM29yZDdsbjNpV0ZH?=
 =?utf-8?B?ZWVzblg3OTkyMGJZTElwUm9hbG9qamRaL1ZXT3lrRklaK09oUDJxVmNrSi9H?=
 =?utf-8?B?dU1JSTBDOXVIOEczQSsrd2x5MnFnMTJIY1lUVzZKNzVHY0x1azZiOHB2RSsv?=
 =?utf-8?B?TkZrVEJDa1VBdDJ5NGFnb3FXZmFCRUhJektuNkJoRWQ3eVhIVC82d0dPZ0dN?=
 =?utf-8?B?M25CWk56WXkrdWJlYTRvRzdQQjZ1aThaUDlvdThrMW83TVN5WUNBNDZYc0E0?=
 =?utf-8?B?TFBiRXU4c3NYb1dTRW0xM1BQbmVNMkVRZEI3N2k0NVhTcW5aeTlRbFVBb3hP?=
 =?utf-8?B?MXhZeUdoWTRaZy9FaEYzUDFPYU9razdpNURtRVkyci82MUJOZGUzNmFEeFh3?=
 =?utf-8?B?MTArN3J1VVVLbW93cmJoMGVoNE9aMDhYV0MwU0NtWDhwcXgweGo1RVIvN3lX?=
 =?utf-8?B?MFE4NnM0TnBFSkp6Mi9GYS9oVUNBem0wY3NPYU1HYlpjZVBQRGZLamRlWWhK?=
 =?utf-8?B?ejVNZ3NtSVBXeW9GcFBCMWhNTi9jU1hiRlEyNWlkMDVzQnJyWlJZSG03U29F?=
 =?utf-8?B?ZzZKbjkyTFU0UGNWM2drTXpMVHBiQXllSytxTWp0ZHpFbXNFT3BXNlVNd25R?=
 =?utf-8?B?MVRGYnFZdTlrL0d2S0YvdU1KZVc0Sjl1NFlsUFBnK1NlcGRkSkw2N3pFYmlT?=
 =?utf-8?B?aXl2aDAvU0NrNlY4dVhRUkVOVXQ3S1ovNjJNY3hTT0RaSC8wTVE3OFRxZUUr?=
 =?utf-8?B?WDc5SmpQNEY2bnpVZW05RUkzN1ltUm13c1U5cFBoUjlkSjAyUzEyaXhJK3FE?=
 =?utf-8?B?VkR1RFJ6UFdPUFdXcTVNdE9VeXdkR080dTNBMlcycmV1ODVRQUFKQThrVVR0?=
 =?utf-8?Q?BFExZrnrDk7idU5vZuvglIGK6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	D8eMc7ekdXy7BZaCEDRBF/4zglnC1ycEniOGEjT4hgrVcPhu6nF+ubneDSEDswzYt55xEtEIV2+91m6wsb7WEUA9zUL6Mvf48RwxETOIQCo8LAQp3wGcRw5SAxnvj9DJxoULydpckzxSOR+RTVQijA/cQ0e/ZZcS8vqibngvV9pqbeyfbEf5b6TQxIg8ChpuneGgxqonHXcik+t7fyW+ikjmohRb5yCLjDYEDKWIucsrg/R/NsYWKPXiYiamUc/z4bOdYyy9ZWmqDax6XSeALoq8mJ9SQIRLyFXGkLkPUWC7OGbixgtfOes97zINE2YvoCmORliKuYwKNziyj1ZOAdE6YJw3uEtP8cmrNtDHGEpqrSAGW/8OG712jGSmzfEIsSj+KaI53+ahTQerPG0H6gWVXWbHam/8pLdX1pCN2L3WiGbBJNHTJgqGA+I/iuc1P9JiE5RJDuV2gfVOS90pV6LC65m/+sBCzlHdCoGDysOKFNM/qVC4dH7vg2pU5rCcXJMRlSxYIdxcVGBgugisESM5wp35hSpxhWCDWBtciDIInHWQhwtVFqm9AxlnmRW7I7SpItZaNWuaOgUQcjGk8UhcxbISiKYhwqSoKqchZ3Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2382a709-ad2c-48eb-5ea8-08dca84be902
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 23:38:36.6470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvws02XaftIepJn2rDxOvhy/a63NueWS4+NNFM7KxTvKL8N7kKtqWi5bKcxjDN6GtPXabzRiCF8NmW8/eSE86Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4321
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_09,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=926 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407190175
X-Proofpoint-GUID: u-lwSG-ljxJt8Nca83Rx-DQpVX8EBtGT
X-Proofpoint-ORIG-GUID: u-lwSG-ljxJt8Nca83Rx-DQpVX8EBtGT

On 7/19/24 17:12, Kris Van Hees wrote:

> On Thu, Jun 27, 2024 at 01:38:52AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
> Before I can really assess whether the annotation is valid,

Well, I'm pretty sure the annotation is right.

> I'd like to know
> why chill) is even used here.  I.e. I don't quite understand the test :)

Well, I'm all with you on that.  I'm pretty sure the chill() is pretty 
irrelevant and that the test is "valid" and passes without it.  I am of 
two minds:

1)  Remove the chill() and @@xfail and move on.

2)  Be grateful for idiosyncrasies in the test suite, since they often 
turn up bugs.  Weird tests turn up weird bugs.

The patch was going with #2;  that get my vote.  I'm okay with #1, 
however.  Feel free to decide.

>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   test/unittest/speculation/tst.zerosize.d | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/test/unittest/speculation/tst.zerosize.d b/test/unittest/speculation/tst.zerosize.d
>> index 56c1fcea..996f1257 100644
>> --- a/test/unittest/speculation/tst.zerosize.d
>> +++ b/test/unittest/speculation/tst.zerosize.d
>> @@ -5,7 +5,7 @@
>>    * http://oss.oracle.com/licenses/upl.
>>    */
>>   
>> -/* @@xfail: dtv2 */
>> +/* @@xfail: dtv2, chill not implemented yet */
>>   
>>   #pragma D option destructive
>>   
>> -- 
>> 2.18.4
>>
