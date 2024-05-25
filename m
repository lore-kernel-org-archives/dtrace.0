Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F262FEA4
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 02:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716603018; cv=fail; b=LIR1Z+B/CchT4F+KUDmAmx7AT88dG5MSL24HiP3yLekXl3WzGCe88hm9B7/A6dGTMsu28yBjwNXP7Wep0e42MtsR8bouOnHV80IbbO7LjYZoi392bWMVMGbAchKdT63yUnsXcuHe6M235FXS2rqOFDJ1g5GZ3JNWGVtijtgzyZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716603018; c=relaxed/simple;
	bh=Aa7cBUcR8O8sYC/zmrss73qqfAYHDTqIhlR+1OxX2PY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nHZnshQ5UFYnLUhs7MCZj7qVsY0N3JRmZmvBsWrnfS2xMcn4xiImNpYZ098lkAV7LiOu7JK9jZIO8oFyhSu6o5Xwi4meAbMjPHvZ3cPfSuG07w2HAQioxyDE8mCMHiiMllR+cCDPLT4ALgRHk41re2PENruT/c1/P8Np5VgQ6B0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JjwXobwl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yagTnXF1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JjwXobwl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yagTnXF1"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44P1YpxJ014383
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 02:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=Lg1xFzQhmq1CRQYgxxQ71KgyUJ3ArS9adWGlrX5j3dQ=;
 b=JjwXobwl9bY2HmTjRQRSBAkmgoDmAiM6fd8aX935GUW4SkLK0FgZFtqszFW4clmSimG0
 w4Y3MhRLmPymTWpAASTbcx3d/pyQn9PALQZEK+ndW7kAZlupuhqwJRPbsyLm9sSLFLyr
 ZStiQzzGHYKUYf/4fIushM+GidYl/qWeliw2EXwVkZqONZRvoyXJzBms/7MiMc67tYNx
 u2fRe0KhBnrVvy5sdzGaWCCyambzuevbcsD44izqMEY9oD7stUXdkocBK8QAtmjES5Fg
 uxBolppf29b3XOlea619tiuNt+cQUJ9f0VYSOR11hSb6JtsNnCkFRmRv275FnsJyMz7k EQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb6der0jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 02:10:10 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44P1XXNn023696
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 02:10:10 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yb6e40hjn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 25 May 2024 02:10:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6A/aLFKlZLUNbVPxZSuD66uafVvj8hXd2anHPvR1Yxt2PMg6NomaXPnu7xple8j3fVkiKB3JI03dT5QUD1bvuvznyl5crED7QD+UFRh9CqfVwumFuMY+wDId1mLxgnPfyNzgmmMeVzYjwA/KfWN3i1AAa2stjcT7H+KH8bqPK0qU2aOmcPMXVcu9JlD8e7cRILgz1SXfVRS1gPcaIkhztMXwWiE6Fo6CGSa0LOyeNpyP1wWXXFTzQh7WIKPaOmDiikZWAHOa3b8K+4ffFLl51GNhMPuQGtaJA1AtFFaymQ/Ss0vt/ExhKLyuYl8wS/WM2BYSvcM1eqazrfeo5o/1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lg1xFzQhmq1CRQYgxxQ71KgyUJ3ArS9adWGlrX5j3dQ=;
 b=UWjKwZF8hiR/jueW9gRzaa3Ch+gM48+wOYud8hCZV4GzSTG3CIMa5cSP2WhHnaa8pab81nHbp3J/8eb+VL6yuDTl5VH6ZlgYEoV7aflTu8ieqDWK3NxUjuQIRn38EPZSqWMPYZU0aJFlnFvcnQL/R02KtTI8YSB1cVl6y3g2mHIkg/KQaskyXgFAL+Mvg3eNlcVcOOMFYtUYvfADqlnpLHkFQ07xNB1zDti/B3BpDbiREdDRV4d5NfhybDOYcEVwDcGhUrUsBCNw5rQu1Vyt7PiUQ2F1XcvN0svOqYJGwmHBQA8O0zZk9xRHUFef69V8nu7i+ccE+dxBTUqUSB14pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lg1xFzQhmq1CRQYgxxQ71KgyUJ3ArS9adWGlrX5j3dQ=;
 b=yagTnXF1R+Jz8FFO/mp6WNmb/W+lmbjWDk8xdfW7IM59QvZHlJMp2GF89xueDgugoaSqAXiyg2spsh1rqLQXJHhKjf+uIY737hq2EbB9h3Yp4EfSK2tVWmDaw/hX1uE8KEIk/Zk6yqTXcvftMfElzqeQHzUeP6U33hFAHhyrxGc=
Received: from PH0PR10MB7028.namprd10.prod.outlook.com (2603:10b6:510:281::9)
 by CH0PR10MB4938.namprd10.prod.outlook.com (2603:10b6:610:c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Sat, 25 May
 2024 02:10:07 +0000
Received: from PH0PR10MB7028.namprd10.prod.outlook.com
 ([fe80::657:da26:8778:ad24]) by PH0PR10MB7028.namprd10.prod.outlook.com
 ([fe80::657:da26:8778:ad24%4]) with mapi id 15.20.7611.016; Sat, 25 May 2024
 02:10:07 +0000
Message-ID: <d739ef2f-4854-46e3-af90-04f7a967a296@oracle.com>
Date: Fri, 24 May 2024 20:10:04 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] bpf: improve parsing bpf_helper_defs.h
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SN7PR10MB6287C2D42052CEDF749DEA5EC2F52@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <SN7PR10MB6287C2D42052CEDF749DEA5EC2F52@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:930:1c::21) To PH0PR10MB7028.namprd10.prod.outlook.com
 (2603:10b6:510:281::9)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB7028:EE_|CH0PR10MB4938:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d9972f6-95ec-40c5-04c0-08dc7c5fcc75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cE93RzNZZzdKNDE1b0c4K1ZTNm5laWV6QVJzVms4Ri9wSGNVRTkwc3VxWmcz?=
 =?utf-8?B?aVFkZEpRei9lcXltTkpkUEp2MjJ2WEpBL1pSV1QxdmdWTkV1OWhkdmthVEYy?=
 =?utf-8?B?U1lRblkwVUJrM0Z6NU5aclkxS0pXUGMvTUtOM3AvNkQ3UHNPYnNyYzBycWJw?=
 =?utf-8?B?SmtQWHlraGMwWnVZTkpST1RtalIrd3JzT0VGQkltWUtZQ1dRSTJXNGM0TDBy?=
 =?utf-8?B?K1dTS3VtYkZkQkJ6QkJxZTlMeHNNRFYyeDJSVjEyVFdhRTZjVWF5ellMNkZa?=
 =?utf-8?B?clBUc2NhbVdsTEE0R1FXZ2ZOVVdOOWhiazAreGl3N2dJc25QZ2cyRUhoYzdN?=
 =?utf-8?B?bkN4enI3V3prV3BQOWk5YUovRXBIaTI2ZEVhd3RqVXMrK2pIZTRDNForTlRZ?=
 =?utf-8?B?ZVR4R1owbTR0MlhTUFp1cjByQkdSWHJCVWI2Wm5zc1NxbVF5eDMyVUIvcS9s?=
 =?utf-8?B?OWFxWGt6ZnE3U0ZSbDVpUVdnL1pBT3orLzlrOVVKOUlKQStpYmcxVDNNNnB2?=
 =?utf-8?B?TE5GbzlGM2VqMXJ5TDREODRwQmo0N0U3ZERPdEFqZXNBMHh0ZjlOanRUaHdW?=
 =?utf-8?B?OTZaT2UyNVUyYTRRV0wxam9LYmdudWpHNTVaTmNYRVJRVUt2QkIxcTJvbnFE?=
 =?utf-8?B?cW5yUkQyd1FoZ1hHUm5IeCthakxxQ1QybUJnSWNHMlU1Wk5SZU9HMTFQZ3BG?=
 =?utf-8?B?a2dRdWk5RE9Wd2hXb0puQzBXSDJIbHZpdjlueUlaZ2VmNStHOVcrTDcxWjRy?=
 =?utf-8?B?Z0tGS0NIbWZTZXlUdFc2d1dLcTdOVG5KT1RROHF2SGZSMy9UbXhRVzJCNXQ4?=
 =?utf-8?B?SWVVRHArcTJycDZGNEVQdmV4OW1MQXZnVHdZRmZ0UVBuZXFyTGFpajhveTQz?=
 =?utf-8?B?NGZBMUR2TjBzN2s0TUM3QzV4QjcwT09vamUwdWdFdjcvQnM4VFJneFJRa1Bh?=
 =?utf-8?B?N2RySDdzNXJHN2lnWmZSYjJCUnc2aFRJNGxYTUZTeFlGaXgwS3FvbkZnaGZC?=
 =?utf-8?B?RXdwQnVjT2tENi9RaTNOVWtVZ083QVlydGVOWkIrVlBQZjZHUGZjdmd0K3ZS?=
 =?utf-8?B?V0l6dDRUSlBKZjVqbGNnSEJPcjhCcXd2RmxOUVI5ZmJBNCs2Zm92aG02Ritj?=
 =?utf-8?B?Q3FNNnlMWjRwaFBDSk5XSy9PeDc0TmdTNHRoY2ZuRzBaUXlNTFJBOUVZdlcw?=
 =?utf-8?B?aGJHcUVxTjNxcm9nNjdUZ0NXN1NwaUR1RDYwNUtNcGhIWWUrWE5VQ3NtUW9X?=
 =?utf-8?B?ajdRQlIvU0Y2d3BTY0c2R1o4TTBRNHJEZUcxUUEyWmo2QVE2NG4wK3d2Q0kr?=
 =?utf-8?B?a0MrRG43c0FrNkNLQUtLVHBiR3FxSFpBQUdDSEpQZ0RJVk1PT3VDUnVjRmJ5?=
 =?utf-8?B?d2JIa1lWSU1PbWc1KzdRNzIycVZtSXBnQVppUzAvNUMxL3RCSEJsQWROWHJZ?=
 =?utf-8?B?SXFEMTJRbDlyRGIyVlZNNXQ0enltSkh3MVFUeEpQb2dmL1hjeUxCNXAvYlk0?=
 =?utf-8?B?SmtXdWllRVJxQThYU3NnVnBaaFhoMHZRU1BHcTRyZXNBTnBzSlVLRFBFL2dq?=
 =?utf-8?B?QzAvUTNGc1VJaE5UYmw4Y0dyV3EveEE2dXFhbVZWZmJTaEJEa3NCZzlLdkRU?=
 =?utf-8?B?VlAvVHpZVnN3SllCQ3l6MDgwMXRiQ0J0N3Q5MEtyQmZqakFpN2IrNjh5Sjcr?=
 =?utf-8?B?WmJhVFBPTEJBWjJHS2xWeG5NMFdUQzh2aHAyNlhEbWZaeUlyS0dabHp3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB7028.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UW9HVExQZ0N5SVpuNDk2cGwyRVV0YUJMWmZPL056OG1TRWxDSGVoMFBvNXhr?=
 =?utf-8?B?L045bUhmU0ZkWS9VeEJVWVV4TFM0WERZY1hxVk1qUXNxMG0yMHJnbk81Ymkr?=
 =?utf-8?B?ZHNaZWxKdVBCblpkdGsyaFgvMXFNLzZTNFVuOVN2M1pxU01sdzhqUlgrZVBN?=
 =?utf-8?B?b2UvQ1JNaDdJZk9mUy9iaVg1S2JoYStlMnJ4SkdCamlHWkY3VGJhSXdnRlk2?=
 =?utf-8?B?d3NURk1ra3F0cHZDbGhnSmJqTkU3QTNUdElQdVc1ZHQvRVlyWUVZcnVqL2NT?=
 =?utf-8?B?VzlLVmxlK1MzU1BSSkVXb3kxYW9vZmovOUFpRW80YW5CNmVJM0tXeTFRZ2VH?=
 =?utf-8?B?UEN5c2o2N3dicXF3bGNTZW84VEs3ZWhTaitUWS80WTE4NWVJRmtFdHM5NHpK?=
 =?utf-8?B?ZlFVSDRhLzBSUnRyNVptRWhlV1lvSUlrQmFWUWE5RWhiNHBESXFiY1VDUy9v?=
 =?utf-8?B?NXVjdnlVdjJJZDdjZHRXQUFsNzkwYVBOdVFmL25VMUlYM0JLK3Zka01LeFBP?=
 =?utf-8?B?SnYzMk9Ga1hoQTRwVUpDbWFmZzZuUEVURzBtajgySkZORjQ5ZFE4Q09OTXlS?=
 =?utf-8?B?NFNDL3d5RHhxaWNVYW5RQlBhSHNWd29sQTVCT0k1L0JseFJKYWE3SC9WM1k2?=
 =?utf-8?B?eExZZTFhMnluYTZtOVlEQWlpd1dwQ2Z1V3JjdEdvTE9DUCtqYjlxblVMWnpD?=
 =?utf-8?B?Rk9TTWNzUko2ZlNMMXVqR2dHQWZ1cDZkY1BUUFdyNlI1YmhrbzdGTHJpS0VH?=
 =?utf-8?B?ZzYva0UzbXBIdVNKQmZ6RU9hMDhBTzgvMmFvTmZQdEhuNDJkbEljMlI3b0Fn?=
 =?utf-8?B?OXgxb1FzOTZzWFZRMERXTGNVUEJubzJ5VjhhYzlBZWdxWUlacFRiUVFBdkN2?=
 =?utf-8?B?VS95ZUE4eEpSYWRGbUtyZU4xTEN4cTE5YmxxeE1ZcFQ2NFVCWVQ3aEVDeXJr?=
 =?utf-8?B?a2VzTXBGNzJpTEVkTlo3WjBrK1hTdE9SSm1PdzUvUlhoOXJiSk5vYW1GTmZJ?=
 =?utf-8?B?bFBUdmNuUndPTEVFVy9MKzU5MmRuMWdMRExleHRGVGpkQUpYekdJUjRJNWor?=
 =?utf-8?B?NklZNkk2WmcrTE4wUnhzM0d4dkg4NHhCL3dkK254QnUxa1dyektZNTQ1ZXNN?=
 =?utf-8?B?SHVndHBVMDlGSFFNTG9zMzhzRmsyTTdkV1luZkpvck1ZaEtKcHJXVjBWeG9Z?=
 =?utf-8?B?UTZNM29WcEtYU1FIQWFJUDRoV1VRR2wyQzZrTE5WUjdPWWlUL2M2RGpYdlhK?=
 =?utf-8?B?ZVQyV01jc2ZBSEp4YlRzeW1qbEZvQmRldzVKT2FscjFKVUVYaitsWXVVbC8y?=
 =?utf-8?B?TjlTUWJHY2hDL2UzQUV5REJLS2xzSlQ1RW11SFlUay9XVjY4K2lzaExKS3d1?=
 =?utf-8?B?QkpBSUlGY2p4OHYwZEdwWjlySHN0ZVREeWxTNnVPcW40bmtIK3R2ZFlOT3JN?=
 =?utf-8?B?NzFzdUVXS285WGcrczdqK3dJeHJYczVUdXVFNVBrc0hDMkhZTmhrM3ZtL25X?=
 =?utf-8?B?MXBicTJCRzBVSDVxeUpuUkhsTnBqME5zMSt2T3dvZDVxV0tENEwvd1J2SE52?=
 =?utf-8?B?dldib21iUDZrL1Q3NVN6YmxKZnNaS2x3TmRlZDQwZXFOZG90Vjd1Mm9nNTV5?=
 =?utf-8?B?NzlhejZjbWFEa0lCeU1SUEdQcmphN2FnTnVic2lZaEV4eGUvK243NUJzVHRI?=
 =?utf-8?B?L3pQazF3TVFRdTdqTXozbEdqR2pmTkRZTVlnQkNiMWUvUnc0UmE2cmptRDRF?=
 =?utf-8?B?aVo1bldreTY5UWN3T2lhMk45Mk91eHZDQ2tNazBkN3R0NGQ1Q2FYQjhhYVcv?=
 =?utf-8?B?MzY4RWJZU0NVWWdPckR5clJYbGtaZy9Gd1VsRXZLeVdXK0pyU1RPWGJKOU9s?=
 =?utf-8?B?c2tOblU1cnhKRWdtMU05YmJBZUZqb2MxTWRmcklTWnVVYkNvRHNjZjI2eE5q?=
 =?utf-8?B?djFQS0hSSlphR2NQYkpXcGRScUxwNEJ4ai81UytiRTFnaitGMTRJTHNGdGo1?=
 =?utf-8?B?NG1KS2NrRzZSTmdUdnlWby9iOFlsRHFJU3pZaG5aL2hyODN0U1QzQXYyeVZO?=
 =?utf-8?B?ZGVSejEzZGJqWVRKQm1FUmVIZ0FxNEJkT05UVWFDUGFqYmVWT0hqaGFRcXpn?=
 =?utf-8?B?S2JmWTdoaHNOT3BTa0dDcmtxb3dLdHhzcUJJSGRHS3hmT3Bqa2Myc1JXOEZX?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	1kqlYoPksYid64kPUeyUoGLuEA7sS3IiuB6J4d0iWr53r6wBggJVJkaR55Vmy9RvaOJfkmH7pwlS5+tzSHBpIQRIzAsBobkPRX3jVBKV9LKC0qI9nx4OLYbyQBluzC8yF1DGA8MQw3NLqscD5TkMXfCM8GsqUkMNiVozN4rr9YlaMrOk51fnCwt2kjCo1Z+5l2Co9Gq3lBypuJSbcrt1G3OBPoMJZA4f0hIJnRCb0Dkg4bTk23yLh4uWfcjUNx6uBUdbZG75G/eXuUmamDEiIIYgDTNuVCXVJN4dIVjkjMxKEc8+FzRWp8xyQdOuPwtdKmgrNqumph739Y0n1Lfp54q8/JzGzE5H1f7S0mav+wO+DTaY7ZGElEXjDC+xQ/aWukTKmcuBxP4YjCJ3XPFzvsJEKg9zE2evGfe4IBfc41N1q6nmgj/+K8EIWZKdDVuq7RTtNECzZ5xpF57ZqepHVeYGBdR1S2zM6+j393nHWGULCHA57ZasmqTU6Oy2QXg7BT+oqwSKMECjqy/ssL03nSK2uu3KPBb/o0OH8T+wlpcJlGgnkRA1Vl4hd+jGpABtB0Z/jKsSoNHZFTRKmR5JdKn5X1TYKoRpvQlkQF+o+FI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9972f6-95ec-40c5-04c0-08dc7c5fcc75
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB7028.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2024 02:10:07.5458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfaoeWJ3Rgq+L1EBU6XcutS0AqtvgqjsZqmTX7ws5M7mTez80/it5hsTRYCwaF5mefszir5+NsSQBUn5PyoAYVoFvI0AuMu+J1mxeZ1sLew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4938
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-25_01,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405250016
X-Proofpoint-ORIG-GUID: AlR1jdbKmrjim9DQLo83oWqiNq1hhJPh
X-Proofpoint-GUID: AlR1jdbKmrjim9DQLo83oWqiNq1hhJPh

Thanks Kris!

Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com> 


On 5/24/24 17:57, Kris Van Hees wrote:
> The parsing of bpf_helper_defs.h to get names of BPF helpers and their
> associated values needed tweaking.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  include/mkHelpers | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/mkHelpers b/include/mkHelpers
> index dc5e62c8..96d5ea53 100755
> --- a/include/mkHelpers
> +++ b/include/mkHelpers
> @@ -8,8 +8,9 @@ BEGIN {
>  }
>  
>  $1 == "static" && /=/ && /[ \t]+[1-9][0-9]*[ \t]*;/ {
> -	if (match($0, /[ \t\*]bpf_[_A-Za-z0-9]+/) > 0) {
> -		fn = substr($0, RSTART + 5, RLENGTH - 5);
> +	if (match($0, /[ \t\*]bpf_[_A-Za-z0-9]+[ \t]*\)/) > 0) {
> +		fn = substr($0, RSTART + 5, RLENGTH - 6);
> +		sub(/[ \t]+/, "", fn);
>  
>  		match($0, /[ \t]+[1-9][0-9]*[ \t]*;/);
>  		id = substr($0, RSTART, RLENGTH - 1);

