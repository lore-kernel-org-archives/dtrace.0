Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B87B1BC095
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 18:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725041631; cv=fail; b=EleNg6UO5+NaU0hxAu1o4dNkQu1qY5IsJDGcW6m/vVpl8CPqPq1TVBbl66tD44srpgn/MpyeO5SeYTl6ji3PZU0ozosGUuHQs85DADKI7ZQ0Jk6ruhdqnxLwQQJo2louX5sLy2rkqOgHO9uozmOsE7Q1eW4BywiWFZvYSamspL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725041631; c=relaxed/simple;
	bh=P1DjJYAEyYJhOAOOjJDn6Xxwgw6Se8UkiVFkOgFk7dI=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=V4tRQocEQ/8/Z1xrUn/xi5KFjX08wP6nuyUBDO3R0br135ZWWy26KM6WK7ttJJJNu+yZIlDu3+23rRs3c/Ymun7ujoYOMS86CVpfEv31Ncdk0jcMYceOBjxEBZX4lb6LzYecDnkgnnmGiSg8iw0X+6t200jJShj1B4rAN1mdsHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=O2IcKQDo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W0d/dVfl; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="O2IcKQDo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W0d/dVfl"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UI0Ywr009755
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 18:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:to:from:subject:content-type
	:content-transfer-encoding:mime-version; s=corp-2023-11-20; bh=S
	mUiJeDFlS6CJD3KLmEms6eEYFImcRevjQfaqKLko3s=; b=O2IcKQDoDflKz4Xmi
	nMNdaf7O3XKnNECs3SEY6XclKE1Ggh5hJa5V/pXxAKmIGLcaBfKcncmARpp/C/Q8
	qcjzFLe3xRKf/Mi+HRz1zvp/K6/9hkHLCdizp8dyDj6BwSI3bPLKd/pbSA+8xQH1
	VyZRJhu+HMcccEzmL4J6tOTT8VtPy+mhB4B8/xABPA2EU3mWrwQkXpqOzPaI3aij
	4GwRR766b4FQm4NTxqEhgU/dVO7/KoSJVc/2uHXSnuKT0FvySHHK2CBn1CJr7owl
	8j79tKBzq0OXCT2Kkrh97k/d3oUsFP4anVB9mlKD5sJIsZjTaqB48vX8Flvelqz4
	l5FTA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41bh8t869t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 18:13:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47UIBZwv036587
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 18:13:48 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4189jpw5ut-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 18:13:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fm+QnEqctPvNqwteTi8AQ4u03Y0z/M9tAqGK2EcuQL7K3hUgFJZrjDetN3POzobCzro41mI6+HNEzecXgeyCBZFMbR9TOPkro05dT8N9KeTv2L6dNGTf1U/wDVapTx3Q3sktyS/WJvRODdT7S+fBJWaYScIfHhl0tIJ45G30/T+X43B5VlI5ZzvpsTmcQkg7ljCytlSur89BTiXhEWmmQFgMiBMUbZyKBichpbiwC1YOS4fhZBBpIs6r694v4PEtqBW2toSJ3D4W5OmguqffU5vRCYhRpaepiCZNwOjORN/FOxyehkYRAjtGzag3D2r29ZfYSzMlFKePHSw6AuDj8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmUiJeDFlS6CJD3KLmEms6eEYFImcRevjQfaqKLko3s=;
 b=aH8gxk68g6/tvgdtggp5QDwMKvJlpI9yxOEVu0ho10/g6RvxBhG6n5angPv2Y6lGTpn+UYKvExBPb5MBsdCLbv9DB+sgPlrYUrmm5iHZff7gDq0Zr2mCz7iY//Y6Y2rrLgd14jSNyOKJz5RALGimuCKpRSGAYilLx91USMuseOVD2CNM5cD9L7W70Ewz2f4EFjTbs5vKKAAmxQHRAfZg+kuRxYEAv6pjOlpssQg0MXwUKkXDbfKvJozJbAidW13ogJ+IuwLwQoWQ4zpIpzjR+BxjJLI8gTs6bP4A7bhwqV3rw0HCdTU8MVyDWyMN7mJ9aXXztnRL7YYjvXrqXELIEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmUiJeDFlS6CJD3KLmEms6eEYFImcRevjQfaqKLko3s=;
 b=W0d/dVflq6IeQhXsRM9894pmibAAOPaIkVa+zsGu5E5eR7lmun/wblwoyMPQ+nOPY2hzwjqasEovTCytyo5ZY29w/tvAxnLkA6d5eTehNKgHEt7/YXAvPoWuMEwSEpOulB/bc3hOh6fU2dzO91787Wq2t8DXGIlFlsXIR5tqNVA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB5782.namprd10.prod.outlook.com (2603:10b6:806:23f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 18:13:45 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 18:13:45 +0000
Message-ID: <ecfe825c-8d12-aee0-da14-24f3d9af1c59@oracle.com>
Date: Fri, 30 Aug 2024 14:13:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: dtrace@lists.linux.dev,
        Eugene Loh via DTrace-devel <dtrace-devel@oss.oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
Subject: issues flagged in the USDT patch series
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::11) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: 8603879d-0791-44e6-a7e9-08dcc91f7c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3RwRzZrR2s1Vk9pL0ZRaVQ1WUFZd0Zjd2NuSVhUTElnbk40N1BmMDNRN1hz?=
 =?utf-8?B?OWtCQVM2Q2ZLbXpDc1ZHOWxKRTUzZUphRlNDL2JaYjl0UWFxRUNDYUs1Z3Bl?=
 =?utf-8?B?alNGNUlCWFRvR3A3YkYzbWtjY0RpbE12Tk5hekRCZnArcC9EWW5kaG4rTE0v?=
 =?utf-8?B?Zi9oUTlVNzJhUWg1Y2NySHNKNjFxNW11ZGlSZkZRRVRSSXRPVFNtVUI5UmxF?=
 =?utf-8?B?VHBRek5tWmZFVmRTUE04elJGWnBKcFViVzFDbFRZWjNKUzhHSGl6MmdtUUtI?=
 =?utf-8?B?dHd3UE9GUURhZklPdXpsRWN1VVZXTzhibTBic3crWkpib2Q0UVhzZkNZZkFR?=
 =?utf-8?B?Nk4yYTkrZEs0cm1JKzlxRlFzSG15UU9TWjlCcGNOTzUzV0t3MDJWRFUyYUZj?=
 =?utf-8?B?WlFPWmc5OFRzdGo1MW9lcXc2Q2I0K1JYVmczQlVCdDJWK2dVNUVjT3JCQlhw?=
 =?utf-8?B?cit5QmxwcWJueHdvUmZ3TjZXZjd6SkRrNmlGR1ZqcndmN2FIV2V2SVhvKzQ1?=
 =?utf-8?B?N0p2N0xIMEY4VFp1UU8zZW0wbFFHWldDaHVEcmFLNmQ3N3lpaklQL2E5TWU0?=
 =?utf-8?B?MjdRMUtsL21JbVZoY2VXNUNBNkpyd0t0TDBZeEhBTFdKaVh6Zk9pMHRDVzhp?=
 =?utf-8?B?d0pyV0F4all0ZWhlM2VQQmNPZDdwZmhsaG1LaTY2WXZHMDBSM0J3SzdjSmpL?=
 =?utf-8?B?VGplRVpLYlF1THBzTjJ2Rk5iN1RHN3FSVE1ndnI2cUV5MWZlTFpMTWVxZlZC?=
 =?utf-8?B?N2lNbzlzTjAwZmVJSjM3ZVQ0ck9IWXhOaFIxanRrSmg4dU9xU1ZydVcvSnZ4?=
 =?utf-8?B?dy9VaFJGSFViajlPUllUREFCbVlrZ3N4b2x3Q05IcGhGSW5BSTQ5RndTRmVr?=
 =?utf-8?B?ZTViRWZWUmlJOU0rdXZudmJrK0VyR3dsY21rWXdrazhlR29KYUw0VlF4VWdP?=
 =?utf-8?B?T09ZYnhHMDRoOFpNSlp0ZXVkSUVWaS9MUVpnZ0ZBck52Y2cvVmM1R1R3UDJG?=
 =?utf-8?B?M2xtNmVLNmJWRG9qY2xnYnI5TWJPS29Nc2lYUlJsd2h4bmorQU9EYi9SaWpN?=
 =?utf-8?B?V3hjb2w2VTA3M3d3Vm84TlZTZ2cxU0NyQnZXSDJ4ZHJxVXY4cGxSWG5nMXI3?=
 =?utf-8?B?TmlCdnYxWFowRktMcXl0R2xuaHhtUDgxdW1NL3ZuczBkM2JrUkV3NTIyNzVN?=
 =?utf-8?B?WlkrMFI5bUpXZTU5WFdBeHhuRmpHNWtOQnFLaGdDMHM2Z0RsanlPK2M3M0Zm?=
 =?utf-8?B?bWJnaEFMdlRvQ1NyRHFQRmNVVW1jREVGRjgxMFR5V2xZd0Z0bUFpbUx5NCtI?=
 =?utf-8?B?TWNRUVlBdW9pOFNkM1hBNm41NGZFckxiQVkxaFFBcGFkbk1iK3FOWHlMZG1G?=
 =?utf-8?B?Y3labjhaTFlrVldFNnA2VVpGYkIxeitZekV2d1FaWHJyQVBBQ1ZGL244OWRv?=
 =?utf-8?B?RzVOdEdxNHJ4L3FNejk1RlkrTVB6WkJ1RWdnRkVGRXRFWEJPbjFXL3V5TTJF?=
 =?utf-8?B?TUNCNEZpNUFXbmVPT2dSNmk2MUlQNEtrajBtWTVHQnFVVmVmd3h2MWdIdGNK?=
 =?utf-8?B?RVZTeENuN29rQTBzbE5TOU01Um9rOWNONjhwVTF6bEJOYmhhNjNHd1lMWmdx?=
 =?utf-8?B?MlpQUFF5Z0Myc2xLZUxGeDh0WFBycWNmajJJbXJHeWcwWWRsKzhuS2xUcTF2?=
 =?utf-8?B?NVk4WXVZSEtFN1EwVjN0TlFSSTE0bDAvODM1RklkRFZLbDBKTlpUVHdYTVJ2?=
 =?utf-8?B?UXNlZEtYNHI2TDduMStmc0N6OHBKeVRoSnhDOWRWa2FkR0xML0Q5Y3BmM1RU?=
 =?utf-8?B?WTNodnBKMkFjWlNwdFpJQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y09CNklYM1ZRSjIvbzFycGVzYzlZSGZ3KzY2Z0hlRm1GdGZ1dDIxWkNRSy85?=
 =?utf-8?B?L0dYcHdESTB1OEhTTDRaZyswQ3RpNUNmOFZKREluY2lJeTNyMmZTeFFGNk5U?=
 =?utf-8?B?S2JWYVNwK0VFK3NrQ2cwLy9PSWllOFYrWTRGRVpacWJSYmtMTFlUWWk3SVpq?=
 =?utf-8?B?dzJiWThjMXZSMjNYSjBoNFliTjFQRlRYajl4UjFOMkpYV2hGS2VnajIwaG5G?=
 =?utf-8?B?bCtuM1NjOE8ybmdicFVEajE3eUgzd3ljMUpmZ0RobStqUUN0TTJBRWozN0sz?=
 =?utf-8?B?RUN2V1ZNa3I5MVFiTndvZ2lyK0JSeFNSMEdNb3phRGthVTNCY0czek9aSHFn?=
 =?utf-8?B?NDVHeFpXZjNXZjRldWhDN1JLeDhzZENEVlRrWjdTUEd6bjRPblkzU3RJZE51?=
 =?utf-8?B?aEVicktid01zS0FKd0t0ZFJ1R1JqaFJNVlZ2YnlKa0NIZFN6NS8wYmgvVjZ5?=
 =?utf-8?B?bFRTeHlvUjU2bWkyWXhWTHVaYTh3enVjY0dSVXFSWG5vOWVPdGJMOFh0L1M3?=
 =?utf-8?B?cVFhSDVvN1RSUHNqOG9LK29nYVJNb1NqejhKNlFQZzRNRzJQWEFRL2lWUGFK?=
 =?utf-8?B?dm03TXZEeDZEaXpja2dJbmhiVXE2K1oxS2puRTVWZ05rTGtFaXJUVmQwYmZK?=
 =?utf-8?B?ZGxkd091djlRdy9tbGVib0JhK0FlQWpkYjBvNmJoWlhPbXNRUVp0elhjUjd0?=
 =?utf-8?B?N3BaaHBvUjJPNGNUdk5UK0k1R1pPaWJ2aEhjSE9MU05QWlpXMUZVZVRNUWFD?=
 =?utf-8?B?MGlUWUxkOThXZWVtd21tWFFlOCtuSk9DODQ2dzAzalhoSUxMN2UrcDdjSzNL?=
 =?utf-8?B?SVU4eTdPVFhoWmFjVGY3Z2xGYmMxZVhpQUNhdnJIZXBNQjhKUk1JdlJlNDFH?=
 =?utf-8?B?TUgzMlE0aDlLRUJMdjBnZi9lbEY3ck1EblBEanlWajRMMmhKcm9JK1FKTFhN?=
 =?utf-8?B?Z1RzV2NGaS9KWk9SNm5QV055c0pqTWJkZHM0U2x2VW15azYxR1ZFZ0FqeXIv?=
 =?utf-8?B?U1h1MTBnTU92NFI3amhOaTF2MnZiMDVDUm5lYXVXeUxOaHc1WER2SlJ3WFJa?=
 =?utf-8?B?UXd0UUVET0lzWmVBanluVWpQdU9VRjBqcFRadTk0V0pwRUsxek9aWUE0dXpY?=
 =?utf-8?B?MkxoMjdlT0xON0lKSndPdXVtZk1pTDJydkxEM3M3WG9NUUl5TXVSM2orMjlp?=
 =?utf-8?B?SWRERVMwcjdtNUZQeSszd0ZNL0Y5c1VscnFPcWRRWnpZUnpiYUt6OVlEUXZE?=
 =?utf-8?B?YlFXRGxiUkZ0bjk4NVI4UTZRZEIyMHo0UkJQZTNNazNPQ0RTQ1RLV2I3Wk1K?=
 =?utf-8?B?b21vUHViUHhNSkJNbzgwcCtEMGp5SjkwUU02c3NvenpuMUJkbndSUWV3T3gy?=
 =?utf-8?B?dk1rdkxyZi9ZRFpJbEttWkdodnNvNERxSHVwVC9EbGtrcXh4RXEvb3RMYkRK?=
 =?utf-8?B?czAvN1drdG9mSTFDcjUwTmVsMWJmd3NLMm1yUkpiU0o0NXp6MFozQVBPZjJo?=
 =?utf-8?B?VjV1TklFcU00NFNZYmQ2bjgzUUk4cUN6VVB4eVN3SkRCZitTWU1qZUlvM2h4?=
 =?utf-8?B?OU83SXlCTm5aQWlpYUNkYzhxMWMwdVlYSzZQNWkxc2FFQlNXU2xwd2dLN1Jy?=
 =?utf-8?B?UlB5Q0Fjd2Z2b20xNVJ3MnNDNVBYOTMzZ2h0TGJqY2NVaFJ6NERocGJScVZk?=
 =?utf-8?B?VXI0NzFvaThKRW1uSklNYkhkdDNmZEFMUkZRMGUyYlE1aWhvNngyYVl3ZG5a?=
 =?utf-8?B?OFhCdEx2NlJRbExrM21IdFBJMjl5cVNJTFJTWEgxRzh2bFVHbHk2Y2h1OWVB?=
 =?utf-8?B?ZVVURFpFMnV0dXdxcmg2Zzh0WklBN1VOdmVxS3g2Z3M1WUpCSFdWYUxQcGh2?=
 =?utf-8?B?SC9rUytJSGd3ejVhWm1iZVZSV3JpMDFuNFVpeGp1L2kxU3RIVGM4b3FHTVRk?=
 =?utf-8?B?c2s5YjZkVTBYNnFnSS9BYVRscVU3TlRNWnQvTlhjT2hzcHV1Z3lwaHRyZVYy?=
 =?utf-8?B?TzRTUCtGWWFyeVptbFJDUm16aWo0MklhVW9TTXlGd0Z0bHNiQUhEaG1EREow?=
 =?utf-8?B?K3NzM3JqeFE0cDgwekVJMHZyVkcyMkFsWEpYUExXTEhXd3pDZ2k2b3dIZnZv?=
 =?utf-8?Q?TmYnePPc03mVsUuoADJQ+u1e1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fOq1/Rr14tXcXVLxIQ32f0FGeqwYTv9QjC9Z/P//CAGecy4AduTxdPFDbYuPGkrypVX/A0m9hXFnTFJ5vDbfw3WAvlwMst9SclpyBz7ZGtB7OUg7mYTH/zC4FdZkyVYVny3xzFJrrRyJYJUnsaFGwTCPiJc+lM5DnAwJaznnsCivdVX+srOl5tkXH0arK/x4AIMCztabxxMzdW/SpsAySOVadfEtGxr6539gPuH9BPum5xld0w3n1cmeMX8AQriasdszBIwMFmGiXHhT2JAgPIS+/1QUmspL/KWPnCbj+MJ5pqhKE0nrxHBBf2JYFWzWJMQaEhxbxuk7zvuPj2PWhCXrZOQNm6YvI4QDmMYfWB0j78neTxB4ptZQlbOxmDVnhdgccRg1TIP0UYjOIzfQLBvtkZUDlSqOOvHgtD72OiZt9vZ6GoL8YYlD9LzGKA06voOmNo7W/Za77rgsZw1u064cc0H4+gXz2BqcuSnz1xL9oApoQOw6K8XtL0odeXnmX8tFU0VJUsLOtsvsJ2ovWcVwbJOoNTa/TNYYP4cHjFZczGC3Pe+pFFntmIYns8hdzE51qbVzX3SiR0vy5kd6LgFXXKfCTlcAbqrmSx9F9LM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8603879d-0791-44e6-a7e9-08dcc91f7c5b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 18:13:45.5276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdZ5wtJM9eKU3b+2gnTATFsLH1uUx4BSEpElx+SroMaB8bYcBa63C0Wwj1ivZm6dh2zDmgzrDVIEKN2fDbYSIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5782
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_10,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408300138
X-Proofpoint-GUID: oFvPlzBnCs8VjRrc9Ct5L5AcPyTJIY54
X-Proofpoint-ORIG-GUID: oFvPlzBnCs8VjRrc9Ct5L5AcPyTJIY54

I posted a 19-patch series to add more USDT support.  The patches flag a 
few issues.  Some are being deferred intentionally, while we wait for 
consensus to develop around the basic implementation approach.  Later, 
we can deal with, e.g., extending past 64 clauses, making dtrace more 
responsive to changes in the DOF stash, deferred attach (-Z), etc.

Meanwhile, here is a roll up of some issues mentioned in the patches.  
In some cases, I just haven't looked carefully at the issues yet, 
preferring instead to get the patches out for feedback.

==  Scalability:

     #07 Create the BPF usdt_prids map
     How do we size (and grow?) BPF maps?  (string table, USDT prid entries)

     #12 Increase size of BPF probes map
     libdtrace/dt_bpf.c gmap_create_probes()
     How do we size (and grow?) BPF probes map?

==  Optimization:

     #07 Create the BPF usdt_prids map
     libdtrace/dt_prov_uprobe.c purge_BPFmap()
     When iterating over BPF map keys,
     deleting an elem forces a restart of the iteration?

     #07 Create the BPF usdt_prids map
     libdtrace/dt_prov_uprobe.c purge_BPFmap()
     Should we purge USDT entries that have disappeared,
     even if the process is still running (with other active USDT probes)?

     #08 Support multiple overlying probes in the uprobe trampoline
     libdtrace/dt_prov_uprobe.c trampoline()
     Confirm that calls are not excessive (and yet sufficient to be 
correct) to:
     - dt_cg_tramp_prologue()
     - dt_cg_tramp_copy_regs()
     - dt_cg_tramp_copy_rval_from_regs()

     #09 Use usdt_prids map to call clauses conditionally for USDT probes
     libdtrace/dt_prov_uprobe.c trampoline()
     Are there more cases when we know there are no USDT probes to consider?

==  Better error handling:

     #07 Create the BPF usdt_prids map
     libdtrace/dt_prov_uprobe.c grow_strtab()
     Handle if ((strtab=dt_zalloc()) == NULL).
     Handle if BPF update fails.

     #07 Create the BPF usdt_prids map
     libdtrace/dt_prov_uprobe.c update_uprobe()
     Handle if BPF probes map update fails.
     Handle if strtab grows too big.
     Handle reporting for dt_pid_get_pid().
     Handle if BPF USDT prid map update fails.

     #11 Support USDT wildcard provider descriptions
     libdtrace/dt_pid.c dt_pid_create_probes()
     Handle when looping over probes and one encounters a problem with:
     - dt_pid_create_pid_probes()
     - dt_pid_create_usdt_probes()

==  Better resource cleanup:

     #01 Change probes from having lists of clauses to lists of stmts
     libdtrace/dt_probe.c dt_probe_destroy()
     Is the free sufficiently thorough?

     #03 Widen the EPID to include the PRID
     libdtrace/dt_map.c dt_epid_lookup()
     Is the dt_datadesc_hold() appropriately released somewhere?

==  Heritage issues (predating this patch series):

     #13 Get rid of relocatable EPID, dt_nextepid, and dt_ddesc[]
     libdtrace/dt_cc.c dt_link_construct()
     Shall we get rid of clid?

     #17 test: Add a pid-USDT test
     PCs for pid return probes are apparently in the caller,
     presumably due to using uretprobe.  It isn't what Solaris did.

     #19 test: Add another USDT open/close test
     test/unittest/usdt/tst.dlclose4.sh
     Can similar USDT tests be simplified by using the same trigger?

