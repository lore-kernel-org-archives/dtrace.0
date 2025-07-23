Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB572E36F8
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 00:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753231667; cv=fail; b=Fpz7Tj8+cUsTvUMnQA3QzgteWu/FKXGUQtWC/ckzh8hDYZHax0Ps2WBfvoqUFskaVtgTSYTXpRFD8xyvqvpj6Kyd1syxqBr2wFGXNMAJFgYY/IOH0sFAhegL7umZFwv6bRx/ATxP/akLI9tRjdb7V4hZpszhCecC83hktSFr8Vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753231667; c=relaxed/simple;
	bh=F8f/5cjiL0F/kOUbMuzgdc8O0Q58gHy9TGo7wqMLoXA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YeFDYlG8IdMETcTRDQmMDSk0Neq3lj45vxOXJ3nDJ6BrQq32FbR6AEJ45UqJ/55ybbHPeOtdA48HrM3CcZfZBCZgIgLF5iThdDtbNFHHw1W0VTL1GNbTFVDsJo91vF26jrK6VCl6jOwUU4d3RgFrlNqQr2ykfUNbCHeDbSvnO2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fFBz55NX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i3H67mH/; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fFBz55NX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i3H67mH/"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMQo1v001854
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 00:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=tVe3S1l+TU9+RCleUG60Z1BkKDEdWFPaNFTTXxAE+kw=; b=
	fFBz55NXQQLcRYaonoZHzg+wMRoRcDch9gg+bj1JqXUH79RVHYc36UhUqJL6CoOM
	EUDsrLku//UvhpF4/bZ/6SE4DahzMBefj8zUr8KzowtcemqWyX+uCo7Es4Wmzd9U
	lVfXFTRc3Md0BmgyYrNGpSR54zNJx8ndKETiW6RZ+DP5iP+EZs1ooITmrYKSvfjN
	5JYLyrw62aW0yQQJPMOaXRMkRvWldaXsAVKxeH1B0Dlx8cQgykFM0JMtMlUZSgH2
	gkPwZ6SuTZb90U4WkCGzt00d8D7yZ6CBX5sJ93hPIhxfyjXTL0Efogf0fdOlfC+C
	J+ShpLNk30JfuAGwisa4tw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48057qxmq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 00:47:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56N00Foi005971
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 00:47:42 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t9yxa2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 00:47:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzEcpljaSlHq9WhJEbLaDL2R6XwhNP8eW3w+EYAl2R1diWHdnccGK1bljlD5IuEe2mXONdkXOqwSF4oqRv/0DMtkHdrwPJ1vF8w+ggCcZIo0ySxbqInAQMPF0+OOW8e1pRGExHpcyd8qo0s1Ix05YPuMUqxQMQ19mbXwLp8IGSH9MhYcE0fexFYtF46Wpg18KZ27usmdfrHBbtOK1cfLOFDGA00abug063IMHpiJHE2iy17RSTc8WV4RzIJgsRXbGX/OJ05ajefXDnEKvJKJx4x7PA7Gp2LoslrfO+L1ZcXV72lRWWUMVR//aDKKyN6YV5VGt5JFrvmmrCJ/5btS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVe3S1l+TU9+RCleUG60Z1BkKDEdWFPaNFTTXxAE+kw=;
 b=taw1PJ/cbOdInOA186aZrOdb1EdkDce5VeSHH94nb0OTuTzDXZ9C5kP1bPSttiQr5FvIuCmmcd6wG2Lcpy4SX9CHcxqHRPq5HLFue6LUYXMccUK1bdHlBWJXgO8mgznzrS8uAo/Qyzpc4NvzQgajchoemF1TKvt1miFxmZ64vjszGtfv+50mA87iz6hxfYQ1IoB3DsRkKWkkLiAkcG9RygypqNEQhrGQJFVCRkr+bD6gjeWWZDBE6z5nQ0TxBHdwMg7HvxYjhDm4pz0RcLVDDy1YiriLYJkPQLWc6rKpBElbP05jfBcoynyxZJRydXC2AgbCP58fFZhoS1NOkxypRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVe3S1l+TU9+RCleUG60Z1BkKDEdWFPaNFTTXxAE+kw=;
 b=i3H67mH/5VwJcENolL3mCJSnIinfxpDrDBm5siuR7DlqfnXdP+zkaGMWZW953GwXgpzVdgPdJJNKVRMi57hvgvzYeU4JlP+P34jygAFv5dhJn2iUL64ahf75QyX4fMOvDvsO7yINUJLxFFWqTuPXIR5Feq8ee29z1yJ6qiar3FQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM6PR10MB4364.namprd10.prod.outlook.com (2603:10b6:5:223::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Wed, 23 Jul
 2025 00:47:39 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 00:47:39 +0000
Message-ID: <95c36276-7cf5-68fa-6217-6ae65f9f9728@oracle.com>
Date: Tue, 22 Jul 2025 20:47:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/2] Extend the USDT bit mask to multiple words
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250625060305.15707-1-eugene.loh@oracle.com>
 <20250625060305.15707-4-eugene.loh@oracle.com> <87ms8w5rqa.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87ms8w5rqa.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR20CA0023.namprd20.prod.outlook.com
 (2603:10b6:510:23c::29) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM6PR10MB4364:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aa5bd24-c42b-4cfe-2864-08ddc9828654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmVyekhRaGp1YTNKb3k5cCtYY09nemFVZlhTWHNnQ3NCRU9XZER4MGhOL3BB?=
 =?utf-8?B?aUQ3UXZFUW8wbm1DUVI0UURSN3YyYTQyZGFqMGNRbHh5VXVhNFE2QnpjVDBM?=
 =?utf-8?B?TUxLc2xMUzFsU3FIQktoUnRCUUFhaUNWL253MlpCRm5sNFFUR2NmNVByVjVS?=
 =?utf-8?B?OE9lYXhEbE0yKzNpY0ZaT08rVnp0TTFTM1NuRWFHREc2OG1ON2oxSkYwS3lT?=
 =?utf-8?B?RGl0Z0p6VFRtaUhuR2xMKzBHZEtiMjd5RkpMM1VMYUJaMGFpNlpDQnJrMzl2?=
 =?utf-8?B?ZFNjc2diUUhOQWV4WnJTbWFNQ3Vld3YvRHVXeWhodTZWek1QNzNBZmkrZ1lI?=
 =?utf-8?B?VWVQZ010Y1VDb0RsejBtZ0t5UEJSdGU4U2Fkd3k0KzZmMlh1citaQmwwL05y?=
 =?utf-8?B?T3BtaTczcXBHSkFCcFZnalQ1eU9IODBIYlNIZ0NSVkw3KzZnVGp1TFVjMTRm?=
 =?utf-8?B?RU0rWks0TjkwdGFObVMvN1I0K2NiUytBYmc3MHlZSklVS09TMTY1UTJxUXor?=
 =?utf-8?B?amhXQnFOTUM0Yjl1NTNKUmZycmxSUHdBSnpvdFdadzdET2NCZjVtT2sxdzk3?=
 =?utf-8?B?MCtMWXdRVXZ6N1F4ckR3TW50UEhPdTdGMmUyT2RERnFaSzhvS01uZ3FnYnF5?=
 =?utf-8?B?ekpLNjlrZG1GT2g0aDFHcWdFZ1dySXd3NWJNMVJ4MVQ2aWNJaW1XbGRmbCtt?=
 =?utf-8?B?aUlwRzAvL2YyblFxZ0k1bzFaMnlUWWFLdzhnMElrRGJTR21hN3ZmMnF0NWVo?=
 =?utf-8?B?a1NZMFRuT3IzTlNaek04V2ZNaGNBd0daaGZYOXFvY3Y1NklrQlZUaGxCTTlu?=
 =?utf-8?B?YmI2b0JVTDBxN293ekF5cGhzeWNXSEZsRUtLYlQrdHhUN0NIQWdjWVVHVTRx?=
 =?utf-8?B?VVIxa3dJUVZZcjluTUJDMm5mRDFITHcwWnlGOWM2THp3WEZtV0duYm1SZzE2?=
 =?utf-8?B?RC9jNERvSE1LeHJZUk9zR2FwUEtYdHlTRWdvN2pmWXBiY3JvNmg4WmxmMFRk?=
 =?utf-8?B?K05MN2EzRHpiNFc5V0tBbjR0VGxRUlZjaWhxSy9wUWpXbW1qSDhaQ2xBRDNJ?=
 =?utf-8?B?MUIzWDFONnI0aFEvbXpnalBWY1lISmgyaGg5cEZHUVlmWDQ0WHlCWEYvaExi?=
 =?utf-8?B?VzUvQ2VsWEF1TktsUG9xd2V0RFlJY0FtcjJQVmpRa0RNY0FEZzI2enNGdkw5?=
 =?utf-8?B?MEZ4eWpEdmY0NnNQczd5Z2docEZPdXI3RjJuWUdNa1A0eGdTMkpmNm5ZSE81?=
 =?utf-8?B?QnF0elBLczFOUVRSNkxTQmNQUTREYjZtOUx3R1dBNkhyc3hiU01jZktoTjJU?=
 =?utf-8?B?Y2VlUkJuY3ZPWXdPZVFLRktML2E4Z01kM0l5eGhndElubUtVMGJoK2FVdmVm?=
 =?utf-8?B?N0pBOEttQWxCb0lOMmhiZ3M3ODV2Q2VNS0xYbHUrYUdDakFMb2ZxMkF5dVJn?=
 =?utf-8?B?TEQxWjJpaDU1emlaRGdNNDZ6LzYxWWNyRTFNMGRLMHJzdWwyZUloRkhERmhH?=
 =?utf-8?B?d1VuVDlxNVBIaGxDc3FRNHVJWFg5c29iTE9SZzdwUG9kOXdBSDlMWGFKbDVY?=
 =?utf-8?B?SU1kSmM4eEg3MGx0ck9lT3N0czFBSGQ1d1huWStFL1dpbW9pSHZ3cVhGY1ZP?=
 =?utf-8?B?Z0wrakJFVXVmcFJQY2ljcXFkRWNLREdFcVpMdXp1bVQzSU45YzZXWE9YaGN2?=
 =?utf-8?B?WW9JaTBOdjdHc0JmNG9ZSzA1azRhNmVUTmZ6eEoySUxvUTRtV2t2eDRyckVM?=
 =?utf-8?B?eDJmQTBRSnVPTUp2K2h3d0EwQUlmSVJQNDRDQU5xa3NMQ1kweUl4d0ozcklF?=
 =?utf-8?B?WTFlNjdtZjlSN0lMMWVZL0pLNTZLY2pMM3c4UitiYS81cm5iUUxTWHhvbDcx?=
 =?utf-8?B?VFY1eXVGbUlBdUhiKzNrdzdFTjFPT0JMcWdOZzRMa1JZem1iTWhpQ3MvM3gx?=
 =?utf-8?Q?8SbjfHEqJ6s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkZFdU1obVR5RGIwcktHUjZYdEJIL1grTThhNnlsYVBQYUUxdUtXdkNBWUhB?=
 =?utf-8?B?YzVwaWVhQ3h5OVVKMk1RRVoyRm5RcUxMUEdlUnM2ZGlrRTlyVVR5cWw3WkYz?=
 =?utf-8?B?Y1RaanNpcmhDWkVjOGRDcDhVRkZsZkFRYk1xWThkRWppdkN0SkwxQytMbndI?=
 =?utf-8?B?aWtTNWtDVDk0Vm5UeEFwYndTSGtlbEt3R1ZNNnFucWlkN2sxRDJKeVhDN3lE?=
 =?utf-8?B?bStGOXJrUG80b1dzRjdFaU83ckdJN2drczh0M21Rem1MUmM1TDcwZTR3cjQx?=
 =?utf-8?B?STVUWGIvdGNkaE02S0ZVeldUUEVUdzhnV0FkTks0ZW9wcUFMalNmQVh1WmRQ?=
 =?utf-8?B?bWc4c0d6bWJSQUorZTg3MjBwVnMyb3NwWElud1dKbEpzeUlST0FweWVIcGxO?=
 =?utf-8?B?dG1rbUxraWZFSDMvVUFvWmFYT3dRNmN3MXpCakhOWlhvbmdPV2t0YWVzNjVv?=
 =?utf-8?B?Tm1tT29jWUlLYm03RnFyaHNKbElxS2RVQUxseW1DbVlEalNmT3lJbkdWcnY4?=
 =?utf-8?B?MFJ3N0JKajlzVFZsTCtWOXZTMTMvUVZlQkVyZ1RMK3NMZGs5SHBXdS9DTzBH?=
 =?utf-8?B?NTZrQjVOOTRHRUR4SXNkWmxsZU56Rzc3S2F2TUl3OTlKYldwQU9LYW5LbUlv?=
 =?utf-8?B?VzJORlBlLzJBTXpkbjJUNGpSNnpLWXlmMW5MUVVld3gzVGNUdmY3ZlVEcTMv?=
 =?utf-8?B?dVlzMjJZRlZmQW84MDRhOERzUENrMlo4dGZPdk9NdThmeGt2eFpJSDZqTnBN?=
 =?utf-8?B?TWZFYjlSbytqakhacmpOMXhoRU5kWldSTzZUd2toUVlzNmozcjFlSXFybUo4?=
 =?utf-8?B?RVNnYllzSGJqdi9KekJBajNOZEJWcytreW1maVAvcGg0ZzdZeUhVbjlwWmUr?=
 =?utf-8?B?c1BGVktYLzBoMFdRd0VWN3E4R3o1T2FUVWJPeFhLNGVWaUUyYy9qZ3loVnJT?=
 =?utf-8?B?OG1tRjRFRWFqeEQ3THVkSk9wVndGOE9aOUtPMnM1Z2VOazR3aDErcDZ2M2tB?=
 =?utf-8?B?UEh3R2JWWTJzcmJUa0FhcHM5RTAvWmxPOGFNbVNpOWpRSlNlQWx2d1NFclZD?=
 =?utf-8?B?cFBwUTlWQTkwa0FNUmtxaXFIR1NmWG1aTk5LNXJrbU1ZUkJ4N1R0TW1kUW5O?=
 =?utf-8?B?aFJZc3N2MElUSVVQUHQ5c0xpbDNUMUt6WVJYNkhKNVJxL2haeGhFUGhDK0Uz?=
 =?utf-8?B?VmFlYlg4TnkwVmFtNlFnTllGYUpXallPNkhOa2p0TjVkb1NOZEQ2MGY2bnhh?=
 =?utf-8?B?L1drUnFuQ25iaDd0N2QrRGJLOS9Gd3FjanR0MVVMN1J4SVRFTVEzenNzWFo5?=
 =?utf-8?B?K3d3OXBvRlY5bVpPYkl3b09oRTJtcHBuR09SK202WkFyQzlZRlhvSFdXUmVP?=
 =?utf-8?B?OE5iM3g4eml3dGxxQ3BPbmhhTHN0UC9IdzJyVnBoRmZkSVV4K3lFa3lMVDlQ?=
 =?utf-8?B?Um93bDVpMTR6eU1SUk1DM0JLY29Jb1R3WmxlMklBNWQ0YzBpNzc2ZklLTTNs?=
 =?utf-8?B?WStvQ3RBSEllVmJvb1VRUnYvZnpLbzRXRFMyQmhaWTg4ZG53SFluMkFzQmJu?=
 =?utf-8?B?TC9rWE5Sci9KMURZNG5qbERxMlcwdEhudUVVeXJ1WU9SbWd0eUdPcjFOTE1W?=
 =?utf-8?B?WU9LbXJpSkxuRjYxMGd2WGNrU2N3SDhjZ0lhMFNnQnBYQlFISXdOODg1MUFp?=
 =?utf-8?B?b1ZYbk83aDBqVXEvd2hqRVhTWGt6bTBjbGZ0N0lJVC9lVXl1QXdQWkEyNFdl?=
 =?utf-8?B?Y21BaG4ySExxbytRZFdYYldpNHBtcEpWcC85SE4zS2RTUFZnRnlQSkFBWEpt?=
 =?utf-8?B?cHlwSkFuR1VROXpUVXVlS3lPYTFmem1leDViWUhKODJnVm1EbDJYTFIwV09w?=
 =?utf-8?B?WWhTK01aVlpYU3FBaE94eVlMSU1MUjZZbmh2bUl3cUFJWnAzN1M1L0lBbkZC?=
 =?utf-8?B?L1RESElyZGZ0aTVCc2I4WE9SdWhGaXpFNHMvV25GUmFtMTdIbnloV1luVnJo?=
 =?utf-8?B?R2loM1FsMldzTWVxNHBWU1psY0xuUll6WFhhUjh4NjhRVWZjdGJtTmVHTnBs?=
 =?utf-8?B?b0tSM1pGZG1VRzFIUWdyVVIzK2hGV2ZlU2ZQY0xacmdXZGFNdmUySzFDYXVD?=
 =?utf-8?Q?ygQWH5quXDZ38mVc/Qpy8XohB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kq6JkIktCq0OmVwyoLGaYqwRMxf1zyhYG8nNYhJvakop8dN/5rLp5T7OpYBqj0c1B3C/IuwpNN0YyCczYgaJgd21kUuvFW7FKcftvKz5xjemp3B5tvsIvdMZRXuBF9zHuElapH8cVM5+dc6aTwMqpjhuF+eM7wAfnhnbGbDR5wVfa3u5zmzD24WliDP1akrvx7pKqH/akyac8W/XOA0WwKxUVJ+G6fP2EtR1zCpwyp1s27CPQ87lo2RSa+54p+8bR/FiqshsNHWDMLnI2koqD8ZTWFXxGf29q3Q1vko0+ejc8AjLA+iBtiYPGElZENePZIVFDwo2PQFAUIwro+AXBJMYCZo7erIszrPSqbY9YX5jIcDoIzWN8dTATOyyYBpuGdO6OG1Bc4GkiH2TfZ28sTDZg8Df8bkcfosuSIqLJigPzMbgNdQmtZLWwGB5m4yY6sZGvwR162nLZpsVSRtgnPuoz2zKkTvR3+Y87UnXQhvAHt3VfPB/CioJ+ZuXSUSj3AqOmLFzkWwSLrfdPSCls05ukCrN7+8vEBYTjaHOG7vkYW56isXy3xjmHzxl6rJBYhbbCKhVYpA7MSHz/9EVuVhuRYANVBzq9uCm+yEcR14=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa5bd24-c42b-4cfe-2864-08ddc9828654
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 00:47:39.5030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1W34Wa1xqJSlBbdU/gIImBB6RnTbw7/CXbdAjromwmVf4ZgMaFNziK7hTKvLjMKqMJMqN2eP5T2xyJQ62ChmsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4364
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_04,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507230004
X-Authority-Analysis: v=2.4 cv=MNRgmNZl c=1 sm=1 tr=0 ts=6880312f cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=M4DpOHmhD0fxWGg_iRcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: _4h4rZvBPdERiMqlIEIbPaZcZQMBLElr
X-Proofpoint-GUID: _4h4rZvBPdERiMqlIEIbPaZcZQMBLElr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAwNCBTYWx0ZWRfXyTHG0c5sI6QJ
 TQJ4sdzQwlE2NWXOP2+seSPO7/hvdNHSyI3bx/GDzCiA7xdDHOV8k4n07Mrg3dZkuycxiQwwhn6
 UYsHVYWoZXRYiGvv6vmk01I78O1iRfuPRSHPG+DW77CBc3D6vpTRq24akvp2fOn/Ep7OFxsLMrw
 bGmpzJUULlXRI3rzE0vqm+3nWhTseHEmTo7QrHFH+E2uc8ryaBQ8/OZ0gBUk/hOnZHr2D4F3igK
 qpuYO7Bt/fwavVtSy035uU5evYWyjZnT3eH77JQv41zRqzSdYB0oe4PniLUxSTLNepsbd5l53dv
 EeqNymGTqdB3MpG5SDP9yJ7488cUWOzIwLmh/Ch8MTUoq9BqTxarOXAYZH59XKvIFzkHSVNAhJR
 YybiICTzp4lv04eSWY+EnaY847OqIt++xsHiur+QjnMbXw49grMNJS67v+yQIzREjCFuKrP0

On 7/22/25 08:34, Nick Alcock wrote:

> On 25 Jun 2025, eugene loh outgrape:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Currently, USDT is limited to 64 probe descriptions since the
>> underlying probe uses a 64-bit mask to decide which probes to execute.
>>
>> Change to a multi-word bit mask that can be extended to however many
>> probe descriptions there are.
> Oh yeah!!!!
>
> Not quite happy enough with this one to r-b it, but it's sooo close...
> :)
>
>> Also, change the mask words to be 32-bit rather than 64-bit.  The reason
>> is that, commonly, there will be fewer than 32 probe descriptions.  In
>> this case, we shorten the value of the "USDT prids" BPF map from 16 bytes
>>          uint32_t        prid;
>>          long long       mask[1];
>> down to 8 bytes
>>          uint32_t        prid;
>>          uint32_t        mask[1];
>> (The second member is smaller and no longer costs extra padding.)
> Nice!
>
>> We also add an
>>          extern int usdt_prids_map_val_extra_bytes;
>> to denote how many extra bytes will be needed for the extended mask.
> Ugh. Is this really the best we can do? A global variable referenced via
> extern? Can't we put it in the dtp or anything? This will fail as soon
> as we have more than one dtrace handle... and yes I now that's not
> exactly tested and probably doesn't work, but we shouldn't break it
> worse when keeping it working as well as it is now is so simple.

Okay, changed.

>> @@ -48,8 +48,9 @@ typedef struct usdt_prids_map_key {
>>   } usdt_prids_map_key_t;
>>   typedef struct usdt_prids_map_val {
>>   	uint32_t	prid;		/* should be dtrace_id_t, sys/dtrace_types.h */
>> -	long long	mask;
>> +	uint32_t	mask[1];
>>   } usdt_prids_map_val_t;
>> +extern int usdt_prids_map_val_extra_bytes;
> Note that this is not how you're supposed to implement VLAs: [1] is
> extremely obsolete (as in, pre-C99) and very deprecated at this point.
> [] is the recommended approach, if you can live with its restrictions
> (and I think we can here: all we need to do is remove the extra in
> extra_bytes and *always* allocate at least one byte, which actually
> simplifies the code in usdt_prids_map_val_extra_bytes(). [] does include
> the size of necessary padding: mask will start at precisely
> sizeof(usdt_prids_map_val_t).)

Also changed.

>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>> index 5ba50b678..65413cba6 100644
>> --- a/libdtrace/dt_prov_uprobe.c
>> +++ b/libdtrace/dt_prov_uprobe.c
>> @@ -303,6 +303,8 @@ typedef struct list_key {
>>   	usdt_prids_map_key_t	key;
>>   } list_key_t;
>>   
>> +int usdt_prids_map_val_extra_bytes;
> Ugh!

Ditto.

>>   static const dtrace_pattr_t	pattr = {
>>   { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
>>   { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
>> @@ -403,7 +405,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
>>   	int			fdprids = dtp->dt_usdt_pridsmap_fd;
>>   	int			fdnames = dtp->dt_usdt_namesmap_fd;
>>   	usdt_prids_map_key_t	key, nxt;
>> -	usdt_prids_map_val_t	val;
>> +	usdt_prids_map_val_t	*val = alloca(sizeof(usdt_prids_map_val_t) + usdt_prids_map_val_extra_bytes);
> (this bit will need changing slightly if you use [].)
>
>>   
>> +void usdt_prids_map_val_extra_bytes_init(dtrace_hdl_t *dtp) {
> Wrongly-placed {.

Got it.

>> +	int i, n = 0, w = sizeof(((usdt_prids_map_val_t *)0)->mask[0]);
>> +
>> +	/* Count how many statements cannot be ignored, regardless of uprp. */
>> +	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
>> +		dtrace_stmtdesc_t *stp;
>> +
>> +		stp = dtp->dt_stmts[i];
>> +		if (stp == NULL || ignore_clause(dtp, i, NULL))
>> +			continue;
> I was about to complain about the cost of all these ignore_clause()s,
> but of course this is only invoked once per run...
>
>> +		n++;
>> +	}
>> +
>> +	/* Determine how many bytes are needed for this many bits. */
>> +	n = (n + CHAR_BIT - 1) / CHAR_BIT;
>> +
>> +	/* Determine how many words are needed for this many bytes. */
>> +	n = (n + w - 1) / w;
> Thank God you commented this -- it took me ages to realise how it works.
> It feels like it should be a standard idiom, but I've never encountered
> it before...
>
>> +	/* Determine how many extra bytes are needed. */
>> +	if (n > 1)
>> +		usdt_prids_map_val_extra_bytes = (n - 1) * w;
>> +	else
>> +		usdt_prids_map_val_extra_bytes = 0;
> If you use a [] array, this can simply become
>
> usdt_prids_map_val_bytes = n * w;

Earlier you wrote, "*always* allocate at least one byte, which actually 
simplifies the code in usdt_prids_map_val_extra_bytes()." So I'm missing 
what you mean in the case n=0.

>> +}
>> +
>>   static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
>>   {
>>   	dtrace_difo_t   *dp;
>> @@ -650,6 +679,7 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>>   	int				fd = dtp->dt_usdt_namesmap_fd;
>>   	pid_t				pid;
>>   	list_probe_t			*pup;
>> +	usdt_prids_map_val_t		*val;
>>   
>>   	/* Add probe name elements to usdt_names map. */
>>   	p = probnam;
>> @@ -685,11 +715,11 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>>   	}
>>   
>>   	/* Add prid and bit mask to usdt_prids map. */
>> +	val = alloca(sizeof(usdt_prids_map_val_t) + usdt_prids_map_val_extra_bytes);
>>   	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
>>   		dt_probe_t		*uprp = pup->probe;
>> -		long long		mask = 0, bit = 1;
>> +		uint32_t		iword = 0, mask = 0, bit = 1;
>>   		usdt_prids_map_key_t	key;
>> -		usdt_prids_map_val_t	val;
>>   		dt_uprobe_t		*upp = uprp->prv_data;
>>   
>>   		/*
>> @@ -707,11 +737,15 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>>   				dtrace_stmtdesc_t *stp;
>>   
>>   				stp = dtp->dt_stmts[n];
>> -				if (stp == NULL)
>> +				if (stp == NULL || ignore_clause(dtp, n, uprp))
>>   					continue;
>>   
>> -				if (ignore_clause(dtp, n, uprp))
>> -					continue;
>> +				if (bit == 0) {
>> +					val->mask[iword] = mask;
>> +					mask = 0;
>> +					iword++;
>> +					bit = 1;
>> +				}
>>   
>>   				if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
>>   				    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
>> @@ -726,11 +760,11 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>>   		key.pid = pid;
>>   		key.uprid = uprp->desc->id;
>>   
>> -		val.prid = prp->desc->id;
>> -		val.mask = mask;
>> +		val->prid = prp->desc->id;
>> +		val->mask[iword] = mask;
>>
>>   		// FIXME Check return value, but how should errors be handled?
>> -		dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
>> +		dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, val);
>>   	}
> ... am I missing something, or do you never modify "mask" (the local
> variable) anywhere in this function? So it ends up always zero...

Perhaps you're missing something?  mask |= bit

>> @@ -1451,7 +1485,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>   	const list_probe_t	*pop;
>>   	uint_t			lbl_exit = pcb->pcb_exitlbl;
>>   	dt_ident_t		*usdt_prids = dt_dlib_get_map(dtp, "usdt_prids");
>> -	int			n;
>> +	int			n, ibit, w = CHAR_BIT * sizeof(((usdt_prids_map_val_t *)0)->mask[0]);
> We could really do with better variable names than "n" and "w". w seems
> to be the bit-width of a single word: word_width? width?

Hopefully, this is good enough:  "w" for "word width" or "width"? Mimic 
other similar code closely.  Seemed like a reasonable choice to me.

>> @@ -1538,7 +1572,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>   	 */
>>   	assert(sizeof(usdt_prids_map_key_t) <= DT_STK_SLOT_SZ);
>>   	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
>> -	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0) + (int)sizeof(pid_t), uprp->desc->id));
>> +	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP,
>> +		   DT_TRAMP_SP_SLOT(0) + (int)sizeof(pid_t), uprp->desc->id));
>>   	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
>>   	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
>>   	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
>> @@ -1572,8 +1607,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>   	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
>>   	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
>>   
>> -	/* Read the bit mask from the table lookup in %r6. */    // FIXME someday, extend this past 64 bits
>> -	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask)));
>> +	/* Store the value key for reuse. */
>> +	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
> This all makes sense...
>
>> @@ -1587,21 +1622,24 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>   	/*
>>   	 * Hold the bit mask in %r6 between clause calls.
>>   	 */
>> -	for (n = 0; n < dtp->dt_stmt_nextid; n++) {
>> +	for (ibit = n = 0; n < dtp->dt_stmt_nextid; n++) {
>>   		dtrace_stmtdesc_t *stp;
>>   		dt_ident_t	*idp;
>>   		uint_t		lbl_next;
>>   
>>   		stp = dtp->dt_stmts[n];
>> -		if (stp == NULL)
>> -			continue;
>> -
>> -		if (ignore_clause(dtp, n, uprp))
>> +		if (stp == NULL || ignore_clause(dtp, n, uprp))
>>   			continue;
>>   
>>   		idp = stp->dtsd_clause;
>>   		lbl_next = dt_irlist_label(dlp);
> ... as does this (although we are now calling ignore_clause() at least
> twice for every clause, I think three times)...
>
>> +		/* Load the next word of the bit mask into %r6. */
>> +		if (ibit % w == 0) {
>> +			emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
>> +			emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask[ibit / w])));
> ok, so this uses the 'w' thing to get an array offset out of a bit
> count, and then you can just use the existing repated-shift code. Should
> work.
>
>> +		}
>> +
>>   		/* If the lowest %r6 bit is 0, skip over this clause. */
>>   		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
>>   		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_1, 1));
>> @@ -1629,6 +1667,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>   
>>   		/* Right-shift %r6. */
>>   		emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_6, 1));
>> +		ibit++;
> ... so, this isn't in the loop conditionl because the values are only
> filled for non-ignored, non-NULL statements. This assumption is
> duplicated in two places (here and in usdt_prids_map_val_extra_bytes())
> and if it ever drifts we get uninitialized rubbish or buffer overruns.
> Should it be centralized somewhere, somehow? At least it needs a
> comment.

The loop bodies differ.  Okay, though, I added comments.

>> +# We stick 80 probe descriptions in each of 3 scripts to test
>> +# USDT's ability to handle hundreds of probe descriptions.
>> +++ b/test/unittest/usdt/tst.manyprobedescriptions2.sh
> ... maybe manyprobedescriptions-bytesize.sh :)

What is "byte size"?  Anyhow, the point is that there are many probe 
descriptions.

>> @@ -0,0 +1,127 @@
>> +#!/bin/bash
>> +#
>> +# Oracle Linux DTrace.
>> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>> +# http://oss.oracle.com/licenses/upl.
>> +
>> +# This test uses many probes and probe descriptions.  Therefore, the
>> +# number of BPF programs to load into the kernel -- dt_bpf_load_prog()
>> +# calling prp->prov->impl->load_prog(), which is dt_bpf_prog_load() --
>> +# and the duration of each load are both increasing.
>> +# @@timeout: 400
>> +
>> +dtrace=$1
>> +
>> +DIRNAME="$tmpdir/usdt-many_probe_descriptions2.$$.$RANDOM"
>> +mkdir -p $DIRNAME
>> +cd $DIRNAME
>> +
>> +# Set the lists.
>> +# - The probes will be foo$x$y.
>> +# - The probe descriptions will be foo$x* and foo*$y, for each $d.
>> +# So if there are nx items in xlist, ny in ylist, and nd in dlist,
>> +# - there will be roughly nx*ny probes
>> +# - there will be roughly (nx+ny)*nd probe descriptions
>> +
>> +xlist="a b c d e f g h i j k l m"
>> +ylist="n o p q r s t u v w x y z"
>> +dlist="0 1 2 3 4 5 6 7 8"
> ... and with 8... maybe we should also test 0, 1, 7 and 9, checking all
> the boundary conditions (and refactor things so we don't need to copy
> all of this every time).

But this is not a case of filling some byte up to 8 bits.  The test has 
nested loops over these lists, appending more probes or probe 
descriptions, as appropriate.  There are 13x13 probes, one after 
another.  There are (13+13)*9 probe descriptions, one after another.  
There are 13x13x9 probe firings, one after another.  It just so happens 
that none of those numbers is a multiple of 8;  the only point is that 
each of those numbers is "big."

Thanks for the review.  Next version momentarily.

> (You'll only really see things go wrong under valgrind, but that's fine,
> valgrinding should be routine before releases anyway.)
