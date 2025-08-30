Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3606F06B
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 03:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756524061; cv=fail; b=rlOJ0orB1vZKCIoMo281q0KnVrHg5Rf6ySUETfzpztLzxKOj2W8z7q21aR2o9/84xy8ry2k7vScFPGxQo6fxPNRLtRqUml8w6HxGNrN49kvy3xC078uenB+jVB088BF9F+MiZo4nazQjSGP1LYG7K0UpKop5n8o4qURFoEkrJxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756524061; c=relaxed/simple;
	bh=U/bxM0nMGNd1X0nS1GB1cVEPfv4pi7vJsqsMhjuSmIs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KTnUJBPwd4uJq1rucdB10WmOw8lu2S58yEshi4IfoPKbGhO9vYiWLgfUcqcQUOuswjPdWAk0aI2ZmBla/c27npQjZyaRYTjv7uQfO0jU3zmeQgwS1RqJRDSxoGd9+HDGzS2SnV38WPiOU+ZVbyPBHczHAHLcZJA1eZ8kvNYZ0CU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HGt5wH0N; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Nwb5ZdEu; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HGt5wH0N";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Nwb5ZdEu"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57U3E4Ah025916
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 03:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=yoAhZ/nM967gGSeLn8GGNLZxkEnbtRYP64CshkhcPEA=; b=
	HGt5wH0NjuLlZgPaHg3LLzP9IGaJR1dAwC59kw6hJ7rmbuKaaPhf+X/Ehv+yFvat
	BQCTPeklyGFVDz1ITe6DtKTjL3VCqbEbHNITd3wUOlAPl/bzWevvMKKQeK5/q6Hx
	NjxEvX+0QDaTdXjrUGUwII8JOhKj4VAFEYjuXNbfrtr6Wzp+09BPpmrmAWK3EmCc
	sTWzp9uspooP3qQDzyP8KHZUyi3cIMxJL0ySHAZ+oLRRRIMrhfIpxx0RoJWhspi7
	Np7bbrb4rwG7egkxNShyPqPmi9ITAcZCClUszn7Xg+m6OYkE6K2hK6X4wTVrZRLM
	npEoQD4OwS+AW2WwwlaQog==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48ur7ag154-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 03:20:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57U1XtJO037945
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 03:20:57 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48uqr69qr8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 03:20:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZBtjG1TfwBj9xvdj2mOzUBo9PXboYzfR2rfmyw7AJABsHzcaLNwa5XzNSzpa84Zq6rAW+w6xiMirJeFPvDBii0s2FvaNtH181n8Q5LQ2oOow9AdLnbojpQ3tdv65yIsEPSl3+x57bR2nEMWlmNqKUQjxKpXyYjxsQbkj19nmNOnNwrylj3R9yXOGS1CyADIbVA1W4pibzsLEzyC2XmicM5OdE9fW0FPOIU1vX4ij3s0kLMeqBLO1j8IrK3RcGU6BAalP6zwyfV6CIYCVeY0L+sEYsXo1RjIvP8OgZGWH5mJmwUbALG0A3H3UeGCaedxzm+SYHo+bNj5oHVcPh1RRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoAhZ/nM967gGSeLn8GGNLZxkEnbtRYP64CshkhcPEA=;
 b=fpZWwBmDcB8SaLYexcpj/ce7FdzfAjd7UhXp9gr60Q5I3bRzQ8NKgoleRes2GJvoKRYxJFPTzzhrgkTlU9YRSs+/nlRwBrl/d6Dth62yTlD5t1AV0erSY4Cs0kY4lXO0dVlpmxpyoJZtX9wGx3p6Xf5kt1rISbXp4zWaY5URaPSpvBnnTlCIDdshowM2ombIwXf89oBfCilPjV9LgDuZlsf09XT27L1jfk96nvxbczTVaNqFEB+Mev3I4o8Q/Q3sflBm2MvVL5N9C9KrB+MRWMbH+IMt8LcAwVy6hBDlljK5kawx0uFivxDvJS8iuN5MyVwzHjkAO6p/HXkD/tsEAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoAhZ/nM967gGSeLn8GGNLZxkEnbtRYP64CshkhcPEA=;
 b=Nwb5ZdEu7g8Jsw7CXdnKGETzTvnkQ39uB0wGQNUIKEkw35/ZS562gC6qO5ukvLUaU8MuFvFT4yAivdiKIHZXNbxo0XfLvsdK18Ug2CLzNfo+9YHFCwaUre+yGJlOlv9ymCKarr7U4tS4DcvYHFq0NZxcrnTtAM5+ZkaB+RhPL28=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB5972.namprd10.prod.outlook.com (2603:10b6:208:3ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Sat, 30 Aug
 2025 03:20:49 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9073.021; Sat, 30 Aug 2025
 03:20:49 +0000
Message-ID: <02e33d7d-be6c-5f18-32e1-92fa28e0984b@oracle.com>
Date: Fri, 29 Aug 2025 23:20:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] trace: print alloca pointers as actual pointer values
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672B1B0CFC6BA287D97C4C5C23AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672B1B0CFC6BA287D97C4C5C23AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0071.namprd08.prod.outlook.com
 (2603:10b6:a03:117::48) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 9deb123f-a4ef-452b-e63e-08dde7743775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUVaSGduNlRJbkxjcGhPRGh4dzAwN3VQVXNYckxlMFArVzgrelIxaWx5MEhJ?=
 =?utf-8?B?U2NQVjNwM245UlQ0SjFMRUdZd05ydVdsUys5U3A2UlpIOHpIRisvSmdydU5a?=
 =?utf-8?B?M1ZvUUM3eEU1KzROUWlvK2t6Ny82bVRtRlVCVHo4dmI4KzJaQlJSTXhqZjIr?=
 =?utf-8?B?ck1Demh0dk1pOCtRckhnaG5HOGpBMVo2YkRKdktqQXdOcmtYLzd5aStkSDVz?=
 =?utf-8?B?MWtTaUdCRlhWTnBheVg0OGhwN0IyN3BqSHltS0J6U0theFhYQzhtM2JEQjZq?=
 =?utf-8?B?K2hKTGdjV1I2SnZRMTNLQndTNE1qalg3NHorN0luREpIMUlWSWFpWkZnZ3Q4?=
 =?utf-8?B?Qng5R1FsbzR2K01jNGFmL3lRRlIxRUZlcXN5K05rdnBic1pMa0pRMUlPNWoz?=
 =?utf-8?B?TVlUQkpoV2JFcFFrcmpnT3dZV1V5cGh2b21mckp4TFZ5YXlCM3pUcEpUdE9W?=
 =?utf-8?B?V282QVNHeTRoeXFwdkpEMHJPYUdveDREK25ScXpyUHJnK0lyZVJ4cyt3YUNV?=
 =?utf-8?B?ZVpyOHR2VktmVmhrZlZsSWdIbFpDd3lnSHFMVzFpUVBFa1NPZnhEdUIvUUp3?=
 =?utf-8?B?OE52Wk90OWhidHJWVlE2YU1uR0hPYmlTQ3lmUzVhSTdhcGlwK01tc0h2YnFv?=
 =?utf-8?B?RUNZRmJFR0lhc2Z5QTFweE5MczMvcXlFY2lFNDI4ekVBdlZrVURQblVTY3VD?=
 =?utf-8?B?dTVRRmJrbXBHelB3d2FNMi9nNXJwc2k0bGtweVFkUEZEMGk5QjF6Sk9FVzhq?=
 =?utf-8?B?RDRKMEd6Q0dydXlEOWN0Wm5SYUZiMitDcU5rZ3I5UzZCTnVMRXJCZ3F4ckNp?=
 =?utf-8?B?YTVSaFBGWGFvWnN4M2NHZzY2Rkx0UmhrL01LMk10cjVzWTdFZWh0SjY5TmZR?=
 =?utf-8?B?emZCazkyZWVFK1loUllmNjFmUUw3WlJQQW9yNXQzUXRQZkNGMW1qQnVnWDZT?=
 =?utf-8?B?SktLbkFFSStRaEpKMG82T1pLRW8vYUpNS2ZvbThqQUZVT0JKTE9OUWNId21u?=
 =?utf-8?B?MW0xRkcySS81TVZ2aWlhQ1htQmQwVFdnRjBoRkNxS1BPZ0JpdG9kRDd1bFVR?=
 =?utf-8?B?ZFA0N3FqUnQrRGZXVERwT2V2cDRvSUk3ZW4zdkc5UkJRN3NLTytHQzB6Q2hW?=
 =?utf-8?B?cEw4b0dxNWY4SGhDM054cEcwQTJWR0RXRVRldk5CSGhkVm9ldWRyL2JIQVo3?=
 =?utf-8?B?NG1IZlM5cGJYQ2JlblgxZUlnall3VlRSRWk3ZEpsakNObW8vWk1rUVN3R1lO?=
 =?utf-8?B?ZVlrcHluN1RYci81a1BUR1YrT2Ftay9aZTJVdGtNM2dHa0JaeWlRQlpScmF6?=
 =?utf-8?B?bkhGakdBSDdkZitscll2Tk5nMnJUTlZwS2hjMzBkaHZtS2c5RVg3aE1BNmhD?=
 =?utf-8?B?OFhXU2RIQ0Z5QWtaYk9kNXRoQUZxNFo1Wkx6ZVNrQ1hGV0k5dVpINjVJaUkx?=
 =?utf-8?B?ckV4NEw5SkpoM1pISlV0TWlob1l6aXdoalpWa0VOU2xFc0ZpT2RTRVlRQ2dR?=
 =?utf-8?B?SkM3YkhTTnVHQnFNNWtpYldmbERGU1dLOHl4L0dqZzV5RHBLK3hZa0hhYXEy?=
 =?utf-8?B?TzFncWlHWjBLTmZSLzVZRVVxb09sSm1aNXRpTW5QeDcvcXNwYS94YzFPRDZp?=
 =?utf-8?B?U0FUeDJ1UWdHc0hSYWZxZVZOdzZ6L1FMN1ZCUEhzUmxoekh0Mlg3UU9wS091?=
 =?utf-8?B?a2ZGTER1WWlDWTFDd0oxNUcwUEJ6US9QNEpVNjNPeFhMdzdadDM0S2RmeXdG?=
 =?utf-8?B?REZVYWpjU2FZUWN6K0Z3UEc3cGF4WVpncThKbTJpVjNXUjlrT0ZHTlMwaSt2?=
 =?utf-8?B?V092TFlTaFBONnY2aXpkSm92V0d4Q05RdmEwOGhxRXlKTWlnb3RFT1N3OGVi?=
 =?utf-8?B?OGZvRFpDajV2S1E1WDRjS1FHR20ydlZaUkxyN0lVYkZXY2RBU3RKOVNlTGo3?=
 =?utf-8?Q?qYnaGlzO0Dg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnZ5aU1QekJuZWRZUEdTRHhUMzdFSlAzL0xvMjVDYmphRWR1dkg2TEczWi9H?=
 =?utf-8?B?WHgwd0Z4YlVzSzA3OVZqaFRld01RRkkyN2ZpUkFDVlJPaE9mTHV1YkFkcC9p?=
 =?utf-8?B?alFIeEQ3OFhxb2x2UktqR0JZQ3NNQ2psNUdGci9wYnFBZ1dYeDBDQktma2d6?=
 =?utf-8?B?WTRSUERzVEY3ZEI0dHAxSXpXNHpnSDE1TGhPUzJFUG5qZlR2OWVxeVR6aVdl?=
 =?utf-8?B?T0Rhakk0TlV4U0tOdVkrSTJnQktBMnRJVjg2azJDcTNwSnI4UUdLMTJqMUJu?=
 =?utf-8?B?b2xnSk5JeUNWQnFaeWRZd2ovV2lyQ0k2NTFCR3pyUDhUYUVCd0FyNTRnaVUr?=
 =?utf-8?B?NlhJQU5pYXU1ZG9ETWV6QzZQN2FRejl5Z1F2QlhNWFhRcDFEZHUvK2VZSkFx?=
 =?utf-8?B?RzlzcUIvWTBBeDBFRmlMZWhaM2k5N3ZpOVd1RTM4blVhMkhiVzEzc0xXT1E0?=
 =?utf-8?B?ZlJXRmp0YUNtL3ZrWjhBa1JmazFKUHNDOEY3LzBpNnpYZ0FtUTlxWWljZkxG?=
 =?utf-8?B?RmRNQ21ISUdoTkFPdEhGRTY4VTZvSGs2UDZTQ0h4U0xuZGg5U0dqTnU1VkV3?=
 =?utf-8?B?eUN0TFQyR2lxUnAyMXJtWGRnbWt1Q2p4cWpqY0lyaVJtVm1DMTZnb1lUY1lW?=
 =?utf-8?B?SHFNMHNTMmlwY3h5NldyREpZN0FyKy8wSnBsVWJuWEhtMUt5cG9xWFdBUW4v?=
 =?utf-8?B?LytWQXljQzJhOU1MTGd2L1Z0a3ZzUVZQOE1HUHorQ29UTXROSDNWYnN0K3Jy?=
 =?utf-8?B?ak1KWm9KNnJkbGVJNDh6d2kwekFua0YzWEpjSnZ2OFdPRmxrVEZYZ1lobXJp?=
 =?utf-8?B?ZFhrMURZRGRvbmxuc3JqMGl6TklSeWV5YWwyRnVyMTM5ZTNYUU9xcE1CZXlT?=
 =?utf-8?B?NHdLNmhqZlVUcEFEaDhBZThUeVdaSnBpTWFDaGlQcTVmb09zSEJBNXZrVFBF?=
 =?utf-8?B?dTVIaC9DOW1CYXBwcnJBeEFQN2NVdnJna0hIS1dTM1BQODRBZDhZNW1Idmti?=
 =?utf-8?B?UmprN25XNm1IY1dUOUJGbWw3ZzhmQ1BEL3l3N05uUUd5Q01LM0h2OWdlaU1m?=
 =?utf-8?B?Z3ZWaVFmbzYyMDlicDBzOGg3Z3MyalEvenRlTDhXMDBHbG0rbzJ1YW5YMHNB?=
 =?utf-8?B?dkpMbllwOThWZnROTXVLU2VlWmg5ZW4zbVFKTDJ2L0hsZTRvb0FMV3pDVGZZ?=
 =?utf-8?B?K3hpbjhpTElmcWVCOW81bVRja1JIWlA5eGF2REw3OEZrTWlhNUZPWlNGZ2gw?=
 =?utf-8?B?a1pIZE5Cbzd3UGNsYnMrdHJXdlJhSUFpcHM3bWtvNkdkMGt4ZFNGaGNWays0?=
 =?utf-8?B?U3Zzb3lNYm9IUU1JOXp5TWh1Ui9wNjJ2NHZ3cmJmWHRHNTNkckg2TFRiVjdV?=
 =?utf-8?B?OTd1K3hQVnhrMVlVYlFBNDlxelZmSWpoOWU0WlRKb2tZckZMVXdpa2ZMZ1dR?=
 =?utf-8?B?RXU2bUE5aXRzV3FIU1JTcWdqMzljbi9EeG1KMGZRakxHMWF2WlNhVE5iekpL?=
 =?utf-8?B?K2l6NTFHRTNxOEliOW1qWmhBSjlVME9scGRZWTAwVmFjSzljV3pudmdzWDBF?=
 =?utf-8?B?L3p5M2NEK1JwUy8rS0pCTUhlcTB4Z0VpVFdiS1dWUXZVcS83Y0gwWUYxWDBi?=
 =?utf-8?B?QitJaWZjRHZ2bzF4VWhnMUE4aWkyd3BMVStzKzJXWGZ3d1JZR3cybmV6Z3pW?=
 =?utf-8?B?OHhGaEFVU29EWDdRQis0SDVnRnlvcm1XQUJVVkRrNWlycTJoTEc1ZE1qWWZk?=
 =?utf-8?B?OXlneUY3eDE5TGNOajQ4QnE3M292ZW92SDlMM2JzQlA2RThCdW1Memd5TkJl?=
 =?utf-8?B?K2tmSDRkTlBueHRnVkdPeG9BK3M3aW5MV3oyVlVRbk1OcC9SMForajIrM3Yr?=
 =?utf-8?B?N0c0a3VjS3JUY0MvRTZEVGM4ZFFiaG1JaXlEMDNLQmtJMkRKc0tDVnV5aWEr?=
 =?utf-8?B?TCs4VTlhaGpOc1VNdnRHdTBDZWI5TGVtRWIyNjllNFphR1M4T1JUR0NWRVRz?=
 =?utf-8?B?aWhwNVZZL1FNWE9MVThCVlJyZlRKUXZMOFlBU1ZWbVhhV0xEc05nSkhMUnBH?=
 =?utf-8?B?dEhYdm9zUTg5UFpFeUZSeFY5cVoxZ0dRZVo4SWZDMFlpUVBPamRJdmxMbGha?=
 =?utf-8?Q?vr++3keLo1N5eVvSmtUGAHGlg?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cYruuwAwZ3wXWKfqRnByvhMAFvHcTn2w+OerdC7Z6FqEagq0YvftWwlGFnw9q0XmQb9P0nj7owi31xV1qpofREz56g8eBsEMhC49ERCXWKqHoMR94YJz88eokSc4B+KzpsS776GMuMQh9l6JmrEDu44Ll6mkmlqrVi+qekdkVCpG59MDDf3zFxBms2sgoLEYVOt8t5dYVQYBS4bHvy+Ekxfo+DGlxBiiFv2IAKA1N0/qDRbcOHgxQxgAAqdiwJmaASJ7LwXY4q8jxtSj950D74hett3m3OsHFiR9jQtWn9Lr0EIsLy2gXN52bS6tK6bDIXiMm/SHUa46tsV/Z8bvveWaj2yy2Xr6cPDZozmEBbBq7FGSnQEVPcby/8WgakqUJUT1vAyzFqDT5DUXEMEN7AaftSK537ZXi1abq2hUjOw0NAvxizB8ehuU4N7uPoeY+A3R44zoP6mMIG8UpH5BknWYGy8TrlfVx5Koy6VwDiYtKT2R3NCNR9X6TytmwOnUfFRIsmM0Q5UyDZr53WZfORqFwIVnQDFE0CdFcmYdh45vyXz37Gq0NZfuQk3h6yASpk030KMs285RxJ5lOQd9spL0h6eghy4opEm2OXUEBJI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9deb123f-a4ef-452b-e63e-08dde7743775
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 03:20:49.0532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IMf77OzxCTjZ+nL2j9WQV7JBk/bo7Mc8JcbwaODI9H5bXw6PCDARVIBIHO9ZYfLsKIwSRowPyda87Iw+GHZmng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5972
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-30_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508300030
X-Authority-Analysis: v=2.4 cv=SPhCVPvH c=1 sm=1 tr=0 ts=68b26e1a cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=4w3q4GTq4w6_yt4sKnYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfXxociWryWXbAf
 Eav+36L+NGG6FWCEfpxzNo+wXLawwLLBBqS1SABuoIgGNjIBiabDXr2j4gorrGQj6/ERuD+ClR/
 sI+B0XQnfcjJ/qfdcuGrCYLPWosjH1w3Fih8T9uNXn1mIfxmRbxGfO6TP3rFGgLB2Ilu5SHLwaD
 30kU19RMPMVRDRxw5Ig6vUWTzsJhHyGT74pvs/MFTGTHx19VE43M5ME0VRkVP3g9JYrP6jiidqc
 Zw7jlr1N3G5+t33a0CFEk+63z1M6WVkyHb13QXXFRhtbo1ZRH6fZAXovSmlLsTXjo9qf78fvbJ6
 avH6SEgXpbsFhppMpJVIWS+h495ERR1t+JDqb6AbJiigu3G3d4lz8vvG907meLKsKn7isk4qw+C
 beC1zWgz
X-Proofpoint-GUID: wWTs7GbhOqGi7opYscPZ-SfQWobPcA1E
X-Proofpoint-ORIG-GUID: wWTs7GbhOqGi7opYscPZ-SfQWobPcA1E

On 8/29/25 14:46, Kris Van Hees wrote:

> Because alloca pointers are stored internally as ofssets into the

s/ofssets/offsets/

For the test, how about converting the trace() to printf("%x")? Makes 
the script a little simpler and the hex output might feel more intuitive 
to a human reader if/when it ever comes to that.

Most of all, the test fails wherever I tried it.  I think the problem is 
that the BPF verifier doesn't like adding a map_value pointer and an 
unbounded value... even if we do not dereference the result!  So, in 
this patch, drop the DT_NF_REF checks, instead calling 
dt_cg_alloca_access_check() everytime.

I wrote a longer explanation of this.  Here it is, in case it's helpful.

The BPF verifier complains something like this:

     [...]
     r8 = *(u64 *)(r10 -8) R8_w=fp-88          r8 = dctx
     r8 = *(u64 *)(r8 +72) R8_w=map_value(...) r8 = dctx->gvar
     r8 = *(u64 *)(r8 + 0) R8_w=inv(id=0)      r8 = arr
     r7 = *(u64 *)(r10 -8) R7_w=fp-88          r7 = dctx
     r7 = *(u64 *)(r7 +40) R7_w=map_value(...) r7 = dctx->scratchmem
     r8 += r7              math between map_value pointer and register 
with unbounded min value is not allowed

So what has happened is that we assign r8=arr (first gvar), whose value 
is small since it's an alloca().  Then, we go to the new dt_cg.c code:

     if ((dnp->dn_flags & DT_NF_REF) || (arg & DT_NF_REF))
         dt_cg_alloca_access_check(dlp, drp, dnp->dn_reg, DT_ISIMM, size);
     dt_cg_alloca_ptr(dlp, drp, dnp->dn_reg, dnp->dn_reg);

We do NOT call the dt_cg_alloca_access_check(), but drop directly into 
dt_cg_alloca_ptr().  It allocates %r7 and does something like this:

     dt_cg_access_dctx(%r7, dlp, drp, DCTX_SCRATCHMEM);
     emit(dlp,  BPF_ALU64_REG(BPF_ADD, %r8, %r7));

Anyhow, that last add is forbidden, because %r7 is dctx->scratchmem and 
%r8 is unbounded.

I guess the problem is that the dt_cg_alloca_access_check() is not being 
called, and the BPF verifier doesn't like that, even though we are not 
dereferencing the pointer.

Maybe drop the &DT_NF_REF conditions in the new code introduced by the 
patch?

> scratchmem area, they were printed as small integers.  They are
> now printed as actual pointer values into kernel space.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_cg.c                          | 19 +++++++++--------
>   test/unittest/actions/trace/tst.alloca.d   | 24 ++++++++++++++++++++++
>   test/unittest/actions/trace/tst.alloca.r   |  1 +
>   test/unittest/actions/trace/tst.alloca.r.p | 11 ++++++++++
>   4 files changed, 46 insertions(+), 9 deletions(-)
>   create mode 100644 test/unittest/actions/trace/tst.alloca.d
>   create mode 100644 test/unittest/actions/trace/tst.alloca.r
>   create mode 100755 test/unittest/actions/trace/tst.alloca.r.p
>
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index cd9e7f4e9..7af3dd44b 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1687,16 +1687,17 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>   		align = vtype.dtdt_align;
>   
>   		/*
> -		 * A DEREF of a REF node does not get resolved in dt_cg_node()
> -		 * because the ref node already holds the pointer.  But for
> -		 * alloca pointers, that will be the offset into scratchmem so
> -		 * we still need to turn it into a real pointer here.
> +		 * Alloca pointers are stored as an offset into scratchmem, so
> +		 * they need to be converted into real pointers before we go on.
> +		 * If the alloca pointer is a REF or ref-by-value is requested,
> +		 * we need to do bounds checking before turning the alloca
> +		 * pointer into a real pointer.
>   		 */
> -		if (dnp->dn_kind == DT_NODE_OP1 &&
> -		    dnp->dn_op == DT_TOK_DEREF && (dnp->dn_flags & DT_NF_REF) &&
> -		    (dnp->dn_child->dn_flags & DT_NF_ALLOCA)) {
> -			dt_cg_alloca_access_check(dlp, drp, dnp->dn_reg,
> -						  DT_ISIMM, size);
> +		if (dnp->dn_flags & DT_NF_ALLOCA) {
> +			if ((dnp->dn_flags & DT_NF_REF) || (arg & DT_NF_REF))
> +				dt_cg_alloca_access_check(dlp, drp, dnp->dn_reg,
> +							  DT_ISIMM, size);
> +
>   			dt_cg_alloca_ptr(dlp, drp, dnp->dn_reg, dnp->dn_reg);
>   			not_null = 1;
>   		}
> diff --git a/test/unittest/actions/trace/tst.alloca.d b/test/unittest/actions/trace/tst.alloca.d
> new file mode 100644
> index 000000000..d2ff5152d
> --- /dev/null
> +++ b/test/unittest/actions/trace/tst.alloca.d
> @@ -0,0 +1,24 @@
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	arr = (int *)alloca(5 * sizeof(int));
> +	idx = 4;
> +	arr[0] = 1;
> +	arr[1] = 22;
> +	arr[2] = 333;
> +	arr[3] = 4444;
> +	arr[4] = 55555;
> +	trace(arr);
> +	trace(" ");
> +	trace(*arr);
> +	trace(" ");
> +	trace(arr + 2);
> +	trace(" ");
> +	trace(*(arr + 2));
> +	trace(" ");
> +	trace(arr + idx);
> +	trace(" ");
> +	trace(*(arr + idx));
> +	exit(0);
> +}
> diff --git a/test/unittest/actions/trace/tst.alloca.r b/test/unittest/actions/trace/tst.alloca.r
> new file mode 100644
> index 000000000..e9bbf2f5d
> --- /dev/null
> +++ b/test/unittest/actions/trace/tst.alloca.r
> @@ -0,0 +1 @@
> +OK 1 OK 333 OK 55555
> diff --git a/test/unittest/actions/trace/tst.alloca.r.p b/test/unittest/actions/trace/tst.alloca.r.p
> new file mode 100755
> index 000000000..8515861ad
> --- /dev/null
> +++ b/test/unittest/actions/trace/tst.alloca.r.p
> @@ -0,0 +1,11 @@
> +#!/usr/bin/gawk -f
> +
> +{
> +	$1 = $1 > 0x7fffffff ? "OK" : "BAD";
> +	$3 = $3 > 0x7fffffff ? "OK" : "BAD";
> +	$5 = $5 > 0x7fffffff ? "OK" : "BAD";
> +}
> +
> +{
> +	print;
> +}
