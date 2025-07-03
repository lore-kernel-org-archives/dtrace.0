Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C827080E
	for <dtrace@lists.linux.dev>; Thu,  3 Jul 2025 16:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751561996; cv=fail; b=YJYFlhFJTrvT2zk5O22sJridzsVigYXF5OG22A/QdWmc4v7ehQEiSovX0rXC7+zVjEc89q0aKseJ9mxMV1h4iwoLa9p6r2dzDRHkcMPT85WlUkVD6NAEh9vmqM6JIIMJnHCHnvfyXRdtcZTKQDHT9EkLEE6nFgaTBQ2ctIqZGFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751561996; c=relaxed/simple;
	bh=YokBxM2B89qRkYebMd3e0kIxAObaxHIVuKEcsJMt0HY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g+HMF1lXwgKz67G05K43XLLiX1cMApKpw/y7b3PnxBgXpu6CI9GjWxmaXpIdHTs1jrigw3OPCNBRR/HEvV3GytobD6zNErjWiJlPkbOYFarJhxrmKu7tzgBQ8cxIg66qKkCS2D3kmdK9DaIFQd2TAxBvaXADhSQS+L8Ko9vsVEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=n4IGpbdP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vAGMxTqU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="n4IGpbdP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vAGMxTqU"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DZ5Ii027095
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 16:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=3eJr/2+mmxKJiclQGCpdfjccvEHdmuz10JH5AT5MfNo=; b=
	n4IGpbdP5pVwIyfVArnbsPB8FsZWoGyos4JYp46U7OcV63RnpgAwx95+rqU2c3n3
	2cT0qej+8hrVYj4GT6g3h6bRbxonU3NIJC3EQ4xylCRDL3MH5QPZw0nGTBEFS0Bj
	qpJd+DbgOfWbGerbKq4Pg3YhbsM0igNwr8cUtsaaKtSwd6dGd+8svwz6yJRjAeF+
	jfJ301XqWQKDWF5o/iyKLEOZkhpet/hj7+ZC2KlihvUGF+IslGmGQbNnc9hi5hQG
	H1iUJZaXYysQ5TMMDXuaB9QPnC31Ic92suLmCflX7UbDSdPEt+DmN/shP1hebk5v
	C5HESQTfLbR8sanY+gTL/A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8xx9dkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 16:59:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563FFcEh018709
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 16:59:53 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2041.outbound.protection.outlook.com [40.107.100.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ucv4k6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 16:59:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGcdwxP03Fz8nfuOnhW/GG4mGfHSrQI3WdjJJMIYEqlIgcyHUcQ9zhsfTKb0YOrH22yZ1J2yrwu9CEfS4qP0LWjBgY07tHvFrfXut4H3gXF7QnubjxCbPJAUBA6dG++nYvwCGO3CTsDkH5IAnsfQE4BMgfiR3WqH9OJmPjvnY3E5Q1n4i3L332JLsBOePktkxxJmkhXPM2f4QuTYmtVdK9tFJBMoezIIIsP90dkczvT5PD8rBbspiFVpjaFTf/9Vn/o7MKJ2DnlwuoLra1wSF9mTJ830F0YrM2YoY9z9pAxJDvToQdnPT29fDyPFgzl4fO5AaQ79Aadx6k6aOeYbIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eJr/2+mmxKJiclQGCpdfjccvEHdmuz10JH5AT5MfNo=;
 b=wjCz4Tza0oYthjJFCzP2KGYou7zboO0vW/YbMn1hOmWsNen/DikS8t/ysPv4txY9MzDVQqXUSCxUaDjMkJnyguPjTBTwUrUNzeZfjr/JW36roLVbu9ozelWcI7wR4oCY3UsmdlCMz/PeVPt98b5Ie70AOTOU32bsYLGergiD2V9f/nJQeD4rhflHmJjhfpFEVyrvWnSxGnZAtCFNIvTtON1Ml12oo9yhtOEmdNciKO7YonxlmCQc0t2OqUf0boBVUnpaaXzgEbhHMIoClGH7FxBrM5twi58eoCIXimkHzJO2xoaWW4/HREilwVVG2g1dEWXa8k1qotdT6szmtqGh0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eJr/2+mmxKJiclQGCpdfjccvEHdmuz10JH5AT5MfNo=;
 b=vAGMxTqU1hDLlnlTL13fYVSu1KaPOw1SXGKooSnBOZiXUr4l1VIxz2yfXObLcn0aZ3nj+4k2WJDcCgScPSakzi1OIGqFm4YZt3PMhjae7QF447B0Uw79kPvIB67ga20ML4LApW6QCpCewdD5eLxoeU4WY8EB1eiXGXkFtGhx3nM=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 CO6PR10MB5587.namprd10.prod.outlook.com (2603:10b6:303:146::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.37; Thu, 3 Jul
 2025 16:59:47 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.8880.027; Thu, 3 Jul 2025
 16:59:47 +0000
Message-ID: <08bae006-f438-4134-a811-609b3fda69d1@oracle.com>
Date: Thu, 3 Jul 2025 17:59:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
To: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250703113345.1273604-1-alan.maguire@oracle.com>
 <e660b225-4a3c-209f-fae4-8831f6c3229c@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <e660b225-4a3c-209f-fae4-8831f6c3229c@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::22) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|CO6PR10MB5587:EE_
X-MS-Office365-Filtering-Correlation-Id: 41953f82-14c0-4349-d4c1-08ddba53042a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFVoTFZGMmRjL0NuNTd0TzZGZWJlVWRHMHBDL2lVVkk4V0F0T0syY3hzVjNF?=
 =?utf-8?B?RWRIZ0wxRE54eVltZlhINlVSTTBsQllXUnZpa3ZKVSt5cTVXbmFPRmNoRVVx?=
 =?utf-8?B?aVZaaHNBdUFmY0xTTC9ySkNldk5keEIwVFZHZ0JNV0x3K1k0VzdabFNOUkI4?=
 =?utf-8?B?bUdsWXhGZ0dEdUZHV2VKM1NoRWcvSTlYdndmQ3hwalVqOE9LL1psd29wRzZ6?=
 =?utf-8?B?SEhSSngyN0o1T0pDQVJRM3E4YjA4TUJrbWZwYzlNc3EzK0dsL2gwSkZtOW5D?=
 =?utf-8?B?SWFzaEQxOGVvNm43Tm0vc2lXTVdtUTdJN1hsSkJ5alk5eklJR0hxK0ZVeWtW?=
 =?utf-8?B?M24rYk9iZHJyem82MnYzN2xrOSs4cWptL0VKdFRxQXlXWjJyTWJjYlo3cFN6?=
 =?utf-8?B?N1UrRnBYOUNjZnpZTUdCTFVqRGk2RGtNRmhsU1FUN0dSOFhTSXRReXkvaHRJ?=
 =?utf-8?B?blVJRlVrYUdxdDdxUHBodzdBRENtallwVnlndFB2ekpVVzFiNFhlVFpSUUlW?=
 =?utf-8?B?eVZWeGtpMC9YVVNMU2h0YThPV3pKYld3UElqbXVwbFdaQ0JHVHFpZi9hd2Nj?=
 =?utf-8?B?VlFVcThuNHE3Ujg1RGQzUHkzWFJ0N2p1QjlYRmZyMCtuMHJQVmpHendrUFpB?=
 =?utf-8?B?bGpFMFNqZ215OXAyWHBTbXI0aktLenJhWEFIWGFyYWJpeFhuL2NZbEprVm9B?=
 =?utf-8?B?TmpVWHlMN081cUU3YS9VaVJjSFcwK3VhOThCQzdqZ1F5RVJtTk11aEdIRHl5?=
 =?utf-8?B?LzZuOTB3NzI5Y3duMS9xYXBhUGVqKzlwczZ1cTFZa3RBODIrWi9veG1rNGJU?=
 =?utf-8?B?V1pVNGxRdjFtdHFoSTJHb0RpWDVBaXZXa3Vha1Q5QWRkZFRNSkVyb2oyQUJY?=
 =?utf-8?B?TjFEays5K0VwZ011RnFlRnpMQ2dEdWVaS1ZhbXBNbUI5b0ZHRDN5MVVoemFn?=
 =?utf-8?B?cjNnNEYyUTZZM2ZKaEF4RmJ5Vm5SbDloZHFTODRFVzBKK0dKU2d5STkydTNu?=
 =?utf-8?B?c0g2NHN0MWlGbmhxYXJ5ckVmWlBka01IalU4dVVEZ1pMejNxZmJaVS9aVjlx?=
 =?utf-8?B?SVE3VXNzVzlBOFhwQnd3YVIyY3FZcDAydERGbW5XRElodkVsNFBkT1lZOWll?=
 =?utf-8?B?WlEyakxxTXQ0Q0hQMUR5Z1IwWUt4anpNa3FscGJseVZlbGI2MnBJczhmalJW?=
 =?utf-8?B?MkdyNXR1dkNzQ056bDBQNUY1STYzS2tEdm9PWG4zbGZKNjlUWE1WTTVmWVNI?=
 =?utf-8?B?bEFwYWRIdjEvZmo0V1EwMGxMWllGQVNIeXBJS1cvYW9qbTlvRUkwaUY5TUVM?=
 =?utf-8?B?VWNaS0Z1Qjh0cEZOMy9pRDl0SWRHUkNVUHloRjlTRUxxRHp5TzRvY1gvZktL?=
 =?utf-8?B?SkpHMDdKd2oyQ0E0SGFSRzNyS3NFT253WXZYU2QzRXlYcnJuUzBvaHd6L3lO?=
 =?utf-8?B?SmdzVlVQV2JtclFjQTA5YXpxTVdFVUtaS2trRy9PVXQ5VGZzSENmcWNDYXo3?=
 =?utf-8?B?T3hUZVhuWVVoWkZlcXE5c2JGbEhvTW1ETE9kR0tpYnh2WmVmTWhsOGx1TkEr?=
 =?utf-8?B?UnByTVEwSmd5NkxMYXpjdDNybkVGYXFUVXJtZVJhYjBLcWg1OEJ2bXpzSUYy?=
 =?utf-8?B?RXVxenZXbmZIdXpac081NG5VUUVUcyswem5pblR2OEJHbEVBVnNYTmt2ZVJn?=
 =?utf-8?B?d0djYVNZOUdsMFVuQVk3N0Q1T2pnZ3BERlNXWjZOR2hpbnUzenN1Q2VJeVRh?=
 =?utf-8?B?dUtEMSttYmw3VXpEQVFqei9JTUxKWFlRcE9UNTY1YW5iVHBIVnJiOXNyN0I3?=
 =?utf-8?B?L2hxTzhKQWFnT2pUamxzaURSOVpBTjNTTzM3V1lVNk9lTHFkZkR1d1lKbXkx?=
 =?utf-8?B?Q2s3cDZteWk5dlpqc01sR2p6NldBd3h3Q1NpUXVoZnU3cDVCZXhpQXF1Wncy?=
 =?utf-8?Q?RiX7/gCixwE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVg5VTdqNkY3WU5rdytRaHA2UEl2U1FiV1Uxc09HZmgveGJIdWVBaWJ2UnIx?=
 =?utf-8?B?aWFVVjhEQWQrcGRuMlZzWENGdEc3T0l3aWNjNTBmRElSMzBWYnNGOEdrUGJw?=
 =?utf-8?B?bFBkejRDaVRkZTBxT1RrZmIwYndqNU9yQjdFTStrcDVzY05TeE54MDcwb0JB?=
 =?utf-8?B?M0VXRnA1NG5VZURkc2tlb3gwNGZEYks2SXJHNHp4Wkk4VFFDOUZVTVVwUHdX?=
 =?utf-8?B?YjFzbVdMSHhGdXoyNitzMWxqQk1HQitkMHFybU96dW8yVkVhd2V1aG5BQ01U?=
 =?utf-8?B?Wlp5SjhvaklQSFlSVkhYcmVWbHVFa01uOHh3bXBpZm5XNjVhNzEvN2ZqVElW?=
 =?utf-8?B?Z1lIczdGRURJclJLNEdxeTFCT2NyS3FrOHI1QlNpVVVTL2VjNFpyVTErUlVZ?=
 =?utf-8?B?aGRtSW5wRlNGMzJIMVBDakpHdCtMbDhoRU5KNnlubkJQYkFVd3pNRGZSaVlE?=
 =?utf-8?B?dEpvQTNtamVWc0cvU0Y3MVBBUlhkWjkvek9LVlZiVDB1VjlKbURKUkUzL2l5?=
 =?utf-8?B?K29WbzN1WkNERHYrcUtUNkMzREtTQmF4UkpkZ2JHS0RCTHBtUjBZVUwxd0J5?=
 =?utf-8?B?bjVZQzNTWGlQSlcyZ2lvUGRoRHM5WXdJNkREb3JUNmZERGxxY2tWR0hGbGZ1?=
 =?utf-8?B?c3RubHA4cDA1NWlmWXBLaHdEUjdzOVRMVjU1L0Znejh1WFljQ3BYVlMvdVJR?=
 =?utf-8?B?ajFHcHFPdWR1RnFpandyMHFpQ045WGZ0NkFrRlVsc2dLSnU4elJXRkpjZWg5?=
 =?utf-8?B?dVBWTFZCVDVwRnJZRVdXYitGYU8yckpyYWpnOVlua2wvaHFaQ3NoRlI5RDJD?=
 =?utf-8?B?WmU1TWRtMUxSREpINVpEWmJsZWlxTEdsOEZjam5TM09XbnFIVDBqUE5kYXJ6?=
 =?utf-8?B?aWRkR3JXcEtjelRITldqUDQvSTlDSFJPUGVWS280VnBYY1B4NCt2aUJCTTh4?=
 =?utf-8?B?VllqNjU3MC9BVDFkTWpURkNrNUdTVDhuTTlrVnJFUm5ZbUdNU1hCOFFkV2RR?=
 =?utf-8?B?ZEt2Uk55VmVPTEtlRjB0cUhtNVZpc2JWQzJoK01pT3pIdFpmMzdvelZSN2dJ?=
 =?utf-8?B?ZmpUNVR2UE9UVWUwUjdzSUVkM1hkcTJjVDQ1dHFabkhleXM2elIzcFNsZnJk?=
 =?utf-8?B?WVVRaWdJNENpN3VtVDUwS0wwQzFSdEc2aDQ4dENGeXo1djY1L2p3TXJXWWlE?=
 =?utf-8?B?QW9pem5KamEySjhieTJjWDlPMXB3MUplMGRMd2Z3bnpBdjFJSUUrU3VTbVNo?=
 =?utf-8?B?dHU1bXVvaTduRndNMy9zWndNd2pFYVZBYmJGRCtyUkdtSnZ5QzV6VUUzTTJE?=
 =?utf-8?B?cVF4eWpQd1VBV0c0UG1vSjFFSEgzOFRGQjhRZlZONHo3cTJ5N25JM0JzSWpw?=
 =?utf-8?B?ZDBJQTF4OTJoKzI2S2dtQ3NqM2V1dlVtY1hUOThVNThhODZTRGJTZ2VMdjlq?=
 =?utf-8?B?eWlGbEVDMkUwUjBxSFg0cDRkS0xPdnI0d29rUEFXRUo2K1hSQWw2WFUxQmN6?=
 =?utf-8?B?cm4zSk80bElWTlpTS2g5NkRwcUlDTjV3UGhaRzlQT0VyeW0xY3hheFVpNjll?=
 =?utf-8?B?YTZodnI4MDloaC9XbWYzT0YvYmtMeEpXTG4yVnR6QUJlZ1hEazZxNzN2RWE3?=
 =?utf-8?B?dE03N0kyT0VoSHZpY0RiSzJFd0RKbEdHUHM3QU5sakxqbzFkME9uT0tGNnlW?=
 =?utf-8?B?SXc0UDJMYWZYWThuL0VUZmVRR0hmS0YyUWNQUHdISzQrR0c0VHloTGhpVkNs?=
 =?utf-8?B?SzRIbHVSQnMyemR3T05Xc1cwVzlIOWFhSUtSR1lTR3E1ZlQ0bTRjaGNxd3F0?=
 =?utf-8?B?M1NtQUx6UWFxOTd1aDI2c0pLS1JybDdmVVNkSWhmdldacm9Cdlc1REtwb2dR?=
 =?utf-8?B?WFM3MHFZemQ0RDc2ZU00YkR5R3Q2STY3ZHJZNVlhWUo2TTUyNzlGcGtkMHFn?=
 =?utf-8?B?S1hldzRNTkR5ZG85aWFnc2FMSkNCN1BjWSt6Z3M2OXNKQXJhMndmbXgzaGRP?=
 =?utf-8?B?TUVkRTVVWURJajRFVWl5MklaY0RNUnVMLzlmdWNBOUJVMEx3MkNTdkJxcm00?=
 =?utf-8?B?V08xSE1BNTVIek9TOW9VdjZlbGlnUFhMczhCRHRTT3ZXVTg3ZmFGakZkV0ZF?=
 =?utf-8?B?VUd3UGRMRmxsR0htK2prMjlCNVpjTFNvYXlpeU41aURiUkkxSE5wdlh2MGRh?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0TOUXLMETROyoEpLHqI4kYY8dCaeoWa5ubENpNOWhr5M9+1wObOuxCpJeotJKGX+7rUEDle9MdCzTz1JI5LD4s/4onyoGFzX/l37eWMeWLkTtLIQvm+2r+StcWTuSJUCSTrJoKEpsBbnwO60J+U1ypWTy0Td2xLOD23Sc8M9eNnfqawQIk6jBH+kXj+lDtbDXLSKBRNVSEpP+dh7qQVWAyr0091wwXZEb6a0MYBdRXEhLCiwCx+HCN/CLZ3r4Ob86Bap+LsCxY72rFMEQOvCULyTgiCdUFFEzzc26AccQ1FsTnKsLvMDkUqjmosB6ImJmbo5LAtkvRjMV+9Ge6JFLNeQ+LNfu3jVQN/XFVIUBCOXuPp+N15ENTwOaGYFOXtE+5PVc1PS0mItqvr83JKZvArJ4ac8xlcpw/WzeZFUIepdCimCnnNCn8Kr5NnQqyqJIycS3m1JRBUhk1kUo4kPsA2uVDxzjNWKZ+NkgaGLOANw9s1eJks2C0SuhIfycvBhtdqshSslO0Xt0CJ68lsBVgz4zFq2Ubp1i9skDJj0OkHcui2oaIraUE5L5tUu4SM8Uv40fcB6foiykWTGrYsqoZa1STmJA5x2gsDsuqSqzrg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41953f82-14c0-4349-d4c1-08ddba53042a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 16:59:47.3631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZIfnoiDYAC5CUhFRtC3/Xrvh4t8eTLmPju67j3qEg/Rb7J+vOfn97gGwmxu603KDTvI9fq5SK1bATEjWsUEiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5587
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507030141
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE0MCBTYWx0ZWRfXwvGSg59tT/q5 cKjLzpMre0TFeKfru2WpPKEBzMbZuR+o2pUieLkeJxap1i5TvVan/Ya3/SahHnYyf5qYMZ7B2qY BUDmzTHi+tU6dlzsFhSpS1hZerz7jJkGahqtjzFOiWFfjLEQY/DPNW1v5ktMcajpswL1TH2qRnX
 8bnv0r58VPYMSK6OKzyJqTKOboSeP7p94NhFHMEavnnEede2TPO9SVnvLXJTumRNPYQ13pzponI VvRxRFqOLTvDo10y1DuXOluw4jzXKXaC6QCYvc55LxHOd49D/71oXFTTPoEat4Bg5a5vwrsWRr9 AR7Rui7k+8Kh94JSSMLJEcZmpd6MjRbPa+jWFHkZinaYWwsjZ1o7JjNhfCEUwYEOCKrsDmikQlj
 fyo3PbA+01oMnNd+N6qRPP6uzQ58RoMaHmprfA2JAVQ5Az4MbUrnzzBAHpe3SivUKlOkD+Hk
X-Proofpoint-ORIG-GUID: 8IJBNNe4ed7QjBdFod1mK_dNJuLD4i9q
X-Proofpoint-GUID: 8IJBNNe4ed7QjBdFod1mK_dNJuLD4i9q
X-Authority-Analysis: v=2.4 cv=QfRmvtbv c=1 sm=1 tr=0 ts=6866b709 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=_l4eVU8AIqhPPLu7Jz4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

On 03/07/2025 17:43, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
>

Thanks for the review!

> I confess I don't understand all the details, but it seems like a nice
> improvement.  Thanks.
> 

Creating a network namespace essentially gives you an independent TCP/IP
stack on the system; you then connect to it from the main (global
network namespace) via a veth pair; one lives on the network namespace
side in that TCP/IP stack and the other lives on the local system
(global namespace) side; kind of like using a back-to-back cable between
two ethernet cards on different systems, but virtually. The upshot is
that the networking stack sends to the namespaced interface just like it
does for "real" network traffic; that is the benefit it gives us.

> I tested and it looks good (modulo the OL8 UEK6 issue mentioned in the
> patch 3/4 feedback).
> 

Sorry I couldn't find that issue; is this the 5.15 problem with the ip
send probes?

> I think you need to update Copyright years in the modified files. And...
> 

Will do, thanks!

> On 7/3/25 07:33, Alan Maguire via DTrace-devel wrote:
> 
>> The current approach of looking for remote addresses
>> is brittle and fails in many environments; it checks the
>> default route gateway and looks for open ports in the TCP
>> case.
>>
>> We can however achieve the same goal reliably by creating
>> a network namespace on the system and configuring either
>> IPv4 or IPv6 addresses on the namespaced and local veth
>> interfaces that support communication between namespaces.
>> If a tcp port is required start sshd to listen on that port.
> 
> Maybe a comma after "required"?
>

yep, will fix.

>> Teardown is managed in runtest.sh as signal handling for
>> timeouts within the test scripts is not working; a trap
>> function does not trigger for TERM.
> 
> I'm having trouble parsing the text before the semicolon.  I think I
> understand it, but cannot seem to figure out the grammar.

I'll try and rephrase; basically I tried adding a

trap cleanup TERM

to the test script to catch a SIGTERM when the test timed out;
unfortunately this didn't trigger when tests timed out so we were left
with network namespaces hanging around.

How about

Teardown of network namespaces is managed in the toplevel runtest.sh to
ensure that network namespaces are removed after test completion for all
cases; success, failure and timeout.
