Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F782C11CA
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 22:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766095807; cv=fail; b=rK29zhO+iLZsuCfeZAgq+CWzRhIULxe+gQmIlXmZH2tUDBfzEG4ZFWaUWfCBiVgLPPub4gvH1IveClKlRDU2SBHt7sAeAF4E61mo/h1135cjV6WjhhpdmJZ4fBZQvULVTqGK/rWqzuh/Y5f+gEW9hkkTXEKfvJB/agBPVHgNapc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766095807; c=relaxed/simple;
	bh=nq8EmYjUk5i2elsR7BIlgNtlHalHJYrV8qQLR5TTdHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XWBEz8zy41GSGSzlfj3VFqbxNFtc5Lo0eD/YuWsCgNIMVvOO2S+xY5ewFe2q87ExzG7RKwXP4KAZyK68jxlzo5DBgvU2rwTo7klS2zgfY+SjSsKS2gvJBKQBNWLHXhh6Z8y3MNMsUJIcAkZDuVG4n55tlFZDusRI4Gux19HaYiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XXbF54gW; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vKzhh2vM reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XXbF54gW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vKzhh2vM"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIJkFpY2012335
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 22:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=RtCV4s3cEv6lMcJc/SVk3AxRH5YggubIQUHcK9sdFKk=; b=
	XXbF54gWKuCOEq/STK30qTZ9OXGMqXAl8tGXE6Z/lHJTO0UdLdRl7641jFuCI9hc
	oF3eeGwxUmN+ropWH8t30wNRo+sx1N6lk09O9RRuhh1tTXTmNiewufWksKUMugjZ
	+nFzBDn+3L933xy5pxLuQ8+fohVtVe8NWo6A72pdJbcu0fnFzY7cfkgxC3Ue68fA
	TJr6dSeLZpDl2Xrrc8vuqQ3DD4ZYcOCEdfw3KVdJisOjfbKdd6dWqAp5ask1HeZJ
	bEmVOXQiPC0RETv5oZMZf8yXQQ9sQjVVcqwfaqtuOZbwUkubHhEt5pDULC+JQpNi
	Y8jZCLGc6f6s8K/ElmMG0g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r2bg6ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 22:10:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BILZN40023552
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 22:10:04 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012018.outbound.protection.outlook.com [40.93.195.18])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qta5af1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 22:10:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvGV/ZvxKIsRqlDCVU4/jNenzKy9LkOghJV+5UW+0UPcn+f0dT6ZLVRzWbGEZWs8JQh5VjE53UfQR71Mx6H7y85VQyTrNw/otjcHUyB+Sw6CwfCPXG76KYBPIAqMYwul/qQSoFMcQs4SPRZbMy7ywl2RN9SwfOKDMzeikozo7FEEjQkEC29dtNsf6WNQRi6VO3tSQrdgOXRrkOV8sgxz+Bt87DX4326BOfXt3JgVMQNra3zDk7w7jN2k6TFf5biusN+snEfLVBWKKvfFQzL3LRDG+N2WzNuXVXolqpQIvBxaJFVCR+WiePpMkO5mMEdXNEmtGh4TYkM581aHz2I2Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEe/HpDvxfe4aieD0t3N1Q6+rOIO7S50lDPq9pDLG9Y=;
 b=vVWHDJCr0BYvGoMwZ2vtuTM3prH+YVxeeQf6kk4NVpLBK7rgJA3nIHdZ0w9pcM3Pdaavi2Q0hhHsSkEdA/vrAuOf8ymErjq7q8Z7gXr9QctCiW4MqpFlt19PuyEimx4CsGSk/FQVz4pAyjDkcU0eeTtVZf9Fh0eEnN2SXs3bYN02A/IMEaM4fH09j+s2X2/3tzx1LmFVZuySpZsHVyk2id/iQ+ZEdiYZwklwhH3xDeofxOZyUVsP5kumFLrstW4rskee5m/jvHQOuAwkPT+MuolzOu9miQm0FZDT8KvumDI+3XPsLR1kjM+rCqauiWoMBWK7AkTidgk/iQi3Khkx+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEe/HpDvxfe4aieD0t3N1Q6+rOIO7S50lDPq9pDLG9Y=;
 b=vKzhh2vMUK+ocNukfh5v/NOMKRrr/m7Hr75+58nRXCcKb9iS9KeNFY0jnMgkjOpaA1StWtby3XkX84UbLyrIsaSBPOf9UXRVszy8i6KK9cm5axo6LA8b249UXyUiKbt59LXItY3UUIhIIgX+z3BQlWJdnA9RWOYZoHbKerTaPh4=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DS7PR10MB7228.namprd10.prod.outlook.com (2603:10b6:8:e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 22:10:01 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 22:10:01 +0000
Date: Thu, 18 Dec 2025 17:09:59 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/4] test: correct file permissions
Message-ID: <aUR7t14bRn8MnGVH@oracle.com>
References: <DS0PR10MB752274F3007546F6860EC932C2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <afcf46e3-ed97-8bd3-7bb1-8268df5660cf@oracle.com>
 <aURhb26qwDFCqmKk@oracle.com>
 <a824d48f-d280-3376-94e0-998373a63855@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a824d48f-d280-3376-94e0-998373a63855@oracle.com>
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DS7PR10MB7228:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dee8adc-ffc3-4940-1fed-08de3e823066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?aC1sIIDkxVemLFq2glxbLVlIHY8s4nDvTHHVkpzSdggvMTRzqMNPGIhobd?=
 =?iso-8859-1?Q?z7PfugWQwqHMTSKznbOAar7BEzZEAjetGpWXUy5KHRX3NhBeI0CkBGExZh?=
 =?iso-8859-1?Q?sc/W8iRD9gDW5cUtcvfvVldokC0XqFmQtQucK6zULkuOeZeYoMiLycnFI8?=
 =?iso-8859-1?Q?ocKVKc1sMYztyxN+jA3W/QtP2Uaen1xZjeGERc9cuZcdzit5s/ssRdLK3Y?=
 =?iso-8859-1?Q?ewTBHJI/Chf/lkgqhmnnD9iXNQDFhU0AuApPpHGlXmA2XU3lraXPJYNsoV?=
 =?iso-8859-1?Q?JCv/5bBDNz/ghGNZSM+DkBmk5GFwKSmDzPky9WoHrVMvYp2ZVQBonW0zgA?=
 =?iso-8859-1?Q?U1CUeSumQV0/M57zlvRma5iSTJFMuYAlDPZ07STI0mijyoZGKZbl7M+M7M?=
 =?iso-8859-1?Q?aDezgOjZh8ST17bq/XJrlwvXmuDcYPOS+JONC6sO8FT9FPMr482fndELXF?=
 =?iso-8859-1?Q?FuB0ul9S7S2l03tuaErKvviqQlPLFLIjv/nreEbeHHhQfANde/UKcvq3dS?=
 =?iso-8859-1?Q?nu302K5nQP3PFcnwoIXZ0kumRrr+J1NMrMNIaSgWuVxSZpCEcgJhcDhFNH?=
 =?iso-8859-1?Q?BmugyoLDGsKdB4C/HYkzyl4ExjEjDCedKdSLi3npjE+AZ4yvzdonv7MocV?=
 =?iso-8859-1?Q?IVmpvRI3m95DSUysi9+0EhUw9cnLZuxoouXMuhV3Efr6UpSzZpJOyP3e1g?=
 =?iso-8859-1?Q?vI9rJauzHhNdKSakbgmAz8iGP6QqNz8em8MBT4qePJjmKDdWPClZSgZf9d?=
 =?iso-8859-1?Q?ZvQIRB7wOWOV/vpJVbSc/lJcVAW/CQW5N1ysgmT9V8Hoi41KqIktRdJ9PH?=
 =?iso-8859-1?Q?SZa8rQPQnEaPxxHKbpVVvFN2nUSIPZgEPqib5vAdFRsrW95u+VwUWJOfFd?=
 =?iso-8859-1?Q?d3nVzbEh/oZW2wlDwV9kNBQqJcRBfcWQ7bDGwQZAcs9FiwVNFhCOBaQsvr?=
 =?iso-8859-1?Q?G4KZpikfpfXyeFTT8ShMiKe9+cDQl9lEySZPyW5yKu+gQlJqC9TbK3lBoV?=
 =?iso-8859-1?Q?p5ZEWl8Gho0om1LftQWELvLaz0pdSzP+iCZRXtss/BVsOAFTw4TwTlfi3T?=
 =?iso-8859-1?Q?1ySwZnofx6Lbf7YV58MUGGTvfCT91jRQAzRAAO82Q+eLja6Gmi3HmQTRBv?=
 =?iso-8859-1?Q?HyIhxlgGyHbUbt2j6VA8j1uh/vnBn7VXgTEJTxe5UvMqRyMmt8dZ3ar4XT?=
 =?iso-8859-1?Q?nERMFLxziwpYcFm4MFYfbo9FY4Rc2ASJJM9j8R6iPlT1+3WX24ZBfemyDB?=
 =?iso-8859-1?Q?2dOLp//+6v+T8VBMr8U+Z58qtzZrmivVcBNpa2MVyrveQVmVIeTKXLZz34?=
 =?iso-8859-1?Q?6YQgLssTvGxN1YG+nNnVWpYeX89aLSB4IM25vDKQz1XNECBy9qc3887I8s?=
 =?iso-8859-1?Q?JUVxoCioT9koYeOnPbHyJGZsDHSFyzt+ZakUD0tJlojQle/BwyjYNKqP3q?=
 =?iso-8859-1?Q?hky6tIXS32ysd5AkDj4++3evXJp1g/lkrBwGkkXqoYIP9ZuHriuLOLNyVV?=
 =?iso-8859-1?Q?SgAayudWF2xjVq8g7HfuKj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?0Flcr1vBrAIrAsVDzPFtbgW9Xi9GlzI5t+c4fvaEZ2r9pIKa9gPWKXaPNJ?=
 =?iso-8859-1?Q?e1kRi0fGSEg+z8TCXrzysH5oAfEwvFIAwTzRF0pFeooYO8JNkEKWVKrc3i?=
 =?iso-8859-1?Q?iG6i5Aw0pKq5fhFoiae/sGXAWwq7rekn6TDoU7MK7T2nUPV6pOO5ngvADu?=
 =?iso-8859-1?Q?Scpo297S+lccrhdyrG7xwSbljuXhUge7BsOiE2bn9b6h9H/Y8LZgVk02nq?=
 =?iso-8859-1?Q?gy/Bate15UQPWPlvSR4ktgoY1Bs6ReThUBMko8XdrVG3sOBloYbQYYcwz2?=
 =?iso-8859-1?Q?792qP/mmhgw1PW43/UguV/TemS/PK3lalXoKZic2Tklf3EkZQMcIzMdRyl?=
 =?iso-8859-1?Q?8GWJKJ2KqTeSw0i5+aOHg+UUlRSs6cGtlz/2h8NNXb6OBuX4ZnvKZNlKkp?=
 =?iso-8859-1?Q?gQC9vAX0hehc4DjnLJ5cWFdoaq9kqZwDXaL6avBFjmDqr2j8+kousQSL/R?=
 =?iso-8859-1?Q?4ioHJDLT11oKlFDFm5jWcXp6KgaJT41ZqPSDtBIH8o9lcQgA+wOVDuhx2T?=
 =?iso-8859-1?Q?nfyGmag2/BdM/r4ZfoAWM5ywBmrtQpfttpDqnLJxf5zHX8kMVN7OrU/vZ6?=
 =?iso-8859-1?Q?Rph0DFwGPgJfkKCCD0LDo9osCBFO5p5njUhEhqqU8Z4UU+dKWYK2sJgIZi?=
 =?iso-8859-1?Q?vxuRMtyjqO82H0Z6rhmpjZdzpse7VYMSqNudAFe2PLaGyHfV6y6J6b0jMo?=
 =?iso-8859-1?Q?d06ClQ5x6FMdG/5j+Bb7FGZDi0D89P1zqZINsqNVHm660NLtzzqbCmEjp4?=
 =?iso-8859-1?Q?fA05mk7nOKuoyIxPTN0FUqJkx17wd7Yqx5uv7GkEWL3xU2lgZA1rDcKkpl?=
 =?iso-8859-1?Q?NuZj4rBXHp9duVW7naABHPkceGo0ueSbBBhCUfHelir0kWU68Pxmj28jEn?=
 =?iso-8859-1?Q?eJiz/GnO6Ncc9AU2edL58JiPuJBuDNjmSIjMlHSxuKY9Rtj+VIgTv2MN0R?=
 =?iso-8859-1?Q?PnKf2psIcZzumWofeb7P3db43ARZTkQtvyRVYU68ULrPOnCPkZ6Fv6N77v?=
 =?iso-8859-1?Q?TaVdPTGBBU9un0miI9MoXliEyvKoo79p3OIzBVWeK9VixZ2h16tQl1Ez1t?=
 =?iso-8859-1?Q?OtgXblRDRWSGNLUyTII+Z5qwI7kdzJuVZp3cC+4jtWFngcdwoR94sKAU0w?=
 =?iso-8859-1?Q?bGx0lpf9kCkfGfyv28VnmfIY18ONKuY4RURcth/U2Qbyb0Mn02nrnMJhA7?=
 =?iso-8859-1?Q?Abjfh4n4Qn/tOod5R6nKEdrE0lkY0jY85R2kQgZcGtUOkB53JEgZNTVO7V?=
 =?iso-8859-1?Q?1sb6iduZ6DcVryh6YvbveIzWglwtc7rwbE5kwVCG8Y3+vBU/anSq2sHzqm?=
 =?iso-8859-1?Q?fCztZDUc77+cokS2UQM10Nv7GSqZPxnijPvLmF2E7gFGTAH2tTGhTBdWUi?=
 =?iso-8859-1?Q?+ELhVCQw72pjczg6Ow0Uvv0d3tYqD3U1EwgAA961a65Fr21INy3a1HL/dj?=
 =?iso-8859-1?Q?8SQmRjORiXWCNStCg9Efb9AH1c6hxbLGE+frinmfwrqjzy3MYLnF6PRJou?=
 =?iso-8859-1?Q?WAGoHxn+ODqEnPbbs06q4its9S9oacLmA7OKlPe3stf6ky5yxe3JdO0pjN?=
 =?iso-8859-1?Q?O2aOMWumhhVyjTqO9a8FnERZ0lgQhm58xVjjbFBYOaSPed0e/GPuaW0AQO?=
 =?iso-8859-1?Q?1+37ypaXrsEX8/05uovfOzK0bHRiUqXN8upDEthaNgViB3udejNqIvRQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/rkfisds6ZLLOW6+7BfyBO1NpbPyV8Ad52SuHObAjy3BYhRF4Ww1LNIce5SGBcy9i2IzPLleNRnYOkoM0xpKYp7Gez5rLQKkWRvf2nM3hGibHCbDLNV4L+X9STignRQ+9qNpGpc9WBYeaeGnUeYLqpIAIBa4wDn1rJDne4Pk1Z7BTChADeyEY6GiYYlr8lbG63NGOAmyWbgKK25DxA4qut4GIkatdJc/PK92U3WGPFtqN/R6UZZlyWp7t8Gy3Gy3gXME86Pu9ddCCHCFSCp3GF92MjDkwkbqvb5y7NPtmJor4LdjY3XYtqU2obP1oV9lyCVN0gccedcVQFiNTR8pFwuefXJq9y2Wuk75HvLz7TrJTshMvy6AOrNRBsuIEWynaRqNt2gjCMOIl47G4U8AlB322jx+eiCruEc8Yp+BXH3haBIdb+bVI6r8fLu/8BiJ+AAJOV4y1zSrYYfpqKNU9WMz3TFaEx3+A9wQ+aU3iBmNRNeUtABksPmFY3GcnWUrA31O217TyGgfRhL1g30Np/aV/CmJ97YTQSRXxT/cuW3AzlMbzumxgzR5U5lr6xcFophdXCwTW3RJojOVG2K6ewbAfXfh8mxUCaNya+Tz8TQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dee8adc-ffc3-4940-1fed-08de3e823066
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 22:10:01.3293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ww70yHGqokped2hNbqBuVU1CC4DbnuTWgy86wYC756yArIe/ogkZTvkWQUeMJv27iqlJ2Pi8kVlpAOXQVeDYo99BTB/5kmOvkHP0x9cxc2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7228
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512180184
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE4NCBTYWx0ZWRfX6NvHmy0oBu5l
 v2DGXdsdBbJTgvdjPfoX+fCU1zGp9EtGvrzRphz3P3v2wIoILW9Q/nzZwJ0KWGPJibNU3IBvzY1
 na4XKFP9tnJKdknpJqCyY0CrSOu7G0iOA1OxrpI69gOXeJgxSJ1U6/OmZmmFsMKXiEnHUz4Ur+k
 1HhNDT4RjL3R0xcqcUbAixi3oTewYKNIsuEEL2LeWrHcX4FJvCFfyYt3TnWhIduZKJhXj9nIbfp
 DBRuA/M/nzQTMsLEcHbEJnvR7DlSo7HmatsrX4Xn+Cy67zQsIZWehUzMislbL7aprloqVN+3On7
 FjCxb/sqvbrtDcQEpx7m3enAnbXiKG68W5XvhKuV7YgfK8IwkTVDZF5P48WysTz3a6sxIqZSiwl
 P70NDE3A1RSBQnG17Qdws22UqqbL/Y2r7RTd5Wgvb4dydzQbntrBQab2oqKRZWj+/ueBxNoYFzN
 XIMkTkU/APVxndiiswg==
X-Proofpoint-ORIG-GUID: hVv8euwAMgn79BbkYgwK25dDGiJgWz0J
X-Proofpoint-GUID: hVv8euwAMgn79BbkYgwK25dDGiJgWz0J
X-Authority-Analysis: v=2.4 cv=ObyVzxTY c=1 sm=1 tr=0 ts=69447bbd cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=Qf4DKiye2P5DK4kcomQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10

On Thu, Dec 18, 2025 at 04:54:15PM -0500, Eugene Loh wrote:
> On 12/18/25 15:17, Kris Van Hees wrote:
> 
> > On Thu, Dec 18, 2025 at 03:07:29PM -0500, Eugene Loh wrote:
> > > I'd like some context here.  Why are these permissions being changed?  E.g.,
> > > 
> > > * There are some *.d files that start with "#!" but they're invoked as D
> > > scripts, not interpreter files.  So, they don't need +x.
> > Well, yes, they do not need +x but then they ALSO do not need the shebang.
> > (See below)
> 
> Sure.
> 
> > > * There are some *.r files given +x.  Why?  They aren't being executed, are
> > > they?
> > Some tests (I believe some you wrote, actually) generate a shell script, with
> > shebang, and expect it to be compared to a .r file.  I presume that the intent
> > is that such files are expected to be executed, and therefore they should bear
> > the x permission.  If they are not expected to be executed, then I think it is
> > best that the test does not generate a shebang shell script at all.
> 
> I'm familiar with the practice, but I'm pretty sure I didn't write any of
> those tests.  The original intent is fine, I suppose, but I do not think
> we're executing those files anymore.  So, rewriting those tests... fine, I
> suppose, but wouldn't seem to be all that urgent.

My bad - must have been someone else (perhaps longer ago, no longer with us).
Anyway, yes, I think that this needs some attention.  If it is only 2-3 I can
add them as an exception for now, otherwise I'll fix it.

> > > * A D script is turned -x.  Okay, but not consequential?
> > I agree that some of the file permission changes may not be correct - I did
> > it semi-automatically based on shebang presence when in reality a lot of those
> > trsts probably should not have the shebang.  I can go through the list and do
> > a more thorough job at this.  I admit this was primarily to get lintian to
> > stop complaining.  It is very usrful to flag potential issues, but the fix I
> > did for various cases certainly may not be the ideal one.
> > 
> > > I'm not against the patch.  I just don't understand it.  There's more to x
> > > permissions than whether there is a leading shebang.
> > I agree - when I included this patch in the series I forgot I had not done a
> > full review of the changes to determine whether they were the best course of
> > action for each case.  As mentioned above, shebang on D scripts that are passed
> > to dtrace is pointless and should be removed.  Except perhaps for having one
> > test that ensures that shebang presence doesn't cause dtrace to choke.  That
> > can be a singular exception.
> 
> Another issue is that runtest.sh *does* run some D scripts as interpreter
> files.  The key is that the shebang line is #!dtrace... we only want
> #!/usr/sbin/dtrace for --use-installed.  Interestingly (well, this *is*
> something I think I did!), +x is not needed to instruct runtest.sh to run
> the test as an interpreter file...  we copy the file and then fix the
> shebang for the appropriate dtrace path and chmod +x at that time.  (Of
> course, there are other ways of handling this.)

Sure, but there is nothing against such files being executable and in fact it
would be good if they are because that is another easy way to know they are
meant to be executable.  The fact that runtest.sh copies them and does the
substitution is a different matter.

> lint checks are good, but it seems that maybe this patch in its present form
> is not what we're looking for???  And I'm thinking the urgency is low enough
> that it makes sense to postpone this sort of clean-up work?

The thing is that these discrepancies to what is typical are flagged as part
of the Debian packaging, and we cannot just tell the Debian people that this
is just stuff they can ignore.  Likewise, adding in a long list of override
rules for lintian or a more generic rule bypasses the checks that are meant to
actually validate that permissions etc are set correctly on files.

So, in the interest of supporting DTrace as a package to be included in Debian,
yes, this needs to be addressed.

> > > On 12/17/25 00:09, Kris Van Hees wrote:
> > > > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > > > ---
> > > >    test/demo/script/interp.d                                         | 0
> > > >    test/demo/script/tracewrite.d                                     | 0
> > > >    test/demo/spec/specopen.d                                         | 0
> > > >    test/stress/fbtsafety/tst.vahole.d                                | 0
> > > >    test/unittest/funcs/substr/tst.substr.r                           | 0
> > > >    test/unittest/funcs/tst.basename.r                                | 0
> > > >    test/unittest/funcs/tst.index.r                                   | 0
> > > >    test/unittest/lockstat/tst.lockstat-summary.d                     | 0
> > > >    test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d           | 0
> > > >    test/unittest/scripting/err.D_OP_LVAL.rdonly.d                    | 0
> > > >    test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d              | 0
> > > >    test/unittest/scripting/err.D_SYNTAX.concat.d                     | 0
> > > >    test/unittest/scripting/err.D_SYNTAX.desc.d                       | 0
> > > >    test/unittest/scripting/err.D_SYNTAX.inval.d                      | 0
> > > >    test/unittest/scripting/err.D_SYNTAX.pid.d                        | 0
> > > >    test/unittest/scripting/tst.arg0.d                                | 0
> > > >    test/unittest/scripting/tst.assign.d                              | 0
> > > >    test/unittest/scripting/tst.basic.d                               | 0
> > > >    test/unittest/scripting/tst.pgid.d                                | 0
> > > >    test/unittest/scripting/tst.pid.d                                 | 0
> > > >    test/unittest/scripting/tst.sid.d                                 | 0
> > > >    test/unittest/scripting/tst.trace.d                               | 0
> > > >    .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d | 0
> > > >    test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d     | 0
> > > >    test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d   | 0
> > > >    .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d | 0
> > > >    test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d     | 0
> > > >    test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d     | 0
> > > >    test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d      | 0
> > > >    29 files changed, 0 insertions(+), 0 deletions(-)
> > > >    mode change 100644 => 100755 test/demo/script/interp.d
> > > >    mode change 100644 => 100755 test/demo/script/tracewrite.d
> > > >    mode change 100644 => 100755 test/demo/spec/specopen.d
> > > >    mode change 100644 => 100755 test/stress/fbtsafety/tst.vahole.d
> > > >    mode change 100644 => 100755 test/unittest/funcs/substr/tst.substr.r
> > > >    mode change 100644 => 100755 test/unittest/funcs/tst.basename.r
> > > >    mode change 100644 => 100755 test/unittest/funcs/tst.index.r
> > > >    mode change 100755 => 100644 test/unittest/lockstat/tst.lockstat-summary.d
> > > >    mode change 100644 => 100755 test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> > > >    mode change 100644 => 100755 test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> > > >    mode change 100644 => 100755 test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> > > >    mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.concat.d
> > > >    mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.desc.d
> > > >    mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.inval.d
> > > >    mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.pid.d
> > > >    mode change 100644 => 100755 test/unittest/scripting/tst.arg0.d
> > > >    mode change 100644 => 100755 test/unittest/scripting/tst.assign.d
> > > >    mode change 100644 => 100755 test/unittest/scripting/tst.basic.d
> > > >    mode change 100644 => 100755 test/unittest/scripting/tst.pgid.d
> > > >    mode change 100644 => 100755 test/unittest/scripting/tst.pid.d
> > > >    mode change 100644 => 100755 test/unittest/scripting/tst.sid.d
> > > >    mode change 100644 => 100755 test/unittest/scripting/tst.trace.d
> > > >    mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> > > >    mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> > > >    mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> > > >    mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> > > >    mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> > > >    mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> > > >    mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> > > > 
> > > > diff --git a/test/demo/script/interp.d b/test/demo/script/interp.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/demo/script/tracewrite.d b/test/demo/script/tracewrite.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/demo/spec/specopen.d b/test/demo/spec/specopen.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/stress/fbtsafety/tst.vahole.d b/test/stress/fbtsafety/tst.vahole.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/funcs/substr/tst.substr.r b/test/unittest/funcs/substr/tst.substr.r
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/funcs/tst.basename.r b/test/unittest/funcs/tst.basename.r
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/funcs/tst.index.r b/test/unittest/funcs/tst.index.r
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/lockstat/tst.lockstat-summary.d b/test/unittest/lockstat/tst.lockstat-summary.d
> > > > old mode 100755
> > > > new mode 100644
> > > > diff --git a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/scripting/err.D_SYNTAX.concat.d b/test/unittest/scripting/err.D_SYNTAX.concat.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/scripting/err.D_SYNTAX.desc.d b/test/unittest/scripting/err.D_SYNTAX.desc.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/scripting/err.D_SYNTAX.inval.d b/test/unittest/scripting/err.D_SYNTAX.inval.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/scripting/err.D_SYNTAX.pid.d b/test/unittest/scripting/err.D_SYNTAX.pid.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/scripting/tst.arg0.d b/test/unittest/scripting/tst.arg0.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/scripting/tst.assign.d b/test/unittest/scripting/tst.assign.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/scripting/tst.basic.d b/test/unittest/scripting/tst.basic.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/scripting/tst.pgid.d b/test/unittest/scripting/tst.pgid.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/scripting/tst.pid.d b/test/unittest/scripting/tst.pid.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/scripting/tst.sid.d b/test/unittest/scripting/tst.sid.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/scripting/tst.trace.d b/test/unittest/scripting/tst.trace.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> > > > old mode 100644
> > > > new mode 100755
