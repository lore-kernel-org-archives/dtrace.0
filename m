Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE4A18784A
	for <dtrace@lists.linux.dev>; Mon,  9 Sep 2024 18:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725907244; cv=fail; b=OkiEdk5fmhn/39ClN3yPyzOPTKTji/B4QExcUmnhnCmCM0cHTihKiwRLHNdf1Dh8nqr/Xu6JzYGlG/qVlAa5/bBGgeSjBAh6qNH+rmpnQN/2nPceNeVxx30ow0dv1SrCYUUoG0+RyCc+yZWsLvx04Q2YxyHcAGAes8ibnU6hBKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725907244; c=relaxed/simple;
	bh=fomvLWazBnTDrxWoCnPlZ1Y8JjTpypB0zKUkKEdBTxQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ufz2nAdRvFadhCaS+kllVUn1BsiHNV3Yjb02Fe1+z+amOiZ03t/f8D5OFKOyEi6CS2SyAPOl/UEhM0CF/HwUByZDlyx7zbsT6z5TAV2BCkazUXtIodHQYw8BiLt0UocvxxIyOt2lwMTcGAAgNabxAfnIhjQ78M/dSId/jscG2lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=W1resZgB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rfSZ+8RJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="W1resZgB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rfSZ+8RJ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 489HBTgd012807
	for <dtrace@lists.linux.dev>; Mon, 9 Sep 2024 18:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=mi+2rn+1pA2YTbdtlhUw/T/C8/OF6SiErgnn3p4UK8E=; b=
	W1resZgBTwfkdUZpip1oDwbX5yDm+k5KMfQcxUd/8lfh+CrAViY9+0V0k55bbXaz
	3LvxJit4SGhUCS8yu5ODb2qd8tXCC7pnnqW7LUNbZBZFbHX9uCKr7wrUbislm71Y
	AvICfGrq/jwBTvFoQ9XDhJ8/ZHaH36bIEh0iKNvY/LDflySe56ufu+DgX6Yjx4/U
	k3haKxZdiWfkbm0bij4qh5cgaOPxNlYlHUYTgrCL7qjPDEk8+MuWh7UTCZT6cRFr
	J31f3HPV0/KOOKLJhEIieSarwiG5EkRHqExL2VR98uN1n4vcA+2kwG7xQJsURLdw
	b77I4wkXm02r/zGaqVfwoQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gevckt0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Sep 2024 18:40:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 489HQscD040804
	for <dtrace@lists.linux.dev>; Mon, 9 Sep 2024 18:40:40 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd98xvsq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Sep 2024 18:40:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KE3IhVpI0kgYvq6geTwLLepkS6cqh/ABPqPGEYLQj2YNrLcJZQDiHoecMJXW8o9BD16EoSTsJjO841L52ps5WUQZaPkbSUU7GcrQfCRUAE6h5TkL67kH8rZByXUt+ysYuuY3BELjfs2g+HutMrxQSVVaGExT2DVA/T1dKae0PEgJay6TtG2O1NE4ccrgmqOC9SD4OxAc28ev+m9sdQui5CLE3tOOlJ9Z7jWTPiRnwn0ODK0U5E8hXUfSs6X+ohkPwp2Rf4DsYpoj2hRUHEb27u9pAQt8+Tns+dXoknCJ9Mway1fDVBWXCmFNNi3InnJD/5K5kf9608/zGyUO7R9KXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mi+2rn+1pA2YTbdtlhUw/T/C8/OF6SiErgnn3p4UK8E=;
 b=piocuyR+aXw68SuagwD9h64Z3hPqAfawled/SQIuKNVydLGGrwf2auG6ZgzeKfIUrFjtxFVBH+AkY4+UoF1P8Pm/b3GfLiIAl2tHGGAJGqhTzJddJwNZGTxkz2ZvfzTXdr6HsF6Rpkm1XixjHLEriPH3FZZUZsM8zh64YVXcP04ocHUKmCdszXHRAmVk4YgoD+Enk6tGnMbZorB5an8jiMf5wMTWbgZ2Ptjw+Y9NG4zuPOHQEg5OFdBy2lERKoSNdbwoCd4/WyYm7TDIRfvWNkGcr7HB22rQxNudA8qugiHPa5+2R/PUJKr0plo2fzrEd312L8E0Vu3FIDUuK4fAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mi+2rn+1pA2YTbdtlhUw/T/C8/OF6SiErgnn3p4UK8E=;
 b=rfSZ+8RJrt5NDqPBsRHrKhIRx6Ty7KmP9O1VnRdlw7BBs4eCOZboALxWbjAq5VUDX00lWPd4a5ekFWdEUu4OhL96v+apDAjzBVe3MShH1eLy8FMLr6YV8rE+3k2T5M6AsmuZmkMVfrvmi2CuFkA8kfCCwLww7+j7UADBzxEfGRo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW4PR10MB5812.namprd10.prod.outlook.com (2603:10b6:303:18e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.10; Mon, 9 Sep
 2024 18:40:38 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7939.010; Mon, 9 Sep 2024
 18:40:38 +0000
Message-ID: <ec91cc0a-eb07-d6c4-0ee7-bf74f1cd4b62@oracle.com>
Date: Mon, 9 Sep 2024 14:40:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 03/19] Deprecate enabled probe ID (epid)
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240903051643.17203-1-eugene.loh@oracle.com>
 <Ztp3paXrmBIuigSb@oracle.com>
 <536b6eb4-cde5-709d-d93f-1a442a0aa9d1@oracle.com>
 <Zt8w9uRKDrZVG1Ik@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zt8w9uRKDrZVG1Ik@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0166.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW4PR10MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: 4205000a-8d18-40e2-fff9-08dcd0fee601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0l6OGY0aGZrK3liWE43ZktWYll4UHhnaERhMStQKy9ZckpZOWNGeWpybXhq?=
 =?utf-8?B?eWc4WWgzKzQ5VUpyK0hrZitYYVdINk1lN09rSkxQaDBZc2tmWTUzUlhpNS8y?=
 =?utf-8?B?Rlc5clNQeTUvajZoVlN2bXlZUFlxTXIreFZtNFp0c1lxV2VZdGI0QXNSZlVm?=
 =?utf-8?B?UEY2UlF3QTZ0Y3UyeTRYVytPTHphNVBoVitYRTdUT0NETy9zVHdHZVBLNlYv?=
 =?utf-8?B?VDIyZG5RdDR6MXRYWWV2OUpZUTVzN2dmU2ExcUJuc1NpaVFHZnhGZEJzSmVR?=
 =?utf-8?B?M0w0V0l4M3BvT2NFNzQrMHZmYzZGL0M2aUt0VFpqdHB0VXpoV2pHeFBmclBQ?=
 =?utf-8?B?eFkxWmxCR096NHBYUHoybDJxVXVkemV0b3lRTnY3V0o1L2RNZDhqbEhOTHMr?=
 =?utf-8?B?QjJUa0hmbXFMSjkvZ3pNbFVaeFhLaWZrVWtjbHpiemtwTVdPd2I2eWNoVCtX?=
 =?utf-8?B?bXJPdGhaekd5TTBQY0cza0hkdnBKTjRISDkvSTNiTExrei8zYUVVZUNnTjVX?=
 =?utf-8?B?bkxYQjNRMlluT1FCYkR0T2JHN0J1ckx5NGE4MlFQUk0xejJqeFlKcTNyQ3NH?=
 =?utf-8?B?QzZZV0ZmOUFaVHZkdGJURXdGS0ljRzNObS94elpEcTRpYTFCaEZ2cUNURjhu?=
 =?utf-8?B?aTlDcnhTZVVWWThNdU90a3Bqc3U4YWZlbTBnSGhpUDBuRWkybTE4dEZEM1JT?=
 =?utf-8?B?TVhhR2g1Si84ZTViQ1M5TTJZcFExTWNiSjlRakZyc2lEalZrOVhyanBNdi9T?=
 =?utf-8?B?dW51RW1qUnpWelo0TUJtaVd6N0hteXdCQTBBWm91T1M4ZmQ0QTd0aFRwUm5F?=
 =?utf-8?B?WTd3ZmZLKzZXUUY0azNuM0hlN2RtMTA2YS9kUjB0dkJKL0ZKd05SdjcxTDI3?=
 =?utf-8?B?RXdsLzNZNEN2R1JSaHplV3NxRDlNTHRjeFdhMDFLQVRSL3dDbndXa25PVU16?=
 =?utf-8?B?NG50RUlueWJLY2o3Um5iSVdpdGFodkZkVlUyUVhLN2N1Slp4TENPNVJHemly?=
 =?utf-8?B?YzIxSGRPT1R2d0s4cEI3dnVGMVd6QXVJVkNrZVBRZDRBa2phV2hHYU5mQWRv?=
 =?utf-8?B?KzdHc2loVkFvVkxvRDBKc2l1OUcvbkFIaW5iZVBlRlZzcWpJa1g4QzAvU1pl?=
 =?utf-8?B?TjI5Yk5pSGVYSjdzZHdzcVZ5c1NZSmkyc3JtK2VzbzR5NjlWcHRETE9DSnBI?=
 =?utf-8?B?UE1UeXdSZHpGczlYVTE0UHNRU0tOTkhybVk0ejZhdEw1TWlrTkJIcStxb3JI?=
 =?utf-8?B?MXpXWk50N1dlTVpmZi9kcnhCREphVmUzLzhhL05UeUJ6VElpN25xNndzUUl6?=
 =?utf-8?B?NzR5cFpnRUU3MUhBN0N0QjIzSXZwOXFXUDE1eHBYcWlHbXJEblBKc0V1VkYx?=
 =?utf-8?B?OTVSRWtGQ25adG1wdmxNQXFLZkY2NGRDNUlXcVhkNTE4QjNJLzVBWXRBSERr?=
 =?utf-8?B?M254Mm5xRkh4bVN2KzA2MVErSkZ6eTJsc2FleVBtcXFTNlFtUWxIejNoUStt?=
 =?utf-8?B?bnRRNkZSb05iUkoyWVcxT3luL1ltL0M2MXkyQmhOaXVzbXh1TFhGMFFMbzFE?=
 =?utf-8?B?a3VBaWRRaUpyMkFHUFcwajlpZEc4MlFVUEo4RFNsZGVuaU5SRWNwQU56Vmp0?=
 =?utf-8?B?T1ZMUS9xUzY3TERNcGFmNmp0YkI2MkxTQkNUYjBGWThubERCWDM4NFg4TDBO?=
 =?utf-8?B?WUthZWxoYm1JaTJocWVjM2VINTdhWDFLeFJlMW9FTFVBUDdmUG9SeFRnK1pZ?=
 =?utf-8?B?ME5xQmxJZm9FaE05YzdLbVBFSXFoWWZ4cVY5QncybXFpRkU4YU41VFFFWGZB?=
 =?utf-8?B?YnlNZnJUTEVoeUJ4eVBnUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cm5xUmZQNzYvbjJzNmk3MUNNSGxVdm9mSFYxTUhwVEdURE9lMDN2bzBHT3Ns?=
 =?utf-8?B?bnFzcENoZlBlNXVrSnZhalErRkxBU21rZGFpejhVcWRzRjdPbC8vS09hK1JT?=
 =?utf-8?B?ZndNaXE2aGVUa2RoeXZ5TDFKdmZNMkVYZDUzRTFicVkxbjd6ZjQ4NVdWNk05?=
 =?utf-8?B?RHdVL3lCM0hGR2JKUnhWdjYzVllKR3RwcC9uT1JHbVpsaHNJVitYeEF3bmpw?=
 =?utf-8?B?RWY4NUMrZWo3QkV4VVI5VnhNTnVON1Axa3IyWHIyY1pyYXdia09WVjhxcGR0?=
 =?utf-8?B?aVZNRlpNTyt0eDhGRHdCUlhPWk05cThNaWZHZHJtUjA1VytWQWFoZS9ubnBn?=
 =?utf-8?B?QnVkYnB5R29CZHBaemRqNitRUU02UkIxN2NHVFZ6ckhxOUlGZFFRTktVbHpZ?=
 =?utf-8?B?eHZNVDluZE1MaTRoV2RiYThpT2xXRFd1Q2pLY2pyYjlPZ3pFQWxHZDJmY3Fj?=
 =?utf-8?B?ditnQU5lTTY2UHJqKzJkakdKdzltVlY3eWdycXhVMFNmRDl5M0drdGhZdS9M?=
 =?utf-8?B?TEV5MHVIRzNUZU9LY3Z1bFNQTzh3eEx3WkF2NTl5RXdIOWVzMFdDVFg0SXNC?=
 =?utf-8?B?TDRjdVI1R2hSV3BpTExRUGdmYjdyRU9XeGhPMW84Mmhvc1Vaak9tNVNHWXlU?=
 =?utf-8?B?VEQxanplbjFyWGFWTmw1ZXRxQ3grVmRpcGpLWXdISkRwcEozbUo1dlRZTmRP?=
 =?utf-8?B?SGd2Z2pFaVFsSnZTK3U4YnZLSFc4bEIrQVJOTkdEY0RZS3VXT3pCcUowV1pK?=
 =?utf-8?B?WjM0T0wyYXoyeVRjNzdTR0JuakFaKy9jTnI4NDNXVzJpZHlGQ00zclNVOUZY?=
 =?utf-8?B?WTJHQSs5T1BKMFBPUW56UnhWbUtsak4zaFhmZTJpbkNZbXhXdktYZWE2OGMw?=
 =?utf-8?B?NzJBUUdNVWxYbFRLZE8wcHhHeWl6MVViSkhUTW1HU3NXejl0amxrb2M0UHpR?=
 =?utf-8?B?QlI2UFNzcFFCMlpYN3d4NjEyRlFMT0FMSnFtcXR4bHFsSGFKVnJyM2ZSOHhB?=
 =?utf-8?B?cGJna2lqQXdPQXozakh0UzVFY3U1czJoQnRYT25qTWZCd0NBemZBakJxNmsx?=
 =?utf-8?B?U08rNTB4RDMwdUo5bHRqK2kxUkpaRFhvMlh6TFg2S05FMlRnMXpPdndGUVVh?=
 =?utf-8?B?R3lCVU9NcWxBeCtMdmFERTBFYmxmNHlzc1RIYnoxbGk4bXJNeFVQemZZYlBz?=
 =?utf-8?B?R3NkZ0JIaVU5eGFCSmRoU0o5VXloUldIUXdpNUk2dWNjbWJESUdNY2RFMktJ?=
 =?utf-8?B?WlQ4RFdROE4rNS9YUmFLY1N6SE9DOHZpZXRuQ0NmZVJUejZTSW5YMlpyWndq?=
 =?utf-8?B?UnZ6aENpcGQ3UFFHaDVSSzFrUzR1YStMZUp0TmZWd21lNU9kWVpYSjZYNFhn?=
 =?utf-8?B?Sk5iRnZWNHpMNUxyMUVBZlBKZlNQdXQ1OFNuN1NhamhPVXFITmF6dnVFWHFy?=
 =?utf-8?B?ZGkrQzJuSzdyb1ZVUjh3a2hhRXR6L01mNzY2Mkw0U1MvTkNwb25mTUtUTEYz?=
 =?utf-8?B?U25pRS8zNmZvWDJsUThQV05CYUhzYzZKVithTkl6NzBMb3N0QXVaVmNFcFNP?=
 =?utf-8?B?eGFBUFNDa2M1MDhOSjJTQ29BMEg5c2R3S09Rd3F4NzU3YXVSZW1vSnNNWFBu?=
 =?utf-8?B?WlV5UkVzcmFxdU5jRFppbUl0dDZiVnpubGxBZ0xmRVNPRCtMMnRKTllPOGlp?=
 =?utf-8?B?M215dUUrN2dqQzFLVzVCRjY0a0M2VlRMOW1kS3NybzdacnJJdzhkejFoYkI0?=
 =?utf-8?B?eGhJOXBtMkVqbktQc2YycnJyc0JNemZHM3BWNlZ1clhrNmpxdm9uSmJQUldO?=
 =?utf-8?B?ZXFjcWgxN3Z6aEpPVjFtVHBHSE01SjB0emdzTnE5ZEpqRDkwYlJjVHZoWm05?=
 =?utf-8?B?a3gxRi90azNiYTBqNU9ZMVcwYVRMU3E5bWQzeHFQYjJPMWl3a1hJNjV3cjdi?=
 =?utf-8?B?Sk1uendPNXc5cG5TMElreFlVNEs2dFBaWk9OMzlJYnkrWkNjQWhTQnBQRkJE?=
 =?utf-8?B?Mk0zVm1jN3lqY3JJVWdnS3AxRXp0Y2VTb2M5RHp4Q25LdHk0UDhyWnJSaXlR?=
 =?utf-8?B?REIzYWt4RUpHWEFnb29PWEVNc0NTTXhIejU5M3BiQ2ZPTTZWcElJWW1xQVcv?=
 =?utf-8?Q?ocwazbwmZypUAUY8OqdhczNp5?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7bAAQ9HJ5CEyatwLnK+jqbw/5aw4GGSGnO1vGKD3Fl6vWZ7d+NjkUNtxdr++Gn4rXpytlbqKLXTtmNLEUHeNbLJROvq33yNzIyKkKru6zRX9iKp9Cz6vvnerQ1GikZPyLsg31N0R5WFBYpZTqa4QoYl5vaW/xeAqcE3CFc0cW7EWvRaiSnWHr3jS79G3mDrJSwlgkZs1ZpnYHLS+PixHh/Fs5N2NRKNUKeXlpcnEdyU0aebwKIcsJ4unxSjenTsyWbn6i8A6v4eQBLlyrejrBEP9H68psHbxNIGm3Il9MHNYQDCeCpkf4Y7GMbWcCA66rWgz7Te5OPuSj+o6/VAE4a735g0ZNlq83YIeII6SUj9Zh6ZxJSp/JVahiiGFQMQfR5jKdxhU1fTdZUL5oNhNYxPaTbiqACc7vhPJsJDc/dJCeX1N9Zty+UeLzskCzK9jebq6dHhYDQpVJWWC31QH5N3kFX7MzwsuXU1ZvZqRUI+kkanN5mUnB5dDOHeduRNk5p4kcI1EqAjCLd9/YodTJjMXb6wHljWFCcplqRXjbGuAbt2TIJfIp20snjs1Z0m91ZX8FjDwCPSW1c93jYZFV3tJcAcTwDmervEB0UmavVk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4205000a-8d18-40e2-fff9-08dcd0fee601
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 18:40:38.0927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHOorpf+vKVEpZQZfFmeTFGEEqDC1IEuU6EiKpOLp7aQEf78mpLLG5bB7bBk9Xf7k04X0n6diUYBJ/jtOVvyYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5812
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-09_09,2024-09-09_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409090148
X-Proofpoint-ORIG-GUID: Wl06NMVA8tRTI_o66K6LyVUxx0Gjv3w-
X-Proofpoint-GUID: Wl06NMVA8tRTI_o66K6LyVUxx0Gjv3w-

On 9/9/24 13:31, Kris Van Hees wrote:

> On Sun, Sep 08, 2024 at 12:31:12PM -0400, Eugene Loh wrote:
>> On 9/5/24 23:31, Kris Van Hees wrote:
>>> On Tue, Sep 03, 2024 at 01:16:43AM -0400, eugene.loh@oracle.com wrote:
>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>> Deprecate the use of EPID:
>>>>
>>>> *)  So we rearrange as follows:
>>>>
>>>>               old                        new
>>>>
>>>>            0: pad (size)                 pad (size) <= buffer start
>>>>            4: pad (additional)           specid
>>>>            8: epid <= buffer start       prid
>>>>           12: specid                     stid
>>>>           16: data[n]                    data[n]
>>>>
>>>>       So now, we say there is no longer an 8-byte pad before the
>>>>       buffer start;  rather, the buffer starts with a 4-byte pad.
>>> I am not sure whether this layout comparison is comprehensible to anyone not
>>> familiar with this code.
>> Yeah.  Incidentally, I had moved specid so that prid/stid were in the same
>> 8-byte block so that someone could read it as a single 8-byte EPID if they
>> wanted to.  I'm assuming you see no value in that.  So I moved specid back
>> to where it used to be and I think this simplifies the description of what's
>> going on.  Anyhow, I revised this explanation.  Hopefully it's sufficient
>> now.
> I like the specid first actually :)  Since it reflects the designation of the
> data.

The most recent version of the patch has prid, stid, specid.  Is that 
fine, or do you want another version that reorders these things?  It 
seems to me that at some point we should converge on some version of 
this stuff and worry less about second-order considerations of things 
that do not impact the user.  Anyhow, I can make the change.  Just tell 
me in what order you want these things or whether the most recent 
version is fine.

>>>> diff --git a/test/unittest/actions/setopt/tst.badopt.r b/test/unittest/actions/setopt/tst.badopt.r
>>>> @@ -1,16 +1,16 @@
>>>>    -- @@stderr --
>>>> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
>>>> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
>>> Perhaps it would be more efficient to update runtest.sh to support both the
>>> old and the new error reporting output, and changing both into a single unified
>>> form that substitutes changeable elements.
>> I don't get this.  First, there is no reason to support the old output...
>> that would be a rather remarkable historical vestige to keep in the code
>> base.  Second, it seems simpler and more stringent just to compare to a
>> results file in some simple, straightforward way.  You say "perhaps" so I
>> just left it as is.
> I was more thinking about making the output we compare less dependent on how
> things are phrased so that we do not have to update .r files whenever there is
> a change in how we output the data.  Except for a test or two that verify the
> exact phrasing we expect.

Okay, but again it seems to me that there are multiple acceptable ways 
of doing these things, each way with its own pros and cons. So, do you 
want another version of this patch with the requested behavior, or can 
we move forward with the patch as it was most recently posted?  There 
are other ways in which the format of DTrace output could be converted 
to some "canonical" form before checking; do we want to embark on such a 
project now, or first get USDT functionality out the door to users?  I 
vote for worrying less about some of this "under the hood" fine tuning 
(that doesn't even have unequivocal right/wrong) and more about 
delivering features to users.

Anyhow, let me know.  I can make the requested change, but am nervous 
that we're churning on issues that do not benefit users.

>>> E.g.
>>> dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
>>>
>>> and
>>>
>>> dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
>>>
>>> could both be rewritten using pattern amtching and substitutions to be:
>>>
>>> dtrace: error for probe (dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
>>>
>>> and tests that are supposed to exercise specific aspects of the error message
>>> or that depend on specific details could test that explicitly?
