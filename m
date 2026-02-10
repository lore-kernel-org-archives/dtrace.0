Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68173081BE
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 16:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770739371; cv=fail; b=dirwpAkYatSYAZRqsxZSmjobKFdiQjW2alvo/H+bEK14jzr20hYkW7Er7bD1vZ+vM2nZulURZ2Wn3kayU20A6nBGMhskNbE44y45/DtGXISTsUiRqhKnfsgYAe/eZmSHMrbJtwIceVLMwLtugkPksZD3ljjtmI6F6wknZ+6z7Yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770739371; c=relaxed/simple;
	bh=lkXoco8rWz1+Qg9xav5FmpTJcVYb4DMwbAyKyfvmnh4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=GzYCxw/648wf9tn6RoHolNRUrl5e6GXcXBWy8Cof81mwUXpkTxZnAmJOr3/1kg3yjvE2/shS+BzK9ECmVYiSDg3jvc1qt7RdMd5hsUOxKc7vhl+QywEm9nfbrttm11YeMc/HJrlkkP2dxQgB16NDalHBlyl4ZPYtWpEykYfI8hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=amnIPB56; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=G47CB8wP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="amnIPB56";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="G47CB8wP"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A9vDS93205075
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 16:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=lkXoco8rWz1+Qg9xav
	5FmpTJcVYb4DMwbAyKyfvmnh4=; b=amnIPB56NW6y/hcIbNXhEg3gK95xsJCVuu
	NVGvWET5hex+f7DjFBd6A7H+BakqTGpUriKtTl7AMWG8y4E59UoHwqZT4X0olqY/
	lVWpPzSevKLMi8wNXlU82Zaw1GZ+NBzWagHkZdqY2rVAgXEr7VgNvJM0/M1BnHOE
	1vz22gKcDUB9IJXTau/Su/HW9qOHKeLpSHAm7B+ljm3h8v554B4RmOAEMYovN8EU
	dfzLCkqtfCpV4tuoxtYNqgMG1qnZ8aG6Dd2+whISA0FvipbVCGE4onxhGJMT3SL9
	DrUmatN0pkpe7XG11riv2OTBkzoqjNO6tbwB5giiNZPBqVGLJODA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xes4avc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 16:02:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61AELKSW033103
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 16:02:48 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010006.outbound.protection.outlook.com [52.101.46.6])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c825tpsfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 16:02:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+wFDvRIbiPVc3myJ//x7YIluQgQoo7ifXqGUWLrTzKmoFWDS8VEh1cso8lf6sASDl71oK4po9Dz2FbVljWdRxTQZ6rZtndBvP+XckNygtlJNIW4jOdI0IJFuR0gc62FbJ1xmMcmMf9qBsXW8OfugnNxm7E6t6pzihrCKTGwBh6/CEMdF1D3vRUBxwLtp7PNhURD6WNMIkfEUt+IJQa+XjfTY98jLtt8cJUvrf0G68sSniEmvG+dAPfxlfFLzPOeSnPUHuCEviTGUCvNpSruPxKZd1Rayvhe2R3NU469v2UmbUEtcQ8ozARLKDEkmWic9A4zrQmTS1T2MWDRHyhwgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkXoco8rWz1+Qg9xav5FmpTJcVYb4DMwbAyKyfvmnh4=;
 b=jkEAMq+ijXOKJjARQ2mtrPOfzXJv6tEbAK/cXJfkoQ8Ff0TQgmpBMwpC6DB2G3QDSi55JaXAIxM9AxOFKD6xHxnRM5B293TzgInquw4jz14WCdqGAHm6jHc21LT5daKqHi3gd6AzO8cT+9+JmIQiM2KzoQQWXUUsq8ezB8C46yXSRWD6mSjntuUCgTbKflkljxdb1ubTwYybzYXOUl3owPXx2aLHSEHETR0fyzylW+QtCLRzw4hLDYEJ+DYJYSk0Ij1RBE4akiQmIPwhWKG55ge1zhvnL53KVQAb1VPu+ZjR0c+Det0B2WJyjg08Y7C+Y91EnyucXxTc015u2apZqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkXoco8rWz1+Qg9xav5FmpTJcVYb4DMwbAyKyfvmnh4=;
 b=G47CB8wPToOafLfyiQhMWhDoFKgbk7M5Sa30eeBskl2+fZDbho4dgseKTvT1FCRd9NW2Oka6jvoLtqIdptlNh/vW/tCGxdb8sYNoAQKcUdGG+OO2iYYjwkGD91W9pwbipvLnHTvn7zZTZH82J4baTWeYB3/Z4UavMR/Gh1g/e4w=
Received: from IA4PR10MB8709.namprd10.prod.outlook.com (2603:10b6:208:56d::21)
 by CH2PR10MB4248.namprd10.prod.outlook.com (2603:10b6:610:7e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 16:02:42 +0000
Received: from IA4PR10MB8709.namprd10.prod.outlook.com
 ([fe80::8837:6d1c:c62e:f470]) by IA4PR10MB8709.namprd10.prod.outlook.com
 ([fe80::8837:6d1c:c62e:f470%3]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 16:02:42 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [DTrace-devel] [PATCH v2] pid: ensure pid offset probes perform
 lookup with adjusted address
References: <DS0PR10MB752237BAE43AEA9E3A1EC780C262A@DS0PR10MB7522.namprd10.prod.outlook.com>
Emacs: don't cry -- it won't help.
Date: Tue, 10 Feb 2026 16:02:39 +0000
In-Reply-To: <DS0PR10MB752237BAE43AEA9E3A1EC780C262A@DS0PR10MB7522.namprd10.prod.outlook.com>
	(Kris Van Hees via DTrace-devel's message of "Tue, 10 Feb 2026
	10:51:27 -0500")
Message-ID: <87ecmsr3hc.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0020.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::9) To IA4PR10MB8709.namprd10.prod.outlook.com
 (2603:10b6:208:56d::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8709:EE_|CH2PR10MB4248:EE_
X-MS-Office365-Filtering-Correlation-Id: 172b75c7-f126-4a05-252e-08de68bdd240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RQemOWeC96dLX5nGioMG+7U1UBQ8T+Of6wSRBy5J3xYP/lef1XFLh3g5YjOn?=
 =?us-ascii?Q?lnVImtN3WlRWEZYXC8sOaw+ku8nnY8Xi0eBOEKcaAmphnD6yZVAAaDLhB6H+?=
 =?us-ascii?Q?bVEUvr9fv/RQn8ZS+cXA0X3+IvcAk+0bcwiHA11cz8h1CKxBSfoaPdjOSfD2?=
 =?us-ascii?Q?07aRmvfcssJeQIOlf8YqkC7VjPWijcy/pkaPUu3dWDlKltXD2pzNvrvihKvm?=
 =?us-ascii?Q?2F2qTLKJt201tYGFFiaQEzO+p9BDkI92cakiVSst/8mOipuDiUzRKDBpSOyN?=
 =?us-ascii?Q?NSRcLUBq/VT6/UVcuQmjajdgXgCnv2KrVz2O5jw4ehSewvlgsjkRcgTE2FJK?=
 =?us-ascii?Q?Kkw9jGzBegpgazjskkAOdB8Xgx80lHN2N9n135ccDlqwFAcjXfE3ERXEbzqF?=
 =?us-ascii?Q?cwAKuxUCLwHg4qGkPRQlfTgvGn6EFlDhs0q7vXC2lqzLiRRE+IOco7E1vAlD?=
 =?us-ascii?Q?I1FL7hV9x6Rw0sA7Q4YETwlZ1ErSrtREf3FAAdmo1LOGd0himYfK7ettD3FD?=
 =?us-ascii?Q?WUsVNrVwVo2ms8s2DSLTgE6OBl+s1/C9ZOaQP6aXZ3uslnHRVm2rVLwsJFAw?=
 =?us-ascii?Q?h5bBHw+ZKlaXZfhI+jWafd6tlXfckyWRxpSm8IuS7X4rMelkgo7QirsRl7JR?=
 =?us-ascii?Q?f/28FSMAx+1OBVARMvxo40kGhRaYCEZBh144GXq1xhl1BEnbL/K1IMmCWEV/?=
 =?us-ascii?Q?f5LXXKOHov7lCoBCHdJ1wea+3dRLnuxO5YQSwcpOi1NBR5rR51ovZV6QrWYD?=
 =?us-ascii?Q?FSA8MRUJ7jbzoa/GtkfjhOLsPk/aWmpo/r1YYDhJS/qRAJGaExFi7u7tWZ3H?=
 =?us-ascii?Q?D6bowCbaUOu4yGECTVViAx7PSZAqHd7hjs7K/9vw8Vu52IFmHd+pO0oWXzFC?=
 =?us-ascii?Q?bzpMpXscJNXUvPx3HWXdbdHw6B+U/Q3e0O36eouL3Atc2EOYPBojEyhov8Ac?=
 =?us-ascii?Q?WKKFr6RPUjip8M5H4J+DAz2xBxJqEMyR2gWXEGbRfb+KOvHOuqqZrNkwKO5y?=
 =?us-ascii?Q?Jnqau6o/KfPyqJ3m2aDVWS7qGDKJhMn1TcgVzjyofI0saauGocRZPpvE49Yj?=
 =?us-ascii?Q?15DI1oPGnj8cQD6/jVjC4QFzX+r1eR7NOoO0Ohy4wqtDlPpurUqA9e5TUd63?=
 =?us-ascii?Q?lU0mOQpyseZVW5EYstG5twuQ1Z5g8Qg/JW2ABvD/oBLDVkE3TDovqkPSbnma?=
 =?us-ascii?Q?q2eao/hz+/fxNw6V8TWJjLZIHjYr8rBenE5/8P9FsHEqSnPiD99lwHnIWfrO?=
 =?us-ascii?Q?pdgS8tEnyH8GCn2piysfzkUACpCdUcRNQ03bVbsjKLhqi0LXdc2fVsAfTjsN?=
 =?us-ascii?Q?2hylOE8igRMgUsYMCtadxA2XfA09hnW5XpNYz9oUWKjDMOzJD+RycmZ5kWDG?=
 =?us-ascii?Q?ZBdi9j3c/VWs10DiH+0rZ3aVcrhF5tM10dfdJPWDA8aks2tmSg6LYU2z8qgF?=
 =?us-ascii?Q?t7rOsHCji74BMfkJjCZ/kHcz7TpvfvoDGuqd1PQri6OjRvurCZL5DabuTwnE?=
 =?us-ascii?Q?9MGcD3ypn1ZOggF8dtUSOlAJoDoPlXJSYLBwyKgYVc5V1suSD1uC9NRdTMoP?=
 =?us-ascii?Q?UU9Wz3FzWZgESWML3uA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8709.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2Rkv7VcBsM1XdaQJA7wkey6LrA0M5BMX53IS9JT2/CJv1ypIwyb+QEazLAWu?=
 =?us-ascii?Q?FpTBlEt6Uut//IbqVov+ASXgOA8coPHTi2OalRYjJhE6kpTaQ5egF68Hby7F?=
 =?us-ascii?Q?UKinXZcaYLLqFuzmALVJAZOClBzWS+GLHlsCXvWI0M6zBb3NQEcMLw0gEoDC?=
 =?us-ascii?Q?HfxiykrGafcJ5GBdfI0uAqyLBU0ms2AtoWnsXQy87+1ZVRBcVN61nJPMmISt?=
 =?us-ascii?Q?S9EaWCmXEw+JF/Kq3APKePhpDUaW3RFfw5OolcDlpqANNoNYVdbL/lq0T/Rn?=
 =?us-ascii?Q?sWxDdH0ORlB/cUgp+O2ruSRBD+UvQOZEeje5H9kubUOh6wEzhaRWmAtQNLnz?=
 =?us-ascii?Q?V00X6JL6J+NogSHCZSB0kXm2U2YIA4fiORgBZhovcocUbib+algy8+pxqu80?=
 =?us-ascii?Q?cT7qkxCzmuJvIEO07mp3pfQksppUiBa8j9B+CPNOxZT/5OCf7CF9Od0zgAFr?=
 =?us-ascii?Q?jEZyIr6Imn6nvj0HJLo9AGo02fkAfOhnR2H+ahJJBWNUqmvkygkLMJEJiUAQ?=
 =?us-ascii?Q?smW1Wxd2O9c8YQqv6QTNn7+c2tFgffXVqtBUX0HI/7FD0bJ8c24fk7w/WH33?=
 =?us-ascii?Q?GCufUbhhkGqRpUvbx1xxu7lR/VWbzWQC2PCPolNsHg/kJq5Lv57G1W+GLPGK?=
 =?us-ascii?Q?qnM7DspSlj1Gj9g/H/lQQfCOSfxAOw/7UGtBHUaCv4X4jERU3pE1WmdIOzIp?=
 =?us-ascii?Q?dfRdk2ANgLPFjPHP2c0yv0vxo/Y2CwJSGpx9CmDM9pjPSy5R5Ee4gQ8609jp?=
 =?us-ascii?Q?K9KNF55YFW6qdW85qhRHn1GQCuumpjkdvDm2NiOQ4oDFUtDCAONMprYG4BPn?=
 =?us-ascii?Q?37ow4/H5GywjgwDYC+pCE9iUi/QX1ZJVNfELQs3Wzx4OJrFHy9Qgsv0AwTvG?=
 =?us-ascii?Q?EomIf3J2JU8qv6l6wNtNOw5hzzkennzoxkcSDUznavUWLD5jzsUjpAzx9hHo?=
 =?us-ascii?Q?s6ne+k0ObB4Dwnted1BAFYGC187Pvh0rgRSic48z0aYeiRYlvX8SUWGF5G6v?=
 =?us-ascii?Q?dzkBi01Ng1DTD926ELLkXCOXOUE7pwqu67/1kK84BGlMw16IoM3ZIbBt3N6f?=
 =?us-ascii?Q?oyaparVeDjWIujf4pGw0c7PU85dQOpvsZO49OxuEGMUKIbTcgjAU0st0/q3X?=
 =?us-ascii?Q?LIS4Uet0NHsz9CISHzIJAh8EXgB3jC82l0DuesVR3KRg1rzL093XPUJPbn95?=
 =?us-ascii?Q?5MOeGA3RkCgjYRU0dZbch+djA23GUfP14LY/JCyF6J0i0AbULIsZA2uxkoVs?=
 =?us-ascii?Q?uHbnEzu153+Owv0JdVesF5PDmx+1cwrRH7sXcZ04hlZH3+H6uXJoUEwYr+kf?=
 =?us-ascii?Q?DF+22g/2mm5kFAQCkcVcxOHb2gvCKWRMJQx9Yif1Xh5BGBn4ZfXrwanFEU4T?=
 =?us-ascii?Q?eofGBeTEeuhQu8J1RFkn35HzBca7LHy8ryjQgQH6MOyHdmTgVuOtXfkcS0HL?=
 =?us-ascii?Q?9W/1Z0kmwNOkEg3Nz0vfPxfsdBvcvTUUhdSqusqO33MCkVCuvvFggZrmPcNC?=
 =?us-ascii?Q?SnVAnsvqONbjisl0WhH7iTExDRsiIrLGahWeYOnC0Ne3ILMErh4tucR4g+tg?=
 =?us-ascii?Q?sjtIk+NmBUwxOlVnsnNM3kF+e9zSvIdkkh8HAdAqJLCKS6rzFcQ9BWTPmCgk?=
 =?us-ascii?Q?GLBbhyo4K6xse2+hASmYKQ3GtpPupm+ygMjA2H6/SqPHFtNEHLbeWnumoX38?=
 =?us-ascii?Q?TB4SEm2+xQtGIEJ484WY7obh46/Y5bWRIzdggYQtk89fNo5fPZyOnwzmiyJZ?=
 =?us-ascii?Q?Hv+KyZIhAg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n1Q0jvmTwTdLZ6lc6XUgkQJyvJBcevrJCEA/ERHuUJRu25rAnB59ByFZd0T0YSk7mVVkoSStH+km7lxU5SHhKYPulb64Gh4KHcMquSkslJrgWRotdWy/ShNBOs33YEvCC9myDptPD2FHWO2eOevTEvXEbLjIjFA/9wssBnBdcMZeY53mS99pq0FpNCEdErAxcJiG3qXQLfx1y0XWs2mnX5BzI7ELXWgrcyalWV3mtjWkDREprOWU4e2awK80EgssrNOkySNxBVN0PAS835phZtsMWyuywOXUO0K/3j9qzxzqVW8ROf/BcioV+lLPJN8f3GoeF4rze8C5ACdD3hBIHMBf9bK+JJxkdyuI72AXy0UW/nH5iv8h1hGK8M/FYJDci75v98h/VhNzmxYNVoO6o947azNdD7sV5UW39CM2eytc+0bOsankNvbGUYpNKYjdKFJ0VHIjHA5uM8bApq4xj3q7IAUy501Sd6NrMw7ogZ/yuZN2sWWe03NakkOsnh/oubNNma7pbYJ9CCo2NMan/Jmkp62XZ/89xCftXg8Q9CL9wzxJPoFAe4WrHNWwWh0Q5PoB7yg/WVfI5QjyYl36AoF2V/XG5O4OrSg6MPF8b2k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 172b75c7-f126-4a05-252e-08de68bdd240
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8709.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 16:02:42.0701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+DjXr09EhzMCzV69YE2OJl4SymRAAMqZW74CQ+vBg9XI60cXtYnmLe59eeW+T67y6xl9bUnguuVC70W5fnGxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4248
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602100133
X-Authority-Analysis: v=2.4 cv=KaTfcAYD c=1 sm=1 tr=0 ts=698b56a9 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=EqZ-Z-ELBopeAlj3nskA:9 cc=ntf
 awl=host:12148
X-Proofpoint-GUID: wc2p2iCpfIRRmugV1g8YfVs5_hcfkNag
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEzMyBTYWx0ZWRfXxXYLWqISUS+W
 meUyCqtbIzMynFrxbVf6gewO3iBdaU0T0KzdxahrXdEsIvxsQTvqpKhYAATHq+4wUdEw83k508W
 1IcwPxHVKGpKRWzgMTOfJnboRfWDQkXpwyx8T5ArdaS5MYgQK89l0EXTtr+3Sc3tzlvys4/JQZj
 aRjieL4OeNHqDBa9ZGI78IgRS9XbLbtKcVsBK4KVryGHj4AO7RvYKTAsSOvK023nQWV8Dsc5Ry2
 Yt6P6TI4+U8tl9e0+xutI6eO0eZOkFQH6r3zdB22uOclA8VkxSoEdVa2TtfvgE89aHwMPAy2+bi
 LrU48J2quwnO52vmw17CcmqrhmXHH6BkrMAhbsacTMMVu6qIZ8c/CxjbjXa6QTHWM+BsY1GhirJ
 LNa9jD6FRMx6P7T+0rLu+zHLh9TdlToIjjTZ8Or8OwpFJ1NaFGrgyJbLxyU8TjYYeE9I+eWY34P
 /E77nToiFQ9MjKEwlW3UJd+7NlcNy5PrxZV4+fGY=
X-Proofpoint-ORIG-GUID: wc2p2iCpfIRRmugV1g8YfVs5_hcfkNag

On 10 Feb 2026, Kris Van Hees via DTrace-devel verbalised:

> For PIE executables and libraries, pid offset probes need to have the
> address adjusted based on the actual segment load address.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
