Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDAD29CE5
	for <dtrace@lists.linux.dev>; Sat, 26 Oct 2024 01:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729905233; cv=fail; b=O530RTTz/hKhdxlt0tvIUCfH/WrL+fB0xV1E3SvFE/w+R3lBcQfGB3mTpwxdWiakuwGCXGJCAp1UiuMp2+eTzVzQXM8vCdNKilfTPYh7Q6pNF6E3Ny8Q4YWCOvrBbcdPyTqemeVJbDHGVI/UVBVGvB3QTfNHq8l3USEf5ufnj6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729905233; c=relaxed/simple;
	bh=M6fazzih5ygq/jWPVRdPFwKTX/Gl19CJj0DA0+9dG10=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VGdfC6kWX7lF04jRJEUrGB9EDOyxti8NqLPW2zbRgD7Ot0V4GDh/ANSVZIgN2PY/bFvic2cDHJn//qErHzn4T5jBY36JIC/Mxi5cnPClJaY8meAPwdPyc5Vh9AY5PXkzmIEi+UjRMk0x6ggNhFwfMxDodZgNHv1xDsxsXBFdvDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RI+/5I39; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=R/ObEvLm; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RI+/5I39";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="R/ObEvLm"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PJdccV020859
	for <dtrace@lists.linux.dev>; Sat, 26 Oct 2024 01:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=x66hhE4/e9pshoZc023jjldhSYztuXQCsvu1zRoEgiE=; b=
	RI+/5I39X4tzKMXEJa0lUH+HI+i5IcghGW/w0wxt4ozVudPDfEcbEQPy740LKkaq
	ZVbMJmx2CflOWzn5OFWRIYEl6qXEmod1enxsFcN/tlGuz6IEpmD82KxMX08HnPCh
	AbRwljyVunFrHjAF9SGJlx0XXQnb/aaCf9LLvYTnixWIAdPjmx/H1FAaHJUNvOWo
	HbVO27dwoFLKY0ku29fGNQxeNGnNOaTH/2oCrQMhKQUnQIJOHMHcZG0idEVN50Gp
	yJzSgD0yk7H7oZIcIWvrZC51vOLMebFLIviRDyhct5bLTFnIwCIsSfvFq2owuK/6
	wP0elrXUGtm4YvVZv3JTyQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42ckkr5bt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 26 Oct 2024 01:13:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49PMC8sL036700
	for <dtrace@lists.linux.dev>; Sat, 26 Oct 2024 01:13:48 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh5ydm8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 26 Oct 2024 01:13:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tS1WU9s8o6SECLqw6leziHR/mf5q0f9bLUQggIYLn08qy9F3FwszIix2kGxfwAB4/jue+5+J+IaWfIABze3T1rj/Xzbe7Z853Njdv740PSKp6ExY8joRU8KJOkOPh1nC93Klu25PiEHB38tOOY9oftqArz1YBKZwz5CH3jPGxuucRsmuIj6HK8rSwlAwaqYcJpXigBg/K76EINteBC9a9pvnU78SrIrpu1Oa9N+Jm92MnTIgFUJpY9l8kp+CKjhvylGYXtkGeIB9O+ZBbIdTXYxK2/EsvP9u9t4WhYWFLlqBB2vmC/sEu1BkCMSc/W+zmUzaDC6o7XhBZ00E5pARxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x66hhE4/e9pshoZc023jjldhSYztuXQCsvu1zRoEgiE=;
 b=W8T7eVVAFEhyCjA8o7CYHXML6EkMEaBShaQTWvOHmxGkMTkUpSqXFE4VNPIOqa25bVuEcab9HNrkrMO1nWBb+BiBJ4RadM06qaUkHd0z3ZXYvUM+szMwriLO4yVauKFvt+wxI6eVt3mveIUdAvce6bcFrYnzn2juT5x/OmGyaJIvmAAuZBsALR1vqJ4IbzkwvRRaKXSB/tPAqaHsoubeMzmXDEJIczmYbT089XHbfFOpYnvVPPSFltIKGUQ2OO+cNyV8LnnIXlwALT4YXbLAo6JULLeToUbBv4KqvH61iJfE/C62LqCYfl3yiqpaau/vRzMkhiswROlyRCokRFfWAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x66hhE4/e9pshoZc023jjldhSYztuXQCsvu1zRoEgiE=;
 b=R/ObEvLmTUr6dCNFU/PwbJfkyxs0KZ/XX3Lw5YqJz5yvjdDpW2SWFP/nZ/L/V6BMA6dKb3LTJnkxzXB8HDAuIYIGW+DIELvFnRwORXWOITY0gUe4wx9qpcBq1WTwPMfoim0EtcPrzZJIpleTy1itLe5qswA0BLmvsttPEWQtcBA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM6PR10MB4330.namprd10.prod.outlook.com (2603:10b6:5:21f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Sat, 26 Oct
 2024 01:13:45 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8093.021; Sat, 26 Oct 2024
 01:13:45 +0000
Message-ID: <64077e98-d0f2-7a0a-2417-76aa7fb5d997@oracle.com>
Date: Fri, 25 Oct 2024 21:13:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 10/19] Remove the is-enabled provider
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240829052558.3525-1-eugene.loh@oracle.com>
 <20240829052558.3525-10-eugene.loh@oracle.com>
 <ZxplP0zFxvZlzVNg@kvh-deb-bpf.us.oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZxplP0zFxvZlzVNg@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0054.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::29) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM6PR10MB4330:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cc96202-27f2-4327-d954-08dcf55b703b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXlodW55c2lsajZWMmozcTNlMVRXempYTWh0S1NFNUhkOTZ4U1JvVEV3UWRF?=
 =?utf-8?B?R09TMURoNDVRVVBuek1zL01hNmhmaWRwOW5kVHlVYXVNSmszcUdsWUNlS0dm?=
 =?utf-8?B?ZVpyS0VmeG5vNmZvLzFZWUI5b2ZOTjFqcUtORUFocDQxNHpXRkpyU2J5MGlY?=
 =?utf-8?B?clhWN2dsckRpVnBHTVcwZWM3WGVnTDNSNFlYZVdCcnRFdEpPNmVNVmhlWEs5?=
 =?utf-8?B?YnJ6S1E4cE5RTW0vbmRDQnNJaHBFaC9aa085c0tmVGZyMTB2MmRxVWVNeTJy?=
 =?utf-8?B?eVRpNTVmaHJrWHM2Mi9XQ0NiSktwcWxJU3ZjSVhnZjF1Z0UyQ0pDdExwUVVl?=
 =?utf-8?B?eEQxek94Tzh2bEpyLzF6dW9YbHFYUzU3Qi85MEU0N2kvZkZPT21sdWo3ZnZ6?=
 =?utf-8?B?c1FEU21pWE5JVnNFUmp4bEg2dUZ1cFhkUjVFNjBCMEdibmJRRHFuM244Q245?=
 =?utf-8?B?cTNXWjlkRXVQUElhSEJkSkNENXl3eVZkQTZQRkhEY01HOW9rZnFUb2RQOVBL?=
 =?utf-8?B?TDRZYW85azlXOG1kMm5HUGg2K3hXbkVyeVlsckNVSnc2ZEc0RHZWMHRuUmNj?=
 =?utf-8?B?bTdodER0SjRCdUdlbkJ5NS9NNmJzeDRTbU11cUdUSjBhams5WXUwNnBHcHg0?=
 =?utf-8?B?TUxjbCtERDhyVHJFZFdybm9jeGdzSDU5WVNUeTk3dmN2NkZLZG5PVW84d1My?=
 =?utf-8?B?QjgxaEFNQktYVjZCMm5CYitOcm5QaWpjZEZvMDVMVjdQdFN6bzBmZ3lKL1ZZ?=
 =?utf-8?B?eWFMTlR2bTNBcU5UdXh6MVVzN255cjFQQjJTWUNIaWtxaVdHY05hTkJLdks3?=
 =?utf-8?B?V053cGdWc3JUbjM1QlFzaU1JcTFrUEdQanZITGhEOXl0R014MHZ2eG44WTB2?=
 =?utf-8?B?SmZRWCtQazVNUmo4dmpqMVlLQzUxZjhTR3g0VVBzdUJGZHZBYytoWHllUUl3?=
 =?utf-8?B?MUFVZkJqVmZoNThhU3JvSG1mV1VvWkRkTUZ6MFVEaDhISEQwSGozVDNRUDNB?=
 =?utf-8?B?eDluQ0c3WkQxUmNoZkxGVHN0SDh5ODNIWkhrRVc3U0dyaHFIb05OMnNFeHlF?=
 =?utf-8?B?dDFINVM1RFBQdlB2OWhMZ0NrWlc2aW02eDNNTXpZZnYrYk8walhCUlVNL2xZ?=
 =?utf-8?B?WXJYM3EwbHVuTldGbEtDbGpxZElobk1sYkUxc0JvNWwzVVR0blUyd21JQUhK?=
 =?utf-8?B?UEFadDdhMmo5VHJIaG1UTzY1UFVJS0xwTnhKV1VoZUpVY3g3V2plbm83US9h?=
 =?utf-8?B?UldJT290TmdWajZSeUx2bU9nUXRhYzJXNzV1NVZVQXZPelRZdlkxU1V6cXpM?=
 =?utf-8?B?TEx1L3Z1QThzOSt5QU5SYlVaWkRYYkpwS2F3L1pFZXBDcFlTc3ZaQWx4MFBK?=
 =?utf-8?B?cWdJbitYSVRnNG85L2RILytVY3pTYTZZUmp4N256R2lycWdJR29GOXR2TE9t?=
 =?utf-8?B?VkZjV3pUMCt1Tmx2VnI3U2NMZW14alVHUkl5bTA2NVkyWi9ycmVmUUFXWmJD?=
 =?utf-8?B?aWpHRWdHS214U2w5dlNwdEwxWmJveVM3YjFUdXgyTVZ3c0xRMkM2NW5mTTlH?=
 =?utf-8?B?MnhHTmpQK09HMG95STRXVUlyZFZPK1JJcXUzTTYzemJkd1dZK3V0a2xsYVJG?=
 =?utf-8?B?c1FHUlFOSWJoWmxlSnA0akxtalJEMGN4UW1NQlQ4OEVBQStzSnczTXl4RTAv?=
 =?utf-8?B?U0g3WC8xenZNQ3hSb0lOK015Y1NyRm9tRWpjNHlDWXByTFJjMEpWZVArSlNi?=
 =?utf-8?Q?m49Fm/i7mT+lxpUQGIhkBXTLxiWiuk485Cjp5Fa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tm9rUXdEUnpqbllTdnE2V2RTdElLTThlWWpHYjVzS1UxK1VtRmpJZHVxK3Ux?=
 =?utf-8?B?WEluOU5aZFhYTlRqRHV2U2lDQ042d2l2aDNTelZNNUxjbWwrYXJBeTdReHFq?=
 =?utf-8?B?SW95UVVYZ2FFWklXZ0tqWnk0ZjBQUnZ1eGJVTXd0Q294V1MrRmVSekszc1ZD?=
 =?utf-8?B?MEtxTkk1Uy9RbnZ0ZWdLYjB4ZlFOeituZkUzamV6RGJPM25JS0s0QmtFVjZy?=
 =?utf-8?B?ZmpiaU1YNzhXUm1qSkxBQU44MlZnYWJqNW10TlBiNUkrak1LWUt3eEZWaW1t?=
 =?utf-8?B?Rm83VlVqSEhmS01QelZadnNvaThCRXZCZzFsT3NlaTg3UkFsVFArQ1ZJbmhS?=
 =?utf-8?B?c2laMERYUGlSU25FMDFlbnl4UVErNzlnVTA5N3hPaGJVdnI2b0RGM1ZFdzlZ?=
 =?utf-8?B?TW1jZVF5bnF0VkY1YmVLekNaL2grZTFUOWU4RitrRjZFNmJ2cGhNdzk0dTNp?=
 =?utf-8?B?SHdrdUswVStyQmpORC9aZDVicFFYVXBlOFFCOUhmRDBKMjFtck1Qb3pQN2VG?=
 =?utf-8?B?amllR3FpUlFmY0xjTndRZEw0VzhSeWNkM1JRT3JORlR0b0dSV1FoQ25XY2dG?=
 =?utf-8?B?enF2WDlmUnBPWW1vYUxNZnBENy82eGZQYXZrYy9sdjdnRlk0VnlSRWI3QlRa?=
 =?utf-8?B?TFQyUE5qOG5uamQwSGRpck1KVG5qTUc5NXBvM0FEZFdTeWtzMWQvNHhlRC9p?=
 =?utf-8?B?Uy9GeGYvQTJEZmxVZmF5NEFwcDN0M3JLaEFQKzdkOU5mQk9SdXZXRndYanMv?=
 =?utf-8?B?SjZXUzZPUnN5UmZWeEk1V3IyS1RjSndXaUFCQ2prVUVPK1BJRnFhb0cvb25h?=
 =?utf-8?B?cXc1ek9jNWJIQ3hXYWFsc2hLamtvUmpmbXVsL0NBcFEwUDB2U2FXVHJTaGM5?=
 =?utf-8?B?Mzh1b0xXTVhKaGh3aDNvOERwQS9jRSswRjZnSUFINUdzdFdhcW83WEo1d1c0?=
 =?utf-8?B?NlhvWk8yTEFTdkxsM0w3MjN1bGVtR1lKR2tKSG5VVHVtWkVqNGdkL2JyOVB4?=
 =?utf-8?B?TU1rQkowTlA5UjN3TGU5UXErc0hVNVBuZk1wWTNPR3g0UU1Sd3pXUDNxMHRw?=
 =?utf-8?B?ajdsOG9ybk5keEFyc2gzOThrdWN3Q3plT25oR0lnZU4wNVI3RHorOXVDOFBu?=
 =?utf-8?B?bFp2cmo1RXRxTVRFY0oyL1ppUnRORVgzVmt3eTdQL3lHNEhUMjdyUWVuN1FJ?=
 =?utf-8?B?L0s1YTJnS00xdVBJT2xMMWFlL1BLVjdkODRIV3JkSStWNjBsem9sL2MxcThT?=
 =?utf-8?B?c1ZGSDMvWHVYdzFUU3krMHVMUVdOaEU5OGxCeU5ab1N3ODlRK01aOEFTMkc3?=
 =?utf-8?B?SStJbUtacStEZUw1Y05HMmd6VUZHYmcwamNBL21tRkY0UlpsaWFPMG4zVUtm?=
 =?utf-8?B?dmpVTlU5LzcxMDAwMElvMjVhOE1KQjhWRmZjeTh1L3BTMXZmVnJESXdWS0Rt?=
 =?utf-8?B?ZUtHbXBOOE0xOTlxRUxtWGI2ZVEzSUU1aTg4MnFBMlg0NFlkUVJqdTlsVHV3?=
 =?utf-8?B?d0dwSGdSUVpuZ3kwcTlqcWFpMnE1dkovU2pBekZ5ck9ibVR4R2R0RXdPUEJD?=
 =?utf-8?B?S0tDdFpsQzFBZ3BteWlHWENvTEtPM0ZNYUh1N0RCQm1oOFhVbytVbDZva2o5?=
 =?utf-8?B?anMySm5xaUpJTkFTK3RHb2JDK0poUFg0ZUcwcTZ1Q05QZCs3YUk5U2dqRGpX?=
 =?utf-8?B?V0tJOUo2NkJWakxBMy9vY0FtQjZra1VmWGJUY0Q3Y0JNTTNjT2ZQbXhlTGdv?=
 =?utf-8?B?ekwxSjBlV2hpVTNtcEVkZDEzWS9Uejl4Q0NxUTBrenNnU2tTbWxicm9paHlU?=
 =?utf-8?B?YkFkakpEVlVvZHhFQm1RVTJyVzlEaHJVdHBUZmVnc0JXZUZSdVJnQ1lkSHFT?=
 =?utf-8?B?NkhhLzN1elc2b2ZOU3E2SCtyR1JKd0ZJMlFUK1hFOXVQNCtGTS9NalpPZkZL?=
 =?utf-8?B?UEs2MGVlMzhwMExUamRGTGR1TDNrRmgzWHQ4RXNPUE40cytYcEVHZGJydS96?=
 =?utf-8?B?ODVsVUUyaXEvaGg1RUJSclc0Nk1HSENoTWN1WGYrRmhwVFVHUlFSUngwWXd3?=
 =?utf-8?B?SUhta3UzSFphWE5zRjRnZFUwNHoxbVpiZnlsY085VC82dzVpeXM1T2xDNVpC?=
 =?utf-8?Q?tDgpT5jgDMt85Bogn7lqvqdgR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y2+UGRz2OHMtmck1V1YGNxkK3G4v/LgpZUI/8iAZoXhEe7jHQ2+fEMc2CsZEvSr7uxSmMBW3mKLBWcKhaz1fS0Ga2x8z3TnwNT1yT9AMUtxYLB+y29MF2nxhPIy5ZHHvvUeMoS72lp7GYZZjMx1ahJg5Y35xgvrtEF7SVtOuBOB+9Zkgc/6srY0wE+HL4hOwHobQaOoL3QG1WGh2BcCflsq8niLiKh5CXisNGHkk3yCPAPOQTBU7s8kW9lLoEZELrJ2zRXUlZ+g7lnR+qTvOhSVxNMqvlTCZrqLevKbd2pJHG5GAc6VU0uhC4TVp3nJYgU3/ZBT3qC27RoKzxtw6OBPUz75HrKj9dx1Aut8BpSThPfRCk8daOdeiB0sTYeZvoZr+C39XaKDGCBHjJ38W6X231s5li6ECvx3fh/UtmAZY4uiZtUmkIIUrMU18shDBdiqLLuWTjg3C1QogOeUvIVSNHK9TA+X99tLgIeqsnJ18bKjkn6iXPLDfFGLNbYhAG6ddtzPpt1C/vE6DkwvzcK9+z+8xmnCLSTlUIEUsPOC45/TWM+3QSxKA2kKY1Q2glekKhvWUp3vphEcHZ5GgbIoQHsXy473jMEIDtxrEtDk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc96202-27f2-4327-d954-08dcf55b703b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2024 01:13:45.5637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+vJM9vu3m2eWK/1fA65IyKlj4qmKQGHGwV6InOUS/OhIOM5PnnK7WP8bG9GBp9II1HOauLn8syeLN8Vie0Cow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4330
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_14,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410260009
X-Proofpoint-GUID: Hyy2rNndCWxzZ4-j11re2BkTM4-I3kPz
X-Proofpoint-ORIG-GUID: Hyy2rNndCWxzZ4-j11re2BkTM4-I3kPz

On 10/24/24 11:18, Kris Van Hees wrote:

> On Thu, Aug 29, 2024 at 01:25:49AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> The trampoline for the is-enabled provider is unnecessarily complicated.
>> We do not need dt_cg_tramp_copy_regs() since the copied values will not
>> be used.  Nor do we need the (second) copy of regs[arg0] to mst->arg[0].
>> We can inline copyout_val().
>>
>> Actually, we can simply consolidate the USDT and is-enabled providers.
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Something occured to me...  Should the is-enabled probe also be PID-based?

Yes.

> Presumably, it is OK if we allow the guarded code to execute even if the
> particular USDT pribe is not enabled for the PID

Or not.

> but it *could* lead to
> inconsistent excution because if the associated USDT probe is not enabled,
> is-enabled for thta USDT probe in that PID *should* not execute.

Right.  And I know of no rule that says that is-enabled can guard only D 
probes.

> Right?  So there should be a check to see if PID is in the usdt_prids BPF map,
> and only execute the writing of the 1 into *arg0 if the PID was found for the
> correct (prid, PID) key?

All USDT probes check pid,uprid.

But don't take my word for it.  I'm posting a v2 with a test for this stuff.
