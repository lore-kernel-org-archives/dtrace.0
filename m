Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E145B1E4AD
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 15:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726328151; cv=fail; b=jUnNxYRp6cHmINuJylajVAh7giLNzKbG9lYKMxOU8ueG+vR2UJ1hjBr5Cd5V8Px8jvDEfT8Gmzq9ks6trvwcHC+oQRjKxR+4NxrtcUcvOUvKWZg1Lml4Ltc2IMt9SvpXw4esj5KUqSpUBzqcHzTm4+ORgFTgdOEVcOlO085WXuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726328151; c=relaxed/simple;
	bh=iS63cSeBxp1eKGwW/NNJDIfSz2xMyuDL/ek0eyS4U8o=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=fzopz8Zs/y0bd/eJg0yIKL2bM7jmJ31B6odvZw6iGlziPiVhVAHMNhQINbFVYXgaAHPrTflxhle1M/rtss6Fc3Q+WY5njHw/W8rixRg+qH9s8d6YpFa1vXKmkGtA/4/wNGBSlaL+Gs1b9vPI6czfDYPUE2E6eWI1oOQ3lAh8mQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mRKip/Zd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hKNIR+Z+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mRKip/Zd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hKNIR+Z+"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48EABZFq030793
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 15:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=hTDPI2gSR/ccc4sbXXEt4pi6GxrmbZPWRsTjH19NFsw=; b=
	mRKip/ZdtPtuS9UbZFec1EWjEAq5vjOqbwa4bAmyOYz/RE41fB8r2zoRDz36xC7K
	xM7IfNoj5IHI+SG7e3P3kBZb2+Dn7+wMWV0+2jBazieIvYoLPqvtolySYLVMTPoK
	qQA4Bh46qssrKdAEK6q/jdnNt1RLu+uaYkIYEgFugvb6hB2K09Al9JdANvoqgh+j
	/sg5Lw1hbMMZxccSFwDqX4XQXStn4GQCMHK9ebrPtQnDgseuuDJbc9r6OoA+YQWW
	zbo12B+lNSN+eFRQ9cC6WqPmMjjRxsHXUwvwoJHIw41NIS85UJVDmqv3y9Y7ZOoo
	bpekSvmOHHo1dth177aWRg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3rjrgsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 15:35:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48EE4uB4019253
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 15:35:45 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41n0x6by9y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 15:35:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGK3w9GS4zrYKGE6D8gHdMVXco7CbQ5OT1nE9Qs+l001AwO1ubxp7HfABMu0K+uG3qMkxoJqjE52Yr1Y2vZD58/lAgESJsju66o/slPuZC90nTljzsne38XdWMunX/Cdv2zdK8Klg6caMbOZGIasOGseYCmtsBBkNh42cu+LLP/QG8fj2N6Ee+vpxiSE1KhUT38Hk1TLYVjKQIRZMseXSNxzwAWpXypTbWbgRiG0cR8kpinE5zSjjj0Tcq5t0PAg2gjNo18aD9/lwUvm3cPSaibyZWKDVKrcjzJs+lDadDe3dz96Z6phdw9ElxtW2kZkVU8bl7o+yHsYzLI/HXVRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTDPI2gSR/ccc4sbXXEt4pi6GxrmbZPWRsTjH19NFsw=;
 b=iMRqx/Y9mfqH2u5QzER0P9DapFeNuHdSjZS5dBKM321yfuB2HNWSsQZI372TOJG3AcK6T5PSxh72JTBeHhSuYSeCUNuiMIHfDei4bZihFE/wakP5CpEtCWZKio0ovmgkhQDAG+EEQ2hHZfbuMj3uZGAAoPxZ6J2vR2CcH+VSAOrgrW3XJOc8hcsv+lES15ScbmXsUJvHQWVX1ZRX1A5jmy3dxx9w48I1nM/zN6vTSSel+9jN6WiMDf3TZOClLTxqpKu1wfY890I6kzU6l3lyLwCfEPalOc8pI1qf83yuLPxZ/p1Y6WdXZpV+IBEWmMpsA2VK0NVIqMyqVgMvzycrQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTDPI2gSR/ccc4sbXXEt4pi6GxrmbZPWRsTjH19NFsw=;
 b=hKNIR+Z+p3fRyASJekQvZ+VEFuUPz8mydSKARgj/I7RVGrQBPEKDQYZlWBVlupp0r+o7p3UcjkMnZ7qWeZTjhyH/pPfUJmFQKifKFR0wujHQSA2rabQCwuyLNYBifQOTMhgMMs1NfQJFlYddvkJ47UzK7OLrlPrSjhAhrDvTPFQ=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA0PR10MB7229.namprd10.prod.outlook.com (2603:10b6:208:400::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.11; Sat, 14 Sep
 2024 15:35:43 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.003; Sat, 14 Sep 2024
 15:35:42 +0000
Date: Sat, 14 Sep 2024 11:35:40 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/3] test: adjust filter
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0209.namprd03.prod.outlook.com
 (2603:10b6:408:f9::34) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB62873DD7613F62C636FA90F6C2662@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA0PR10MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: c30fc129-e04e-49df-851e-08dcd4d2e4ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+0BBoGUDkIWhD0rvhNd+yj1bEFqzCaN7uT2fshHRQlJEdnMI0J+3SxArk5MF?=
 =?us-ascii?Q?oIBusnITITPZ5a7U7Y6CzqhXF+mhaM1GaMuye5Z6NEKwPovhzvis3xrD8XNP?=
 =?us-ascii?Q?6cc5pOtRrx8RtfcFqbQA1Sru8Bec/RqWw5ib0W1ez0Jo1kCkKSoGg/1SpqnX?=
 =?us-ascii?Q?JlfnPujfVqDNWxqxFY6S1NQn+ZBzsjzqsy9GsQmXWBw4KPfreJKGOxs09THH?=
 =?us-ascii?Q?luMs8DhdXmS+f3GnAbmJNtcwBnApLmbhiAY2EaCsYyepxOvAEWyEdu5jMRte?=
 =?us-ascii?Q?iEKWDCuA19J3hbk8XkBRjB2SVw43X2sCNHsmwnut5T7amNIz+tG00mOE1yIb?=
 =?us-ascii?Q?C3XZotFK5Jq2XC88rWwgUTVekYLucM2Mb0un2PtCqHduEw3x9HN/MTnd9aqE?=
 =?us-ascii?Q?hyzjrsDQFK22UB3izx9loeqw7aJVRpg5IRm2RHg427a9Kd4oWyDOyGeKTMsk?=
 =?us-ascii?Q?kN/IQfGDNiu/jGX3wboYdpvAMUfO7FiR+0rE/K6qXqBgBUdfaqnXHIUdTzjX?=
 =?us-ascii?Q?+X3QJWpCT6+EjjSRNnB9/mTc3bFHRd7LgeTGSXqkakPHHIAnink90GchCdBX?=
 =?us-ascii?Q?rpsSdMLlh61MWBxeiG+AlnCcgSogIsal3aT9G68zmEwGyiV6nAAXs6LnK9S8?=
 =?us-ascii?Q?PvJiSQNrEQmvB3Vu19xiFb/XHYwUPTZ6JrTtoNc9/5zh0tJoQbiXQMEbn3Co?=
 =?us-ascii?Q?DGhxr+qcjwbhPxQkWf2yYSa2dmnh0foewbnYxa9/f8W+lbauiD4yyJObfz/B?=
 =?us-ascii?Q?iYAU40OQqnnoFIBC6x09m6u1qQmBpuzmBsawbpk8mTN7ooikWFNt2R1BnXCA?=
 =?us-ascii?Q?wB5k5VnMn9QQtnia4K2gZO0PScjvnbP6NpM4xzlymxsZfAte5JYO7RvXk0aF?=
 =?us-ascii?Q?+RAsaq0i2/yLKbaoQvImA39bjyvHhcPLhJMpmZg6Aj4b5imJR3qStsUcsEjj?=
 =?us-ascii?Q?YHGMw32/T5ZcYGoG4nHw8yDaHQDoQ9SU5hVjc72ygIG7PMPcXRQ7QsIu9vf1?=
 =?us-ascii?Q?rfN/e/L2TNu8B1rhCRhHD3Rc0ng626NaZVdoOw6XDlAbUkXRlI4TEjzwy0QC?=
 =?us-ascii?Q?lJ4UQfq9P/AMNfLER4YwKp9+PHIOdCICxKZGDtECkIhknJrB3nj6EPcrahgJ?=
 =?us-ascii?Q?PSbjrNdz68BhtAHX8BZfX9yQU6/niX4Qy2enPgllypgeA1WO1UerQNzDfpFH?=
 =?us-ascii?Q?wtHtraTYQA8l2WmmEQobV2OMqbNRjOT69XypjpivyP3nCia/wsDWLqEtEzJS?=
 =?us-ascii?Q?kive3P0vwUsidLHc4dTwOFoiZcD2acZja6OOqBvrYJbClN0MenSe914cpdI2?=
 =?us-ascii?Q?HhwBxZhNtyg6O5pHmOobTwDEAGcRw7beVQethwYEl47KZA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l80TuDPjiT2q7VWVAxiDMPlFmkv3UlZ2KBc8iXrfl0OPAGs1WhYXxDPEmptW?=
 =?us-ascii?Q?OQ0QEl2hgBhpDEphSDdfJGZ/DNF69noLQVH7wihydiuUm4akTEZZ2v0euXxZ?=
 =?us-ascii?Q?Tjxy8Q/yzm0YtHW4SXEy3IrYBqARKj5+euhSqnRxDWUw79IN57Uc63td8bEa?=
 =?us-ascii?Q?veqVgQHD03QaGN63HF21P9jhnHB5Bs4KbpoVpST7mTdE9DmQ63tBKtCqKgSB?=
 =?us-ascii?Q?WldKl0nt97Na/078hip/DHoaRQUPxd7TW5YWXk2VQTWAoBBuoCto/4tAY7PZ?=
 =?us-ascii?Q?WUz62Hb8fTaq30Hz4TGzPBLhI1TPOFQWrlthZXwNBaTru2rhAVqTUUjL8yju?=
 =?us-ascii?Q?0YFiXHBzqJ9jTLyrK0g31KvWnR1q43k6XAPKVZkaje0+anBu+zguUm2XC40O?=
 =?us-ascii?Q?3N0UrEzUS2+i9nYItCFtB5/y57dgGIiq/fh1UIobpmClCw+WDPS4mejJYSbw?=
 =?us-ascii?Q?WZHWgcFJNfFQ0nLBUFzbwR1yrO7Jg7SEfYjh8ZLJdTQoYc4x7WITxVsA9SbR?=
 =?us-ascii?Q?ibQmJKm0U1wJ3rLlz6u8+R34RDJneULdnTCnthxQOF3IgactINllYjBEwbEo?=
 =?us-ascii?Q?2SvDQCuv3jZ0INn0KpT0leWSkQb0Bprbjwwro+2PANq8mK8mGeASd0ZTXc9q?=
 =?us-ascii?Q?fAttyFs/7bPxZd8mP/N3Sq2adoGs2EYAQgVxZ37QhvFCGAW1bHL7tcHXEXDN?=
 =?us-ascii?Q?+KfE050jBbwJOFfcD/vBbbzxKXAY+2yHPpCdPh5KP73jsKvRL1XlWCvZFrB3?=
 =?us-ascii?Q?vVu19X5Fmvwb2BpgGvL6eaBKLTaxd+IX1dmgEDo9QGSJm5o0mS7mzSIuzeBw?=
 =?us-ascii?Q?iIC2CrOxt8l6AsWWMU19NKQYptHavI16j/Hv4DekDmmQrF2UWSQeESi8t6W6?=
 =?us-ascii?Q?sjpPTJWWBAsa+IQnfZAyGLpZ4KUe2U0e3HFWUN/cmXR7S2YStlOUNU+fJsa1?=
 =?us-ascii?Q?+TY7VAnIejtnsx0cyP+as/k/FNpnb8rzt5g3QFYyT2Pil2Z6xZ27sqhqy6WB?=
 =?us-ascii?Q?eRIU7V9u7k2xdWXZK91xuGw1lU9D4RZeMpl3o4m30rQWMmCUGQT9hWTOAk8Q?=
 =?us-ascii?Q?nlf+43Mkl2RUlldRfAynGmP1lBrX6bNcX3sd1gEwDcNI0aZrvFyWUPFCTGuY?=
 =?us-ascii?Q?M8CxGcq4CGFO+EnLBuBHUx3ujy0Zi2sMgj7IbyIRozaY55njfeLggcRNK9DL?=
 =?us-ascii?Q?9ubTL7F04GbjLPtBtGNnHYCgByCsJh7/7HoCeqd2+woykmzy0ob/8UEtUnRk?=
 =?us-ascii?Q?H2ACNxuWnQQL/seBeihuU19FosqHgvsYBNUqsrpG1+s6d+Yg1iltLlY1jhO0?=
 =?us-ascii?Q?mAB9bFFtOo92iAhG0gTSvMzSuacVmpcW85Jnvf4nL69ZqchaQIsNFqlQDh+J?=
 =?us-ascii?Q?S2870z43WmTcVYOypxv0k57d1jfHNNsowV2VSIS41imnUyXDRSC0Ntn43cZP?=
 =?us-ascii?Q?Mr7GY3aUQvpd2Znn56N4uMM7yAt5CFFfVAq5SOFgfoTnMHg7+XVOaGc80ty+?=
 =?us-ascii?Q?jnEqZPgAjfWCQKnJz+y9FXiisBygOGNFIegA1CMugPfTbAIdlicRuiU8nAMa?=
 =?us-ascii?Q?/TZC1hr4ezKf6Pc5QCQ3FRRQg7YqqY7jM2SJFTfdW4DuEsWtS2yUIDeLQuyj?=
 =?us-ascii?Q?Vg/KBEJj10HdNa8eH9pjoW8=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a8uvMFeFbamOKp/2hbfUZ7upPLHFDaVB9AdTOUCdO+OyJiyTAnpyScFAFksryfjwku8bDwtQMYhsnAhFQoQpok03Or1AxleKmywneefPUzPXlPRGg17QLaWuSaMlL5c3S5PtNZrN8OLKmYZoiA7b3CQgnSljEZqOmJ7BrPG0r5OXrMHIFs3oGusikreq0Iu50Fwq8SdGcJydIAgcM/ul9SK0NW5Ra31srsdebfkYTieBohSyQMtSwqh1ot517DlBb7B4Ur6zjA8/nG/lJ86Sx9uaBH1aUtotHxNyRP7EQ5PVfiwPfZsCBvTbqJjmtUKGVbXXtGwHVQYoxwjetFpba1o1SbwHMUc9yus+guhR0XJJGipeoRjcJwKaqDpAMWDXowsqd4c08QGjBejuRVPfbDKCcJr/v6K14eVwcrDp9C8xv7wJZTKroRT7zMngIc/4eY7GmZEMKMODPAsSTk2NTEREwApmV6+NCSw3j8qcla9KvcSTA5wmw8uBF87n81TWrbASbtXYRq6B3KRFvyDTtsZC42QuaGUG3/O0BGPuq2vddX4hL9U5UKJDDEfN1ttSIANv++Y9a6bygNaChPfv1ZqhjtdksHm/a1/KlTyLk1g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c30fc129-e04e-49df-851e-08dcd4d2e4ab
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 15:35:42.5148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ErV0TQRTs/rPj7SuoGc2DCBtwJfyBkzcUjHurgBi5KvEsXsZ8DoYE7hJMKBwpDSfewPNB4Yfq0fBC8a6hl+dQYEf5S7s43G7T2upPzitzCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7229
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_09,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409140110
X-Proofpoint-ORIG-GUID: zECahDMptM3EQHwUeJSqRlReUi6Mdeyn
X-Proofpoint-GUID: zECahDMptM3EQHwUeJSqRlReUi6Mdeyn

The unittest/profile-n/tst.ufunc.sh test could report a false negative
due to the filter not excluding ld-linux-*.  It also did not filter out
unresolved addresses from the bash process.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/profile-n/tst.ufunc.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/test/unittest/profile-n/tst.ufunc.sh b/test/unittest/profile-n/tst.ufunc.sh
index 28b7c05b..13231539 100755
--- a/test/unittest/profile-n/tst.ufunc.sh
+++ b/test/unittest/profile-n/tst.ufunc.sh
@@ -53,7 +53,8 @@ if ! grep -q 'bash`[a-zA-Z_]' $tmpfile; then
 fi
 
 # Check that functions are unique.  (Exclude shared libraries and unresolved addresses.)
-if awk '!/^ *lib/ && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
+if awk '!/^ *(ld-linux-|lib|([^`]*`)?0x)/ {print $1}' $tmpfile | \
+     sort | uniq -c | grep -qv " 1 "; then
 	echo ERROR: duplicate ufunc
 	status=1
 fi
-- 
2.45.2

