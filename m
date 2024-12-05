Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A401B87CF
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 22:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733436325; cv=fail; b=l7hMdCpLiFkAKlWJFLdQki+BxKFvKUCYovfw/0eapfd62dapFMEDxsyGYwdKtS1mkWuNVJc35uQ13KBiOfXvjXYzD6zH4PEcJHbVL38Q7cBJ69qvNpCsS4tN0oW+c6ES+rfpqqnPINSvQ4RWuw07gWttWc3smbth/aNjH2T27vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733436325; c=relaxed/simple;
	bh=uB1pTWn3TV+dhRqOX2TzBplyw7htnRRPquaxCFwpZkM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q2SfbVM0T6eM85j3pAdlSyCGtoPubJBMxya4XZsnbzKtlQS4jzLOvGjFLIcaCxOqWDXu97hkNCzCIKyGB9Nz7QUbw6YalQm9pgDXMmLIrCn/98OlrDAqggS/yib93qIhInV28lpYjERA8cushsBbnRhRMSxQA2ikujLj2UFGiKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oXcqQcNn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dyq9ihw5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oXcqQcNn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dyq9ihw5"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5LNZEl025134
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 22:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=C+wJ6YUPtN8XQtKUzXVkl9Sfg4WhrMpVy5YABIW0ohk=; b=
	oXcqQcNn5G8V90/q/QnNw4yfQ4ZpYVO3BghMaUXWIrIlS4oFqDmRNP+JJk9HvUJj
	uvaPOfWS0I4Ym+0Cg8S5hcJlrMW9LIGrhjrncaRdF7o6PblyknlpcDbpYRL9Fk58
	WT/c27/tsWaBr1EL6a4pyTgjffaRdaBR3WkAgyr3ZJQHUQiIkOHWabZOYnXuLJiN
	sjqVqbWVoC8XtM8D6nxiA9Z2jk0QpIJz+/GrpbXTBU9FyqED0n3v+5JwPrqSNQeO
	Wt1kWBiCr76MIOv1otaRDuPAy40ReQuL0E8cIJHWB8s7At0k3OAC0nLzsLlKXlCr
	MulbcLysqspumf3iEbDsBg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437smamc4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 22:05:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5KFqId020345
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 22:05:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s5bhqsx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 22:05:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y65b1lTm1JTg86XSKMRtSZhdqJED48vpK5TdjOGgQQRDI+70Hc2hxki9NcexqW09xmY1fmtMJwpTg5PAJjvD5kQ2LOhh5ui58tLuzq1KMkSfrFXGj+JYoU8FL8gEVnNPbjuZfGmJICeLPML+4iCyBuTyBiO8OGEy3+a0+vp3FPRcOy0xMwATlEDa2AP4Ppk7Mf38/sUIMnETeHTm/PToXrgDMQQst4TvEggR2cIprJVstReWW5vLT9Yf17cSj8iujJ7CZbGZNHEANEfYY3kWpvmUbajwnLVMLZFo195XQlEQZyBhcnzwza5To2BDcoWgQhJGnYSx45Ri+gg7Zvw6fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+wJ6YUPtN8XQtKUzXVkl9Sfg4WhrMpVy5YABIW0ohk=;
 b=LDJoAPxFFnCuwa8V2/6wyPars2PENUVBtkwNBsqw33yDE+jrRG3ShqSblmOw5GjgdeWRpmJ3vR/Un7+DnqX1WKk17W0zbNtQ4H3u/YYyKOup/vcib97jCsQm5sTlbE3Cnex9aj2a4LEfAWtkbPIVaDwqz4TKPb6WCMSz/929OzOAwIX/PO6vRBhTz4AfyPG6RQ9CxrLcj7IB4+zz8z5OFDMevjkW8/97jtYQmCa2RMb03IwoeLaKNuuSxKU+VFvfRxIh8OtYP7fKQku8oF/6DuMuYPY7mPkuiQf9U3WP6K+YXuQetDzCnBwXyEVLy0tZk/ySTABm/vY1ftsRe7CLjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+wJ6YUPtN8XQtKUzXVkl9Sfg4WhrMpVy5YABIW0ohk=;
 b=dyq9ihw5o48etN9c6hE7HnGMGnpAVas8avaAKRIABMEgXQMV/g+AAt4XSSMeFQau/qvJwOPHyEUS0/bIk6K50RRoXw/I59l64T8rkUb9HCHX6xWlH7qhYQXe6GlwXBwwAwHmfahbYV5vYGn5h9bZZxGshHZ+9HwXLbN5EbzQioU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7400.namprd10.prod.outlook.com (2603:10b6:8:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 22:05:19 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 22:05:18 +0000
Message-ID: <6efebe82-1f0e-2fce-3c78-cb734be36273@oracle.com>
Date: Thu, 5 Dec 2024 17:05:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 2/4] fbt: clean up fprobe/kprobe support
Content-Language: en-US
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
References: <PH8SPRMB0037647B2AD6DBEFE5E31417C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <PH8SPRMB0037647B2AD6DBEFE5E31417C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:52c::25) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: a9ea99ae-7e4f-42df-8824-08dd1578e7d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WERIbUMzd0NxRjlhYWViSW5VMmhUdU1KU3BBdTY3My9qNmFoemRFSnlIWUVw?=
 =?utf-8?B?UDBVNVRGUGhDWGlwYlR6cVNQc3Y2NDEvclhzcy9RdHFrREhiTzluZHVCZy8z?=
 =?utf-8?B?QVNKRTJ0VkZta3FDbUJQdTNtR2syamhKZHdvUS9Ud1B6WklQOUJjQ1V0YkdY?=
 =?utf-8?B?ZXErRXExTVN5OUZpdXBOT0NNNVE1akFwU0lwdUJOQWlKQkdxUDIya3dqVkc3?=
 =?utf-8?B?bWs0M0Rnd3I0WGtHQTRSR29zcU1KLzd2ZUZrUVFERE13VWkyMmhMVWZvV3gz?=
 =?utf-8?B?Y0haS096NDJHQUd2eDJ6T0x1WlZaVEZuaHg0d1lCNDUrUnJ0c2UrOVpodEZy?=
 =?utf-8?B?N3owb2tJZlhMajNRQjltL3lzay8vbEk3VUN2Wk14WGJWaXRUemRRdUVYZHNz?=
 =?utf-8?B?UzV5UE84Tm10NW9aS1NScUtJaTQyaCt3elljVG8ybGRlQTQxclR2T09zajh3?=
 =?utf-8?B?dTVtSWZxT21SSXVrdWZ3Q3pSMFVIWG52dFh1ZzVDREQzSkFEcnR5VWZxakNU?=
 =?utf-8?B?V1dJQzVFZDNtVlpKd0ZmbWszVVllaDlza0tDczd0RGhKdkdOb1BDc2p4V3lO?=
 =?utf-8?B?ZXVEbC9ua285ZEpsQlhWR0pDWVRxTzdCVkxzREVmN3o2alZSUjNCbVp3UU9u?=
 =?utf-8?B?eUVFTk9WTVhtMWhYeDVGb0dhb0Y4RDlwejdhWURFT2haekluYkR0MlZDMEFU?=
 =?utf-8?B?eTJJQ3JLSm10ZlNncUt1eFFNVnllcWFXQnhNTTRxTTB0a3hvYk9BTWpnZkhy?=
 =?utf-8?B?TzdxRHJLcEswV0dualhEUXQvcmxvUkpZM1RmbUVFcEJLZWl4VHhPc2ltVVRP?=
 =?utf-8?B?ZEVBMFJNcHdSczB5V1dGeWpVWUNBaEVVVi9pS3Y4ZlVYZU44YjJvL09NbmIz?=
 =?utf-8?B?RFJFYW5wTVBSemN1ZU9wMFpvZWhmbzhybUJxRkZEMnVqTG5OY081b3kybUtS?=
 =?utf-8?B?NURGanFtb2VDVWd0UGJqa0VQaUt2SkpJby9VUm52Y09YVWpJMFdPU2cvT09m?=
 =?utf-8?B?V2YyaTY4cDAxTWViakNaZXVmNTh6TDlGalArMm9iNjB6cGRKeDd2SXdTRzFR?=
 =?utf-8?B?NjV0bGtVMVBhaFVaMFNnbnZldG9YOFp4d2hOY0tabzBJcnRhUVF6YURzcVRk?=
 =?utf-8?B?dGRLakZISTVpMi9xNGtMWFZid044N2wrTmJ0RkhSVjgvU2p2WU1qeTZjY0tk?=
 =?utf-8?B?N3dPMlExdjFyTW15amMzQWZ2VHdVL3dtQjU5M0xsTEZURHFHTE5TL1dSYVdr?=
 =?utf-8?B?aEhOc09mQzRpS3JweUxzeVpkeFZUalNsbGk3b2VGYitTVDVoR29KeFlzdWRi?=
 =?utf-8?B?dnpYQnJ5MGVNSW1JYk5uTFQ2c0tsUmRZKzN5dGJuaDMwbEh2cUlSOGlwNVgr?=
 =?utf-8?B?R2srVW5IR240a0NES2taaytXTFZ4dUwrckVrbzBxNmpzenVOTWd6UW8vd09T?=
 =?utf-8?B?djNoNmRIazBCYXRkVEF3Z0tPWnJVQ2I0TUtDQXdLZ2FYajBFTEQrUFovUE5p?=
 =?utf-8?B?K1E0UG1LaGltMTVZdGdkTlVLMUdubEZ1c01BeTRZUmRBUkRMQnYrR2dvZ05B?=
 =?utf-8?B?Y2s1UkJFK0hiWHk4SldWT3RUeEFZTlBTU3hJZ2N4RU15ZW5TR25kQ2YyaGZS?=
 =?utf-8?B?WUNadXl0NzNmMUR0RWxsQWQ0a0xTNXh3dE0rb0sxdnpVL1k3b29pcXppc2RI?=
 =?utf-8?B?T0V6QU5lOEhMdzBtQ0taVUx4eU1FbEhxUkI2L0ZUOWRXNDZURHM5K00xS25Y?=
 =?utf-8?B?YkVjYjIrK2QyaU1ZQnZxQUNQT0prMUh2ZnlrYlZkSFdyMTFVS3pvbm9wWS9n?=
 =?utf-8?B?NnNxc3JnazltcFZqTVNhZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VW5rTkZLSjlHdVdkdDUvaGxma2FBbmdCMFJwTVIrV0tLVCs1M2xTcSsvZFda?=
 =?utf-8?B?Wlc1eEJzbUVjZmdIZlhzMllPRlQxTHBPaW1EY2VHMW1WWG9XVGxGUi81RlNN?=
 =?utf-8?B?ZmtHUGxUYTFEYjBKaVBXcklNYmhIanBkR05FUnBoclNTTzErM1Bldy9wSkZx?=
 =?utf-8?B?Q3NWVkowMm5YbTU0QXBGYk14VE01ZnVsTVc0UG14SXd1VVZadXRDOHppVnA1?=
 =?utf-8?B?STZwSTZWbHhjeU9tbTNWMmVFRGM3UnpXSzZSQzdMSEdzY2ZuTWM0K25ZK01r?=
 =?utf-8?B?UnJPRG1NYTd6MURwZEhSU1AzT25iYVBGRndvdzdkQnQyTnp3ZUZKeS9BODFt?=
 =?utf-8?B?TjRQWTVQVjlyUjUzQzZ0NERCbDFZWXdPY29DNkpLbFV2SkRvUERTWU42TzdO?=
 =?utf-8?B?dEdCYjQ0Mmg1TFVwSGx5OTIrZWxHQjN3L3J1alFsQXBqNWgxdVhpTGZ5SHdj?=
 =?utf-8?B?WDdmdFcrbWpaekdMWmxqUGJDdFBrNFRrRzZCWWd2SzBSRjM4SWlReGt4V0JS?=
 =?utf-8?B?WTRTUTYxZ2MrbWx5bjB1MEFOREluY013bDEvZjBhUnhZZUR6bzFzcDN3dEhE?=
 =?utf-8?B?SHdjL1lwYzRiWjN6bHRhYWxUQk1wcEtLY2JpWXN5KzFhNk8wdlRYRE54Mm50?=
 =?utf-8?B?SmExWnJSelRFcXptVkx1VUM0bXg0c2c2eDlrNVhaczcvblY0eTdzbGplZ1pu?=
 =?utf-8?B?SUF6UkkwbHFvMUthQ0VSa1lmTGJMNnpUdTdneWRNTTRTMjF3eWxEa2hqdjEy?=
 =?utf-8?B?TzlsL2RyZG1oNE9IT3Z3SEs3eFBmVkhoeTIxMkpPbGQ2eC9qbVFkQ2pab2NJ?=
 =?utf-8?B?UC9SNkgxalgxSFRHYkxGNzRnMUZqSnRhaGRhOUZSV2Z6SmNkSStzelVtMURM?=
 =?utf-8?B?RXJJdTR4M1ZWRC9hL2hVVG82bWtKNk01UE44TXRlNXV4RGFZZVR5clJjSDZa?=
 =?utf-8?B?Lzl6QWtocnpydSt3K1FuMlRNeFB6azJkbVU3UW9nZ3VUenc1MXNvREllSU1F?=
 =?utf-8?B?WGpqQ25YNVl2UEE4ZUVCeGNGbjMzcGRvWXV1QWFxcjI5a005VWhDNjVCN3ho?=
 =?utf-8?B?cWdVU1IyTnFwOXg4ZDZMZjZ1KzhweW0rU1Fpb1dvR1gvWk9uYTdEL2pBNm1j?=
 =?utf-8?B?MklYQjMvcHk5bndCOGZpci9ZRlVGdXBXT1UraHVPV1hvZHQ2bTlPU1J5SXN4?=
 =?utf-8?B?TEd3b2Jyc3ZMd1YzT1hZZU9VNFFhcGlUNEZpaWZSSmlqa1hiTUw5b2VLWDQ1?=
 =?utf-8?B?dHdLWUhheU0yWndYNlVORDdNWHJRc25kQkpSQ0x2bjJBZVRwelBLQ0FWaEsy?=
 =?utf-8?B?Qk5UZ0xLekFWdXIwbXYxWWx2aDBEdW9xL1o3M3lLVXN0NENkZ283UkgvUVB4?=
 =?utf-8?B?Ui9qWXVxNFZjbm9sbnFCRFFvcllKdmNmeTZod3VVbFd0NGUvd2VGejA4YlMw?=
 =?utf-8?B?Q1hsT2hxY2NyR3FNRytwVWZJNnhtL0pPZWpzQ3RFTXJTMG9UVzZnTlN2cVNo?=
 =?utf-8?B?R1NNcitVRXF6dmRGcGU2VDZqQVVhM2c5bkRsSG9ZVTF2TFVHLzBRMStWTmVO?=
 =?utf-8?B?V2l5YlZVMndpL2Evd21BNCtXdEZzVDBTRjV5ZWpvL3E1VVJhVEVLd0lNRmQr?=
 =?utf-8?B?M2lHbDI2MTJTRVhIOHVLcis2RlYyejBnQ040dnFxOGh1eDBPQ0lrSk54MFFC?=
 =?utf-8?B?NXl0alY1SUJEcGZleGJLWm95RzZmK0JMbDc5bFhlM210NjI5RUp1MjF5Risy?=
 =?utf-8?B?ZVZUalNVQmJib2RZQXFienorcHRzTHFGMVlXdUFBNFdqTXhnVzdnTXh0bWg5?=
 =?utf-8?B?dnZXcUZrUnlvUkkwclByRWxsdzE1Q1JJaWlEeFZDZEtFd1JCZmFObGxsVytX?=
 =?utf-8?B?MU1rTU16RmNwRFhuTFVjQklQM3lhbnBGYUFUa08vdVZLQzNQamkzSkZtd0tr?=
 =?utf-8?B?SkN6elRVVUs3ampWeStldnc4OWtLWWo2YjlmUG9UdnE4N3VaVDhDbHpkaU92?=
 =?utf-8?B?YllvN0NEU29MOXFnY29vc0tQNGtMMzU1WnVEa3ZlU3lsY2hiQk5OV2RnekIr?=
 =?utf-8?B?RVh4U3RUV0R6d2FrVk8yend1SVY2WFk3cXNIS2xqbWJNTExWdUFJMFE3cDBw?=
 =?utf-8?Q?G6ecx4agmgxtNMbYJxV642TsV?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e07AQ/F3sKPYykLSfg00hv705sV5mr5khscC/TxZuHWZJrDVhuQ64kVSXTMCeWZhOEiskI+S+4cbxjNMGWA/VTmK21J1UHVhwpMOI2aWlxarpg4Kp1mul/Ke36dcsF1LqduOrjAbijQ86bZqquiR1ARufv+RpFvMLHAL4qhigBSNn6QoXEBVX4yYKWMdyIrtxy0kdreaFtHA5i0wwB8FIDVHm0UjCKlPoMpz56PP4FEEBu4bLwWBC4t2Axx3AaA4eaBSghWQbDINWOZJoUK5RMzG/xrn5RdTR0ZCxca001b3VbbaIinp0W66nKmVfreYcSP4ijjkFWh3bsNZT7xb+RUzPRvFdvt6bV6YtKlV1MVxoBWjqul4zRcZ7gKVsddOqj0O7LD102wmqfd5iZm5I7/Vj3Gy8XEMT761O+2qwv9Y1Lw5rkwsz2aKQBEhXMrr6L/zgdJGLJ4nD3mcqwPlfzXDF+1qjJyhCNLwZtVeiwzGLp6oO770oAIA6hhm5mj8yA0INtFCy7Gzx/c9IeYymIxlUvVUVVmvAKTN09X7N6Q3WrRuhE0tp0qbp0bdOQKGo2GtRTB2gQXGdeL/cGnL3XjfEDo6hDvsb67wEBQr8t4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ea99ae-7e4f-42df-8824-08dd1578e7d9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 22:05:18.8951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0AXeMCEXNaHlQ7WLmNvu3QLQfWu+Vp58oQ7G8YtefalRZaXJ3RA7MzkJC5tzHJlEkjqjxktspCFfKJdVYiV8yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_16,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412050164
X-Proofpoint-ORIG-GUID: P5Qzmtp7N6MYBtfIy-JuaKWf2pEWHiDf
X-Proofpoint-GUID: P5Qzmtp7N6MYBtfIy-JuaKWf2pEWHiDf

I wouldn't mind a few commit msg words on what "clean up" means.

Mostly, how/where is dt_fbt_fprobe used?  Put another way...

On 12/5/24 13:53, Kris Van Hees via DTrace-devel wrote:
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> @@ -73,9 +75,10 @@ static int populate(dtrace_hdl_t *dtp)
>   	dtrace_syminfo_t	sip;
>   	dtrace_probedesc_t	pd;
>   
> -	impl = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? &dt_fbt_fprobe : &dt_fbt_kprobe;
> +	if (!BPF_HAS(dtp, BPF_FEAT_FENTRY))
> +		dt_fbt = dt_fbt_kprobe;

If the BPF_HAS() test passes, shouldn't we have basically 
dt_fbt=dt_fbt_fprobe?  In which case, one might arguably go back to the 
ternary op?
