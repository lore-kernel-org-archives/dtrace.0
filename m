Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED97340D8A
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756490305; cv=fail; b=i0PhvVWoXzxQIIyyVgDtArT5aIKjt19AoFBHDWesVpleu/ylKglYO2SOPyRnK7f1AG5sxnX0WR19Kt0PkjyFwys3FPCDDuc1efvsvV/NX3TnSPqPg/eKmoa5DQZaYQbOYAJhwRkS56f+fZhs07fvzCALdEn8YtpglWaab150fFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756490305; c=relaxed/simple;
	bh=YWF42t9TW1OgZyvVUoUJdoMjZ4dwKEyeBZyhufVPpWc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kkdP48BrM/+0/lVhksyfmJD51GF1p7yZWpvsbHErmvzy6RcOumtCOWEfiQDfmVOj5YJhlzQZmuAXmr3SM1ERjp2db1vpOXV5klr3oEwcUa0rBn6Sq6WmNYOyO7bPEnb2U25YtQ/8i8dKGvF/3pbXlrae2Lw34b142pKN3qfk5/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bWqyVUfv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vZTj9ok2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bWqyVUfv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vZTj9ok2"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TGg9PS024974
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 17:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=3toIV2GL52lDFqta2EH52f40w5hoEtsWnnoJbbacCFA=; b=
	bWqyVUfvvYTowG2vDasiEo8fFcFKsKpQdW3iEBU/ogce796Y6sexiaiKwUTjTesq
	V50UUVAG4lghkublTjDtQO3ZGni889TSGAkCUDzoFxRW/4fgB/DwzRmZaqFTJjDQ
	USY5NPxyUciCZ95+PaUaQxe3IfzRiBBaH9LhrJ7nfJJlINb4q3Ga40BGrx5oJrO0
	k8WpkP+pqD0c6qhFLiZf1YhF9EVukBv6jrd1Iboxfwiyph+egF6nfMk7IgndTbKe
	mgaTC2xatiBmViO66pxF1w5ZEsdjmcXvzt8GtetpAyqh6iZgkGucNQvKZ74Bow6L
	h8tG1jsm0Iq0cfbZ0iAvrg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q42tatyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 17:58:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57THcOOv005004
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 17:58:19 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48qj8dp4va-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 17:58:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Md55CaR3x6JJ7BQuxKVsKmU8FgWNg9t6UpANlvac6NsjHuTa9aBc4vpU1d3Muxznad/5iREbqSm/A3YR0cDruyE+CgskGtBqtZt2pcyQWfHroFoWIWzqthhggA9x8fGTGsKnVMGKb0T5fLJjZr07oHjnVfMfAHd+ongkZe+4Uj2siG0vH7daapAKQf8QGu+e3c4DSft9Fe4pcQK1VBQKArvK++xXEgRH1xsHXm7VCh/jBjntw58Yk3J5DMptkT4p7c/+NUH5/kBhUePqfnWa5hbgvy8LMjfB6pcOH1d+3F6y/VP9RNscafVu6farbaaIklJzTkYGRIztXZgv2a7Mag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3toIV2GL52lDFqta2EH52f40w5hoEtsWnnoJbbacCFA=;
 b=F1RtFReZIedSZFA4/mA9alBnbi81IcdxMT4E2G+S4hbnRqf5rlf6PXgoCYPFeuuvPHUDwkJQBfbWlr0X94FA1MnV7qKRzToB3wc6MCHja3VhtwarFvIW8h9TeZqpX0joqPuK1zOX7qviqLh2IyTOauISA5BmuszIJWSjKOHX0ALRWSCcLdkAKX4cJIN1EWq+E7ezfKgiNwurK6XHTV0roPLTpPI+bSLVFPZRI78N4v+rPnZaVkJRhfo6pCTbKEFLlOFPQ9ywAfAhxRIiV91H1I1osjJ7HiRrid7zR4OIoR/ZOknLY7MoxIWHawq8bIwLIT22YdQ/YnxZu85Kb/v4AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3toIV2GL52lDFqta2EH52f40w5hoEtsWnnoJbbacCFA=;
 b=vZTj9ok25wciRkIZdHiMs8VzEVfNZuEquZw7zXE1m5ZVEtcolF1MGSgaq2FujLP5w4yGrHZpooGEg2bK+aab5gDlWAUKAEoSUb3AlWg+zBF4qJcpS6E0PE9MyNjxbYxuAgG9l46Q9AAoanrd5SqxoM1XeVrApczC5ZAHu7yOsyc=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by CH4PR10MB8049.namprd10.prod.outlook.com (2603:10b6:610:240::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Fri, 29 Aug
 2025 17:58:06 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.9073.014; Fri, 29 Aug 2025
 17:58:06 +0000
Message-ID: <7c1c8d06-ae44-ca20-ba94-3d39e3ff17f5@oracle.com>
Date: Fri, 29 Aug 2025 13:58:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/2] udp: new provider
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250829082412.25687-1-alan.maguire@oracle.com>
 <20250829082412.25687-2-alan.maguire@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250829082412.25687-2-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0078.namprd05.prod.outlook.com
 (2603:10b6:a03:332::23) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|CH4PR10MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 25b8ff89-91de-44d5-5944-08dde7259af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejZUZnlZeW5yeWVlemJwZlI4UG9wUnFEdlZzOU5GSis4Z3pUZVZVZE4rMGFB?=
 =?utf-8?B?RFE4QjE3QmZXUVdXL1U1L0FKdTF4WFF3SDBpU2w0dWV4bjcrQlhmS0kzeGgx?=
 =?utf-8?B?SXJ2VWsyS0I0VWlSS3dQanl1Zy9hSVIyajdCTU5nV0dmbmtZcHZ6K1RTMWFB?=
 =?utf-8?B?WEp3NWFOQ0g5Yk9TOUxlZW9DNm5tT0JqTFFSVW8vNUtlSkd5V0xKT2RGeG05?=
 =?utf-8?B?RUZTZjlxc0c5SHFSejZLSGFCeExjTk52b3VwZ2F5QmVSTnZCUVBuUVBKN2Jm?=
 =?utf-8?B?V3U0RHlxb0tURHlvRm8zS2Vjb1pMb1BnTit5Q3lzdTFodms3aGxMSjNWU0sv?=
 =?utf-8?B?eVFJaStGN0VMZFd0c2d4cFdMMlRIWEhnM3FOVFl3RVlYeUZIdkJHR0REb1lY?=
 =?utf-8?B?c3FrL1lSckVtcnBuMy9TYjVwZXhwMFV0cXorZVM3aFI5V3B1emJjTE0vVzh1?=
 =?utf-8?B?NXQ1RTFLZUpFWXlpQVZxaFNyWnVzRVNoRlc0aDljZFVXbENqTDdEN2d5ZGYw?=
 =?utf-8?B?cmhoUnAzTEo5blZTVTZzbWRvamlLUEY2OThZRXF5VWFQdzRlUWdjMzNmcWhE?=
 =?utf-8?B?djRmK0M5QmprMmtzVENmUWdnSTVzYVdpNDFKYmZUOERIUFBuR1g0VU9ESFpF?=
 =?utf-8?B?WUx1a09vdEg4THVhVUxNNXFpd1h4cVZxSjVpYWtuaGFYd2dqU1V0dE1EVitP?=
 =?utf-8?B?dlUzK3J6MEpCcGdCdTc4cmRtTnRmeS9RNFNIQ1BMM2ZXWWtUR1EvUU84T1Vx?=
 =?utf-8?B?bHJ0UXQxTXdldzExVCtQY1lFMnJUVG51T0lzYVArSVAxNWs0K0V5c2NmNGVZ?=
 =?utf-8?B?eTM4WCtCYVNBc1JnS3NpUk9zdzl4VTQ4WXRBVnA5SHRacEVEZDY0VkpKMGln?=
 =?utf-8?B?bFFXcDhlN1hOWEt3WGVSemZpeDN6dGhlN1psMUVXaUQvWDFlNFUyRjRqcXA4?=
 =?utf-8?B?UDAzL3VVWVc0Y1NEakUrQnNKYzdNNjJBSGJRQUJzeEZSeXNuSmNSTURGdFU2?=
 =?utf-8?B?b0I1NEROYVZpUzB2cWloWVhmUEdWU3hvK3A5anhxbW1PVjlGUzQ2U05IZ0F5?=
 =?utf-8?B?Y3VwR0RJdlNENXJKOFN5dlZLM0JZQVlEUzcxbitMRW1Tc3VlL2FROUc5Mnhk?=
 =?utf-8?B?a294b21LZDJmYWJsMmRPUE94ZVRRRlhvbSt0ci9vNTQ0NXdxeU0reTYwMkVr?=
 =?utf-8?B?WXZDWnJUb3I4c2xIc01yOFIvREp1R2ZzeEQxRnQ5cEhGQm5JSlhudWI5OWo5?=
 =?utf-8?B?Uk0rWmJ4NHBab2x5bFA0ZlVsUy92azJMdGlrYy9WQW9ZaUFCOEp2My85cjdL?=
 =?utf-8?B?cW4xcE5CVjhhRFNSZGljdUlvNUtsL21MYndNV3k0MXlXZWI3ZEtsQS9LKzVv?=
 =?utf-8?B?YUdNeW1YeU5vZXdGWUNMajFNdk4ydG1ycTUrd3VkNEwxR2FvNkZ0b0E1ZVFX?=
 =?utf-8?B?OFFxVFBDTFNqVU01cEhidkFXOEkrTjZzdGRLSndmN2pwWFpoUmhUdEp3MTlU?=
 =?utf-8?B?SkJpTEhCeUcxQzhHVFo3TjIxRDBjYXBZQ083WWlaWFU4dDAzYVB4N2U2VWc5?=
 =?utf-8?B?bkFWcU9UOGt0UXBGT2FKVkRFQ1gvWGROTUE0dUFjUkF6OTFDaStuV3RHajhP?=
 =?utf-8?B?YnE0UGJ1b24reWxQK0dzV2RZSll5aytWck5wOGtlVE40SGZab1dhSTd0TW0z?=
 =?utf-8?B?OGs3YlpBMFYrc1BYMGROVkxSQlp2WUNSMTFpZzBZVlNicjUyQXRBUHhXamF5?=
 =?utf-8?B?aHF3c1VVR1Z4TzJxdUhpMmhRdWYwTjZSbnlGQlFrcHQ3R0dYdTBla2NVcmhU?=
 =?utf-8?B?OEV0OTFzSWR4MlhHWVhQamo4QlAwQ211cjRTejJ3SUlPNnNzQjJ2OGRyN2FY?=
 =?utf-8?B?Z0ZSQUlrNG1jOUVmRGVMbUZlSkd0OTBhYzVJbE50NytsQlhjRkRmZjZUdWhT?=
 =?utf-8?Q?R9V1/qmL8TU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmtSY3k3SnJxMmZnb25CTktOYzdWME1LKzZVdTl5RS93OU9zZ0JDQkZLYWZo?=
 =?utf-8?B?T0NBT09qWTlKenJhNlZLY0tacnpmMFpJcHZlS1dZZlA0MGNxNXpXY2pyZWlB?=
 =?utf-8?B?VndVdVVqUjNrSTBZN01IV0FLdGNuNi9uK2VpVXE4L29vZUNHTDRXNDRuaEV4?=
 =?utf-8?B?VFhsYWpRbDdxMWVjSnZyTmxaQXRUZ2Z2SE5XdjNRcklCMXRCTkNvN1FGTUhI?=
 =?utf-8?B?dlRvUVUrLzBMNzk2VS9pVDc3QzJobEEyQ3o0YzF6Y0s5a3VjeC9KU1pqcHRj?=
 =?utf-8?B?c1hFQ2kyU3kycEZ5bEgvNHl3TzlmUkFpQTlkazNWMVhFZ1FJUExvVkgwVGhQ?=
 =?utf-8?B?QkVDRDBiV0gvOVc5aHNrWHdoelIyZk5Jd0c3VzhTemNmNWhqdm5qTW84Tm5I?=
 =?utf-8?B?M24xOWM1RmV4UjlQVE1jbGsxOXNOWEYvL3hDZGsvTWRwK0JteFYrd2JxZjll?=
 =?utf-8?B?amNQTTVGTy8zY3BpT2RwbGNscG5DTGdwckg1VnFmakNYdFpTWFFGSDNRY2NM?=
 =?utf-8?B?SmtjOE1ZQnpybDRXcWtCUGF4WnlBSmtKbGFDUXA0Z1ZTWEx3dUpOWFlWU1cx?=
 =?utf-8?B?MjFIWUxpQ0NyREJlVWhtSWkydGtRUy9aSTcyWDZuczBDQ1lYSXZDcGc4SElE?=
 =?utf-8?B?b3dvSVpnYUlJWExySUxsT1o2WC9TTk1TL1B5WjQyVXpsb2xERHVBSjZ4UUFj?=
 =?utf-8?B?MGtUanlkaEZEaGIyNDVQYmo3ZFkvQkJrZlZYeVlmNm5VUDlQVEdPSWVoemp0?=
 =?utf-8?B?d0ZFRGJDRUNYcnliclBMK3JYZnBNV3hzYTNVVUVMUTFyWEU0K1owcExKNDhC?=
 =?utf-8?B?OTNTcnNyMHl2aS84VlAxL1VuNEljdlpxZFlscU5MZS9LNEp3L3J3L2p2TEV1?=
 =?utf-8?B?dUFBT1JUNW4zMDIwTXgvS0JnelNBYzI5eTVrR1NtL2poam5JUzlvM0RaUG9I?=
 =?utf-8?B?b2lzMERteGZJdTc4eFFTcDVoZkxXZVBKRU1wSGU0c3FFZTlRNXRiZm5sdk4w?=
 =?utf-8?B?RHpMTlNMRmt1cTlYRUJaSGtQcnllNllqREZTQ2VwVFFMWGMwRnFhemwyMnlE?=
 =?utf-8?B?S2F5dVN5R2JJelFiUGJTY2Fkc0JsdFAyVzFrL0VrMmdhUG4waFpOa2x5YU9t?=
 =?utf-8?B?MmhRSkI5ZjFranFzNWVya1Zhcm9KaENaTGRxd21GK0IwN3RuTFdIcmJKRUhP?=
 =?utf-8?B?MlZnbVNSMHF5TGJWOUNOdXpaVU1KTHRkU21sYnNkeFVDOXpvd2xxR01SZVJR?=
 =?utf-8?B?UVhkc1lsQWluQnI5ME5XdjZqMTNxSmNPYmJDOFhWL05hQ0M0VEZuNDJjZTFz?=
 =?utf-8?B?dUV0K3psbWROUmFQcm1ucnpRK2JrZjJrTmJMUHh5M2NRTG91Q0VMQUVDYTF3?=
 =?utf-8?B?NDNLeWFpcThuclpSeU4xQndWZVFQaEszbFVtczIreWhxdFNnZUJ6U3B0OGdU?=
 =?utf-8?B?VnR1V1FwN1Y5L1k3NjVOeXNRU3B6bTY0czY0bitlUUEzemZCbDkvVk9veURB?=
 =?utf-8?B?YzhLbmxRdVlmTy9rdUQrUWxFbVFFWWlLU1VUbjVrS3Y4SzAwYWtPeWZzdklL?=
 =?utf-8?B?TlhiM2NFZ3M1NHZEeFhQVFhXZENtM1FyOE11NXU4V0VvblQzVG1WaUtlZldL?=
 =?utf-8?B?Kzd0bEZsemxlRXZsamdUQTdlSDM3WW9WazVoL1RjNUZiUmg4T0ZVZGZuMEwx?=
 =?utf-8?B?TGUxY29IZ1loYXJkcWwvSHZsbi9tQVg0MUJIS05mWHJpSVA1QUxFNEd5cGF1?=
 =?utf-8?B?ejRjMEsrWkFqR3BQSW1nTjBVVUwvaDZMaVpaVnRocGRoWkR0L3hWbzRaTXhC?=
 =?utf-8?B?MGFhOHprbWpyNnN1S2hnZlVIZ2hKajRIVVlwUDlocnpLQWhoV2gwUWJtVnRu?=
 =?utf-8?B?OUI2cXVDd2xkbnY4Q3oxUzdETEt5NjlZVnpEZHpJZk40MGFnVThQYzd4cmNO?=
 =?utf-8?B?dGFTWmFFZzJOWVdzOEVoVFdzNXVrNkVQcENHekN6a2w0NnhDMWJoK2xURk5K?=
 =?utf-8?B?NTNiUm0wdnYxZzRvYW9BRlJIR1h1L1VCRjd3eDloQ2gwcHR2bjlYRW91Tmhq?=
 =?utf-8?B?R1NFNXliaTBEVXpuU1c5TFF0YXd0Ky9MRUFoTHliMmNsYkNmWUdXb29pN0Ji?=
 =?utf-8?Q?4i8B1cE2ehoIWm/hN7R1FPf0Z?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/a0r0kBQTmM3ep53gIb5oicLcG+QpQT9iL6oOYXOWC7SiQAsqBDFolcvTIFuaNASmTYGdrwpsPTOa1x2q0HcCmgMgRgz8bv+MMcySj/pP0CYLDBZjyCDIXih1rEcnWPS/tx/3J17LmqmdqytxyN3ViEocIWLIddxjfdvAU4o+el6uu74nO0A4wlONKXzLmH2h1WC3KBoN4rzyZ9jiHMf7uvbvNrTnLaS9inamatIIGDPw75lXGKaftW6zrdvnpqpkj/rU31bP/FuMomcxdZw4ano8th6PrLsMPdLV/xqkTkMyLRF2J92241YpPmSIfTFdB4LrAvMSlICa/mx0KCd5Lefr66s9yLfF6RyN9IuJaVn9gSIT4cSuYVjnYyZqTLVeqj38pETonYtYmOXPCHixyVj70n+HdVinGRospnV+fvPOm1LHnIFgoWA4rgyx+6umGlRbcIoRp5vyH3GYwKzIZN/In9ITRgHfrLMCs4mRQLPLY5OYruKxcOCu6MmVgocMAm28Tn4AsEH+iW7zoRZCjme3GC+GnkwkUtEgfavpdSVXk5HXmfW7CIy4hTmjcxgi86GbQPfjMfbupiLagiiiTpTHIGId9/fyQSMdnduJu0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b8ff89-91de-44d5-5944-08dde7259af2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:58:05.7909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F52AhFQT9QP/JznNaba2xot0RrGr4fK+6ylBuCry5Z7v1BOcCVhbw4rzOkCVQDoxHy4Y3jT1u9cx/1mJDHPpRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8049
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508290158
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxMyBTYWx0ZWRfX7bwXoHqd/qLD
 Dvvo+Z9Edw08teTNh/q8LQ66GvDgpejrQR5TpEvJXu4xH21tyBksVSATyq3LEfk/l1L0yd8MNbD
 SbrWYeIPm538iyMurb5PC17ZGbDYOu77m96neUuSdDPT52SABHvVjaBXss3zMwEQLEpYu6X6afZ
 l7P059pVTaO3nAT8fzz72BxpfhysluRF1Kw92vHGhdPo0eSd2TIP0S5LGY74l3ieEhEZO24yCCF
 v3CKOI40ONbyAyyNdJe2VCMwqrYV5CA9GYWDBwXUPzqbsFZqSdjs6SEEAsLD3avEVM04uaEqlhJ
 arkvf5zJVNk0CPLYb9Kcm2MQxMflhHHbwBOC7vy0LMDdpWyJYYn++sop3lvbSUWCBjR/5Tij5Dg
 LX1UO7zqv8nfim5XkylTLKcE+s0t2Q==
X-Proofpoint-ORIG-GUID: 0lZcPB43ZSyCZ8tjULEdxUH0Thp0EWRg
X-Authority-Analysis: v=2.4 cv=RqfFLDmK c=1 sm=1 tr=0 ts=68b1ea3c b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=tKJ9A-DrdFUteSPSn1wA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12068
X-Proofpoint-GUID: 0lZcPB43ZSyCZ8tjULEdxUH0Thp0EWRg

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
(I didn't scrutinize every detail, but looks about right.)

On 8/29/25 04:24, Alan Maguire wrote:
> Support UDP send and receive, using raw fbt probes; since
> udp.d changes sync dlibs also.  Update test.x provider check
> for udp, and add udp to expected providers.
>
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>   dlibs/aarch64/5.11/udp.d                    |  11 +-
>   dlibs/aarch64/5.12/udp.d                    |  11 +-
>   dlibs/aarch64/5.14/udp.d                    |  11 +-
>   dlibs/aarch64/5.16/udp.d                    |  11 +-
>   dlibs/aarch64/5.2/udp.d                     |  11 +-
>   dlibs/aarch64/5.6/udp.d                     |  11 +-
>   dlibs/aarch64/6.1/udp.d                     |  11 +-
>   dlibs/aarch64/6.10/udp.d                    |  11 +-
>   dlibs/x86_64/5.11/udp.d                     |  11 +-
>   dlibs/x86_64/5.12/udp.d                     |  11 +-
>   dlibs/x86_64/5.14/udp.d                     |  11 +-
>   dlibs/x86_64/5.16/udp.d                     |  11 +-
>   dlibs/x86_64/5.2/udp.d                      |  11 +-
>   dlibs/x86_64/5.6/udp.d                      |  11 +-
>   dlibs/x86_64/6.1/udp.d                      |  11 +-
>   dlibs/x86_64/6.10/udp.d                     |  11 +-
>   libdtrace/Build                             |   2 +
>   libdtrace/dt_prov_udp.c                     | 170 ++++++++++++++++++++
>   libdtrace/dt_provider.c                     |   1 +
>   libdtrace/dt_provider.h                     |   1 +
>   libdtrace/udp.d                             |  11 +-
>   test/unittest/dtrace-util/tst.ListProbes.r  |   1 +
>   test/unittest/dtrace-util/tst.ListProbes.sh |   1 +
>   test/unittest/udp/test.x                    |   6 +-
>   24 files changed, 279 insertions(+), 90 deletions(-)
>   create mode 100644 libdtrace/dt_prov_udp.c
>
> diff --git a/dlibs/aarch64/5.11/udp.d b/dlibs/aarch64/5.11/udp.d
> index 0e44ed64..e5a0fc9b 100644
> --- a/dlibs/aarch64/5.11/udp.d
> +++ b/dlibs/aarch64/5.11/udp.d
> @@ -7,6 +7,7 @@
>   
>   #pragma D depends_on module vmlinux
>   #pragma D depends_on library net.d
> +#pragma D depends_on library ip.d
>   #pragma D depends_on provider udp
>   
>   /*
> @@ -48,24 +49,24 @@ translator udpsinfo_t < struct udp_sock *S > {
>   	 */
>   	udps_addr = (uintptr_t)S;
>   	udps_lport = arg4 ?
> -	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
> +	    (arg5 == NET_PROBE_OUTBOUND ? ntohs(((struct udphdr *)arg4)->source) :
>   	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
>   	udps_rport = arg4 ?
>   	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
>   	    ntohs(((struct udphdr *)arg4)->source)) : 0;
>   	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->saddr :
>   	    &((struct iphdr *)arg2)->daddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->saddr :
>   	    &((struct ipv6hdr *)arg2)->daddr) :
>   	    "<unknown>";
>   	udps_raddr =
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->daddr :
>   	    &((struct iphdr *)arg2)->saddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->daddr :
>   	    &((struct ipv6hdr *)arg2)->saddr) :
>   	    "<unknown>";
>   };
> diff --git a/dlibs/aarch64/5.12/udp.d b/dlibs/aarch64/5.12/udp.d
> index 0e44ed64..e5a0fc9b 100644
> --- a/dlibs/aarch64/5.12/udp.d
> +++ b/dlibs/aarch64/5.12/udp.d
> @@ -7,6 +7,7 @@
>   
>   #pragma D depends_on module vmlinux
>   #pragma D depends_on library net.d
> +#pragma D depends_on library ip.d
>   #pragma D depends_on provider udp
>   
>   /*
> @@ -48,24 +49,24 @@ translator udpsinfo_t < struct udp_sock *S > {
>   	 */
>   	udps_addr = (uintptr_t)S;
>   	udps_lport = arg4 ?
> -	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
> +	    (arg5 == NET_PROBE_OUTBOUND ? ntohs(((struct udphdr *)arg4)->source) :
>   	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
>   	udps_rport = arg4 ?
>   	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
>   	    ntohs(((struct udphdr *)arg4)->source)) : 0;
>   	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->saddr :
>   	    &((struct iphdr *)arg2)->daddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->saddr :
>   	    &((struct ipv6hdr *)arg2)->daddr) :
>   	    "<unknown>";
>   	udps_raddr =
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->daddr :
>   	    &((struct iphdr *)arg2)->saddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->daddr :
>   	    &((struct ipv6hdr *)arg2)->saddr) :
>   	    "<unknown>";
>   };
> diff --git a/dlibs/aarch64/5.14/udp.d b/dlibs/aarch64/5.14/udp.d
> index 0e44ed64..e5a0fc9b 100644
> --- a/dlibs/aarch64/5.14/udp.d
> +++ b/dlibs/aarch64/5.14/udp.d
> @@ -7,6 +7,7 @@
>   
>   #pragma D depends_on module vmlinux
>   #pragma D depends_on library net.d
> +#pragma D depends_on library ip.d
>   #pragma D depends_on provider udp
>   
>   /*
> @@ -48,24 +49,24 @@ translator udpsinfo_t < struct udp_sock *S > {
>   	 */
>   	udps_addr = (uintptr_t)S;
>   	udps_lport = arg4 ?
> -	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
> +	    (arg5 == NET_PROBE_OUTBOUND ? ntohs(((struct udphdr *)arg4)->source) :
>   	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
>   	udps_rport = arg4 ?
>   	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
>   	    ntohs(((struct udphdr *)arg4)->source)) : 0;
>   	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->saddr :
>   	    &((struct iphdr *)arg2)->daddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->saddr :
>   	    &((struct ipv6hdr *)arg2)->daddr) :
>   	    "<unknown>";
>   	udps_raddr =
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->daddr :
>   	    &((struct iphdr *)arg2)->saddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->daddr :
>   	    &((struct ipv6hdr *)arg2)->saddr) :
>   	    "<unknown>";
>   };
> diff --git a/dlibs/aarch64/5.16/udp.d b/dlibs/aarch64/5.16/udp.d
> index 0e44ed64..e5a0fc9b 100644
> --- a/dlibs/aarch64/5.16/udp.d
> +++ b/dlibs/aarch64/5.16/udp.d
> @@ -7,6 +7,7 @@
>   
>   #pragma D depends_on module vmlinux
>   #pragma D depends_on library net.d
> +#pragma D depends_on library ip.d
>   #pragma D depends_on provider udp
>   
>   /*
> @@ -48,24 +49,24 @@ translator udpsinfo_t < struct udp_sock *S > {
>   	 */
>   	udps_addr = (uintptr_t)S;
>   	udps_lport = arg4 ?
> -	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
> +	    (arg5 == NET_PROBE_OUTBOUND ? ntohs(((struct udphdr *)arg4)->source) :
>   	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
>   	udps_rport = arg4 ?
>   	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
>   	    ntohs(((struct udphdr *)arg4)->source)) : 0;
>   	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->saddr :
>   	    &((struct iphdr *)arg2)->daddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->saddr :
>   	    &((struct ipv6hdr *)arg2)->daddr) :
>   	    "<unknown>";
>   	udps_raddr =
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->daddr :
>   	    &((struct iphdr *)arg2)->saddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->daddr :
>   	    &((struct ipv6hdr *)arg2)->saddr) :
>   	    "<unknown>";
>   };
> diff --git a/dlibs/aarch64/5.2/udp.d b/dlibs/aarch64/5.2/udp.d
> index 0e44ed64..e5a0fc9b 100644
> --- a/dlibs/aarch64/5.2/udp.d
> +++ b/dlibs/aarch64/5.2/udp.d
> @@ -7,6 +7,7 @@
>   
>   #pragma D depends_on module vmlinux
>   #pragma D depends_on library net.d
> +#pragma D depends_on library ip.d
>   #pragma D depends_on provider udp
>   
>   /*
> @@ -48,24 +49,24 @@ translator udpsinfo_t < struct udp_sock *S > {
>   	 */
>   	udps_addr = (uintptr_t)S;
>   	udps_lport = arg4 ?
> -	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
> +	    (arg5 == NET_PROBE_OUTBOUND ? ntohs(((struct udphdr *)arg4)->source) :
>   	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
>   	udps_rport = arg4 ?
>   	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
>   	    ntohs(((struct udphdr *)arg4)->source)) : 0;
>   	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->saddr :
>   	    &((struct iphdr *)arg2)->daddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->saddr :
>   	    &((struct ipv6hdr *)arg2)->daddr) :
>   	    "<unknown>";
>   	udps_raddr =
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->daddr :
>   	    &((struct iphdr *)arg2)->saddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->daddr :
>   	    &((struct ipv6hdr *)arg2)->saddr) :
>   	    "<unknown>";
>   };
> diff --git a/dlibs/aarch64/5.6/udp.d b/dlibs/aarch64/5.6/udp.d
> index 0e44ed64..e5a0fc9b 100644
> --- a/dlibs/aarch64/5.6/udp.d
> +++ b/dlibs/aarch64/5.6/udp.d
> @@ -7,6 +7,7 @@
>   
>   #pragma D depends_on module vmlinux
>   #pragma D depends_on library net.d
> +#pragma D depends_on library ip.d
>   #pragma D depends_on provider udp
>   
>   /*
> @@ -48,24 +49,24 @@ translator udpsinfo_t < struct udp_sock *S > {
>   	 */
>   	udps_addr = (uintptr_t)S;
>   	udps_lport = arg4 ?
> -	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
> +	    (arg5 == NET_PROBE_OUTBOUND ? ntohs(((struct udphdr *)arg4)->source) :
>   	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
>   	udps_rport = arg4 ?
>   	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
>   	    ntohs(((struct udphdr *)arg4)->source)) : 0;
>   	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->saddr :
>   	    &((struct iphdr *)arg2)->daddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->saddr :
>   	    &((struct ipv6hdr *)arg2)->daddr) :
>   	    "<unknown>";
>   	udps_raddr =
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->daddr :
>   	    &((struct iphdr *)arg2)->saddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->daddr :
>   	    &((struct ipv6hdr *)arg2)->saddr) :
>   	    "<unknown>";
>   };
> diff --git a/dlibs/aarch64/6.1/udp.d b/dlibs/aarch64/6.1/udp.d
> index 0e44ed64..e5a0fc9b 100644
> --- a/dlibs/aarch64/6.1/udp.d
> +++ b/dlibs/aarch64/6.1/udp.d
> @@ -7,6 +7,7 @@
>   
>   #pragma D depends_on module vmlinux
>   #pragma D depends_on library net.d
> +#pragma D depends_on library ip.d
>   #pragma D depends_on provider udp
>   
>   /*
> @@ -48,24 +49,24 @@ translator udpsinfo_t < struct udp_sock *S > {
>   	 */
>   	udps_addr = (uintptr_t)S;
>   	udps_lport = arg4 ?
> -	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
> +	    (arg5 == NET_PROBE_OUTBOUND ? ntohs(((struct udphdr *)arg4)->source) :
>   	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
>   	udps_rport = arg4 ?
>   	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
>   	    ntohs(((struct udphdr *)arg4)->source)) : 0;
>   	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->saddr :
>   	    &((struct iphdr *)arg2)->daddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->saddr :
>   	    &((struct ipv6hdr *)arg2)->daddr) :
>   	    "<unknown>";
>   	udps_raddr =
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->daddr :
>   	    &((struct iphdr *)arg2)->saddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->daddr :
>   	    &((struct ipv6hdr *)arg2)->saddr) :
>   	    "<unknown>";
>   };
> diff --git a/dlibs/aarch64/6.10/udp.d b/dlibs/aarch64/6.10/udp.d
> index 0e44ed64..e5a0fc9b 100644
> --- a/dlibs/aarch64/6.10/udp.d
> +++ b/dlibs/aarch64/6.10/udp.d
> @@ -7,6 +7,7 @@
>   
>   #pragma D depends_on module vmlinux
>   #pragma D depends_on library net.d
> +#pragma D depends_on library ip.d
>   #pragma D depends_on provider udp
>   
>   /*
> @@ -48,24 +49,24 @@ translator udpsinfo_t < struct udp_sock *S > {
>   	 */
>   	udps_addr = (uintptr_t)S;
>   	udps_lport = arg4 ?
> -	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
> +	    (arg5 == NET_PROBE_OUTBOUND ? ntohs(((struct udphdr *)arg4)->source) :
>   	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
>   	udps_rport = arg4 ?
>   	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
>   	    ntohs(((struct udphdr *)arg4)->source)) : 0;
>   	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->saddr :
>   	    &((struct iphdr *)arg2)->daddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->saddr :
>   	    &((struct ipv6hdr *)arg2)->daddr) :
>   	    "<unknown>";
>   	udps_raddr =
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->daddr :
>   	    &((struct iphdr *)arg2)->saddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->daddr :
>   	    &((struct ipv6hdr *)arg2)->saddr) :
>   	    "<unknown>";
>   };
> diff --git a/dlibs/x86_64/5.11/udp.d b/dlibs/x86_64/5.11/udp.d
> index 0e44ed64..e5a0fc9b 100644
> --- a/dlibs/x86_64/5.11/udp.d
> +++ b/dlibs/x86_64/5.11/udp.d
> @@ -7,6 +7,7 @@
>   
>   #pragma D depends_on module vmlinux
>   #pragma D depends_on library net.d
> +#pragma D depends_on library ip.d
>   #pragma D depends_on provider udp
>   
>   /*
> @@ -48,24 +49,24 @@ translator udpsinfo_t < struct udp_sock *S > {
>   	 */
>   	udps_addr = (uintptr_t)S;
>   	udps_lport = arg4 ?
> -	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
> +	    (arg5 == NET_PROBE_OUTBOUND ? ntohs(((struct udphdr *)arg4)->source) :
>   	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
>   	udps_rport = arg4 ?
>   	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
>   	    ntohs(((struct udphdr *)arg4)->source)) : 0;
>   	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->saddr :
>   	    &((struct iphdr *)arg2)->daddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->saddr :
>   	    &((struct ipv6hdr *)arg2)->daddr) :
>   	    "<unknown>";
>   	udps_raddr =
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->daddr :
>   	    &((struct iphdr *)arg2)->saddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->daddr :
>   	    &((struct ipv6hdr *)arg2)->saddr) :
>   	    "<unknown>";
>   };
> diff --git a/dlibs/x86_64/5.12/udp.d b/dlibs/x86_64/5.12/udp.d
> index 0e44ed64..e5a0fc9b 100644
> --- a/dlibs/x86_64/5.12/udp.d
> +++ b/dlibs/x86_64/5.12/udp.d
> @@ -7,6 +7,7 @@
>   
>   #pragma D depends_on module vmlinux
>   #pragma D depends_on library net.d
> +#pragma D depends_on library ip.d
>   #pragma D depends_on provider udp
>   
>   /*
> @@ -48,24 +49,24 @@ translator udpsinfo_t < struct udp_sock *S > {
>   	 */
>   	udps_addr = (uintptr_t)S;
>   	udps_lport = arg4 ?
> -	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
> +	    (arg5 == NET_PROBE_OUTBOUND ? ntohs(((struct udphdr *)arg4)->source) :
>   	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
>   	udps_rport = arg4 ?
>   	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
>   	    ntohs(((struct udphdr *)arg4)->source)) : 0;
>   	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->saddr :
>   	    &((struct iphdr *)arg2)->daddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->saddr :
>   	    &((struct ipv6hdr *)arg2)->daddr) :
>   	    "<unknown>";
>   	udps_raddr =
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->daddr :
>   	    &((struct iphdr *)arg2)->saddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->daddr :
>   	    &((struct ipv6hdr *)arg2)->saddr) :
>   	    "<unknown>";
>   };
> diff --git a/dlibs/x86_64/5.14/udp.d b/dlibs/x86_64/5.14/udp.d
> index 0e44ed64..e5a0fc9b 100644
> --- a/dlibs/x86_64/5.14/udp.d
> +++ b/dlibs/x86_64/5.14/udp.d
> @@ -7,6 +7,7 @@
>   
>   #pragma D depends_on module vmlinux
>   #pragma D depends_on library net.d
> +#pragma D depends_on library ip.d
>   #pragma D depends_on provider udp
>   
>   /*
> @@ -48,24 +49,24 @@ translator udpsinfo_t < struct udp_sock *S > {
>   	 */
>   	udps_addr = (uintptr_t)S;
>   	udps_lport = arg4 ?
> -	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
> +	    (arg5 == NET_PROBE_OUTBOUND ? ntohs(((struct udphdr *)arg4)->source) :
>   	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
>   	udps_rport = arg4 ?
>   	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
>   	    ntohs(((struct udphdr *)arg4)->source)) : 0;
>   	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->saddr :
>   	    &((struct iphdr *)arg2)->daddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->saddr :
>   	    &((struct ipv6hdr *)arg2)->daddr) :
>   	    "<unknown>";
>   	udps_raddr =
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->daddr :
>   	    &((struct iphdr *)arg2)->saddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->daddr :
>   	    &((struct ipv6hdr *)arg2)->saddr) :
>   	    "<unknown>";
>   };
> diff --git a/dlibs/x86_64/5.16/udp.d b/dlibs/x86_64/5.16/udp.d
> index 0e44ed64..e5a0fc9b 100644
> --- a/dlibs/x86_64/5.16/udp.d
> +++ b/dlibs/x86_64/5.16/udp.d
> @@ -7,6 +7,7 @@
>   
>   #pragma D depends_on module vmlinux
>   #pragma D depends_on library net.d
> +#pragma D depends_on library ip.d
>   #pragma D depends_on provider udp
>   
>   /*
> @@ -48,24 +49,24 @@ translator udpsinfo_t < struct udp_sock *S > {
>   	 */
>   	udps_addr = (uintptr_t)S;
>   	udps_lport = arg4 ?
> -	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
> +	    (arg5 == NET_PROBE_OUTBOUND ? ntohs(((struct udphdr *)arg4)->source) :
>   	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
>   	udps_rport = arg4 ?
>   	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
>   	    ntohs(((struct udphdr *)arg4)->source)) : 0;
>   	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->saddr :
>   	    &((struct iphdr *)arg2)->daddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->saddr :
>   	    &((struct ipv6hdr *)arg2)->daddr) :
>   	    "<unknown>";
>   	udps_raddr =
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->daddr :
>   	    &((struct iphdr *)arg2)->saddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->daddr :
>   	    &((struct ipv6hdr *)arg2)->saddr) :
>   	    "<unknown>";
>   };
> diff --git a/dlibs/x86_64/5.2/udp.d b/dlibs/x86_64/5.2/udp.d
> index 0e44ed64..e5a0fc9b 100644
> --- a/dlibs/x86_64/5.2/udp.d
> +++ b/dlibs/x86_64/5.2/udp.d
> @@ -7,6 +7,7 @@
>   
>   #pragma D depends_on module vmlinux
>   #pragma D depends_on library net.d
> +#pragma D depends_on library ip.d
>   #pragma D depends_on provider udp
>   
>   /*
> @@ -48,24 +49,24 @@ translator udpsinfo_t < struct udp_sock *S > {
>   	 */
>   	udps_addr = (uintptr_t)S;
>   	udps_lport = arg4 ?
> -	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
> +	    (arg5 == NET_PROBE_OUTBOUND ? ntohs(((struct udphdr *)arg4)->source) :
>   	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
>   	udps_rport = arg4 ?
>   	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
>   	    ntohs(((struct udphdr *)arg4)->source)) : 0;
>   	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->saddr :
>   	    &((struct iphdr *)arg2)->daddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->saddr :
>   	    &((struct ipv6hdr *)arg2)->daddr) :
>   	    "<unknown>";
>   	udps_raddr =
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->daddr :
>   	    &((struct iphdr *)arg2)->saddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->daddr :
>   	    &((struct ipv6hdr *)arg2)->saddr) :
>   	    "<unknown>";
>   };
> diff --git a/dlibs/x86_64/5.6/udp.d b/dlibs/x86_64/5.6/udp.d
> index 0e44ed64..e5a0fc9b 100644
> --- a/dlibs/x86_64/5.6/udp.d
> +++ b/dlibs/x86_64/5.6/udp.d
> @@ -7,6 +7,7 @@
>   
>   #pragma D depends_on module vmlinux
>   #pragma D depends_on library net.d
> +#pragma D depends_on library ip.d
>   #pragma D depends_on provider udp
>   
>   /*
> @@ -48,24 +49,24 @@ translator udpsinfo_t < struct udp_sock *S > {
>   	 */
>   	udps_addr = (uintptr_t)S;
>   	udps_lport = arg4 ?
> -	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
> +	    (arg5 == NET_PROBE_OUTBOUND ? ntohs(((struct udphdr *)arg4)->source) :
>   	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
>   	udps_rport = arg4 ?
>   	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
>   	    ntohs(((struct udphdr *)arg4)->source)) : 0;
>   	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->saddr :
>   	    &((struct iphdr *)arg2)->daddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->saddr :
>   	    &((struct ipv6hdr *)arg2)->daddr) :
>   	    "<unknown>";
>   	udps_raddr =
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->daddr :
>   	    &((struct iphdr *)arg2)->saddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->daddr :
>   	    &((struct ipv6hdr *)arg2)->saddr) :
>   	    "<unknown>";
>   };
> diff --git a/dlibs/x86_64/6.1/udp.d b/dlibs/x86_64/6.1/udp.d
> index 0e44ed64..e5a0fc9b 100644
> --- a/dlibs/x86_64/6.1/udp.d
> +++ b/dlibs/x86_64/6.1/udp.d
> @@ -7,6 +7,7 @@
>   
>   #pragma D depends_on module vmlinux
>   #pragma D depends_on library net.d
> +#pragma D depends_on library ip.d
>   #pragma D depends_on provider udp
>   
>   /*
> @@ -48,24 +49,24 @@ translator udpsinfo_t < struct udp_sock *S > {
>   	 */
>   	udps_addr = (uintptr_t)S;
>   	udps_lport = arg4 ?
> -	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
> +	    (arg5 == NET_PROBE_OUTBOUND ? ntohs(((struct udphdr *)arg4)->source) :
>   	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
>   	udps_rport = arg4 ?
>   	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
>   	    ntohs(((struct udphdr *)arg4)->source)) : 0;
>   	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->saddr :
>   	    &((struct iphdr *)arg2)->daddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->saddr :
>   	    &((struct ipv6hdr *)arg2)->daddr) :
>   	    "<unknown>";
>   	udps_raddr =
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->daddr :
>   	    &((struct iphdr *)arg2)->saddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->daddr :
>   	    &((struct ipv6hdr *)arg2)->saddr) :
>   	    "<unknown>";
>   };
> diff --git a/dlibs/x86_64/6.10/udp.d b/dlibs/x86_64/6.10/udp.d
> index 0e44ed64..e5a0fc9b 100644
> --- a/dlibs/x86_64/6.10/udp.d
> +++ b/dlibs/x86_64/6.10/udp.d
> @@ -7,6 +7,7 @@
>   
>   #pragma D depends_on module vmlinux
>   #pragma D depends_on library net.d
> +#pragma D depends_on library ip.d
>   #pragma D depends_on provider udp
>   
>   /*
> @@ -48,24 +49,24 @@ translator udpsinfo_t < struct udp_sock *S > {
>   	 */
>   	udps_addr = (uintptr_t)S;
>   	udps_lport = arg4 ?
> -	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
> +	    (arg5 == NET_PROBE_OUTBOUND ? ntohs(((struct udphdr *)arg4)->source) :
>   	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
>   	udps_rport = arg4 ?
>   	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
>   	    ntohs(((struct udphdr *)arg4)->source)) : 0;
>   	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->saddr :
>   	    &((struct iphdr *)arg2)->daddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->saddr :
>   	    &((struct ipv6hdr *)arg2)->daddr) :
>   	    "<unknown>";
>   	udps_raddr =
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->daddr :
>   	    &((struct iphdr *)arg2)->saddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->daddr :
>   	    &((struct ipv6hdr *)arg2)->saddr) :
>   	    "<unknown>";
>   };
> diff --git a/libdtrace/Build b/libdtrace/Build
> index 3540d1c1..722f787d 100644
> --- a/libdtrace/Build
> +++ b/libdtrace/Build
> @@ -59,6 +59,7 @@ libdtrace-build_SOURCES = dt_aggregate.c \
>   			  dt_prov_sdt.c \
>   			  dt_prov_syscall.c \
>   			  dt_prov_tcp.c \
> +			  dt_prov_udp.c \
>   			  dt_prov_uprobe.c \
>   			  dt_provider.c \
>   			  dt_provider_sdt.c \
> @@ -120,6 +121,7 @@ dt_prov_sched.c_CFLAGS := -Wno-pedantic
>   dt_prov_sdt.c_CFLAGS := -Wno-pedantic
>   dt_prov_syscall.c_CFLAGS := -Wno-pedantic
>   dt_prov_tcp.c_CFLAGS := -Wno-pedantic
> +dt_prov_udp.c_CFLAGS := -Wno-pedantic
>   dt_prov_uprobe.c_CFLAGS := -Wno-pedantic
>   dt_debug.c_CFLAGS := -Wno-prio-ctor-dtor
>   
> diff --git a/libdtrace/dt_prov_udp.c b/libdtrace/dt_prov_udp.c
> new file mode 100644
> index 00000000..33a975a5
> --- /dev/null
> +++ b/libdtrace/dt_prov_udp.c
> @@ -0,0 +1,170 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + *
> + * The 'udp' SDT provider for DTrace-specific probes.
> + */
> +#include <assert.h>
> +#include <errno.h>
> +#include <netinet/in.h>
> +
> +#include "dt_dctx.h"
> +#include "dt_cg.h"
> +#include "dt_provider_sdt.h"
> +#include "dt_probe.h"
> +
> +static const char		prvname[] = "udp";
> +static const char		modname[] = "vmlinux";
> +
> +enum {
> +	NET_PROBE_OUTBOUND = 0,
> +	NET_PROBE_INBOUND,
> +};
> +
> +static probe_dep_t	probes[] = {
> +	{ "receive",
> +	  DTRACE_PROBESPEC_NAME,	"rawfbt::udp_queue_rcv_skb:entry" },
> +	{ "receive",
> +	  DTRACE_PROBESPEC_NAME,	"rawfbt::udpv6_queue_rcv_skb:entry" },
> +	{ "send",
> +	  DTRACE_PROBESPEC_NAME,	"rawfbt::ip_send_skb:entry" },
> +	{ "send",
> +	  DTRACE_PROBESPEC_NAME,	"rawfbt::ip6_send_skb:entry" },
> +	{ NULL, }
> +};
> +
> +static probe_arg_t probe_args[] = {
> +
> +	{ "receive", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
> +	{ "receive", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
> +	{ "receive", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
> +	{ "receive", 3, { 3, 0, "struct udp_sock *", "udpsinfo_t *" } },
> +	{ "receive", 4, { 4, 0, "struct udphdr *", "udpinfo_t *" } },
> +
> +	{ "send", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
> +	{ "send", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
> +	{ "send", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
> +	{ "send", 3, { 3, 0, "struct udp_sock *", "udpsinfo_t *" } },
> +	{ "send", 4, { 4, 0, "struct udphdr *", "udpinfo_t *" } },
> +
> +	{ NULL, }
> +};
> +
> +static const dtrace_pattr_t	pattr = {
> +{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
> +{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> +{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> +{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
> +{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
> +};
> +
> +/*
> + * Provide all the "udp" SDT probes.
> + */
> +static int populate(dtrace_hdl_t *dtp)
> +{
> +	return dt_sdt_populate(dtp, prvname, modname, &dt_udp, &pattr,
> +			       probe_args, probes);
> +}
> +
> +/*
> + * Generate a BPF trampoline for a SDT probe.
> + *
> + * The trampoline function is called when a SDT probe triggers, and it must
> + * satisfy the following prototype:
> + *
> + *	int dt_udp(void *data)
> + *
> + * The trampoline will populate a dt_dctx_t struct and then call the function
> + * that implements the compiled D clause.  It returns the value that it gets
> + * back from that function.
> + */
> +static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> +{
> +	dt_irlist_t	*dlp = &pcb->pcb_ir;
> +	dt_probe_t	*prp = pcb->pcb_probe;
> +	dt_probe_t	*uprp = pcb->pcb_parent_probe;
> +	int		skbarg = 1;
> +	int		direction;
> +
> +	/*
> +	 * We construct the udp::: probe arguments as follows:
> +	 *      arg0 = skb
> +	 *      arg1 = sk
> +	 *      arg2 = ip_hdr(skb) [if available]
> +	 *      arg3 = sk [struct udp_sock *]
> +	 *      arg4 = udp_hdr(skb)
> +	 *      arg5 = NET_PROBE_INBOUND (0x1) | NET_PROBE_OUTBOUND (0x0)
> +	 * arg5 never makes it into supported args[], it is simply set to
> +	 * help inform translators about whether it is an inbound/outbound probe
> +	 */
> +
> +	if (strcmp(prp->desc->prb, "receive") == 0) {
> +		direction = NET_PROBE_INBOUND;
> +		/* get sk from arg0, store in arg3 */
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(0)));
> +		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_6));
> +	} else {
> +		if (strcmp(uprp->desc->fun, "ip6_send_skb") == 0)
> +			skbarg = 0;
> +		direction = NET_PROBE_OUTBOUND;
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skbarg)));
> +		/* get sk from skb->sk, store in arg3 */
> +		dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "sk");
> +		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_0));
> +	}
> +
> +	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skbarg)));
> +	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
> +
> +	/* Now get sk from arg3, store it in arg1 and ensure it is UDP */
> +	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(3)));
> +	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
> +	dt_cg_tramp_get_member(pcb, "struct sock", BPF_REG_6,
> +			       "sk_protocol");
> +	emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, IPPROTO_UDP, exitlbl));
> +
> +	/*
> +	 * ip_hdr(skb) =
> +	 *	skb_network_header(skb)	=	(include/linux/ip.h)
> +	 *	skb->head + skb->network_header	(include/linux/skbuff.h)
> +	 */
> +	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(0)));
> +	dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
> +	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
> +
> +	dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
> +			       "network_header");
> +	emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
> +
> +	/*
> +	 * udp_hdr(skb) =
> +	 *	skb_transport_header(skb) =		(include/linux/ip.h)
> +	 *	skb->head + skb->transport_header	(include/linux/skbuff.h)
> +	 */
> +	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(0)));
> +	dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
> +	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
> +	dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
> +			       "transport_header");
> +	emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
> +
> +	emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(5), direction));
> +
> +	return 0;
> +}
> +
> +dt_provimpl_t	dt_udp = {
> +	.name		= prvname,
> +	.prog_type	= BPF_PROG_TYPE_UNSPEC,
> +	.populate	= &populate,
> +	.enable		= &dt_sdt_enable,
> +	.load_prog	= &dt_bpf_prog_load,
> +	.trampoline	= &trampoline,
> +	.probe_info	= &dt_sdt_probe_info,
> +	.destroy	= &dt_sdt_destroy,
> +};
> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
> index b9a7196b..848fdc13 100644
> --- a/libdtrace/dt_provider.c
> +++ b/libdtrace/dt_provider.c
> @@ -41,6 +41,7 @@ const dt_provimpl_t *dt_providers[] = {
>   	&dt_sdt,
>   	&dt_syscall,
>   	&dt_tcp,
> +	&dt_udp,
>   	&dt_uprobe,
>   	&dt_usdt,
>   	NULL
> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> index 9d60e5ec..dc126671 100644
> --- a/libdtrace/dt_provider.h
> +++ b/libdtrace/dt_provider.h
> @@ -89,6 +89,7 @@ extern dt_provimpl_t dt_sched;
>   extern dt_provimpl_t dt_sdt;
>   extern dt_provimpl_t dt_syscall;
>   extern dt_provimpl_t dt_tcp;
> +extern dt_provimpl_t dt_udp;
>   extern dt_provimpl_t dt_uprobe;
>   extern dt_provimpl_t dt_usdt;
>   
> diff --git a/libdtrace/udp.d b/libdtrace/udp.d
> index 0e44ed64..e5a0fc9b 100644
> --- a/libdtrace/udp.d
> +++ b/libdtrace/udp.d
> @@ -7,6 +7,7 @@
>   
>   #pragma D depends_on module vmlinux
>   #pragma D depends_on library net.d
> +#pragma D depends_on library ip.d
>   #pragma D depends_on provider udp
>   
>   /*
> @@ -48,24 +49,24 @@ translator udpsinfo_t < struct udp_sock *S > {
>   	 */
>   	udps_addr = (uintptr_t)S;
>   	udps_lport = arg4 ?
> -	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
> +	    (arg5 == NET_PROBE_OUTBOUND ? ntohs(((struct udphdr *)arg4)->source) :
>   	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
>   	udps_rport = arg4 ?
>   	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
>   	    ntohs(((struct udphdr *)arg4)->source)) : 0;
>   	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->saddr :
>   	    &((struct iphdr *)arg2)->daddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->saddr :
>   	    &((struct ipv6hdr *)arg2)->daddr) :
>   	    "<unknown>";
>   	udps_raddr =
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
> -            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
> +            inet_ntoa(arg5 == NET_PROBE_OUTBOUND ? &((struct iphdr *)arg2)->daddr :
>   	    &((struct iphdr *)arg2)->saddr) :
>   	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
> -	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
> +	    inet_ntoa6(arg5 == NET_PROBE_OUTBOUND ? &((struct ipv6hdr *)arg2)->daddr :
>   	    &((struct ipv6hdr *)arg2)->saddr) :
>   	    "<unknown>";
>   };
> diff --git a/test/unittest/dtrace-util/tst.ListProbes.r b/test/unittest/dtrace-util/tst.ListProbes.r
> index ad557253..a1e185d4 100644
> --- a/test/unittest/dtrace-util/tst.ListProbes.r
> +++ b/test/unittest/dtrace-util/tst.ListProbes.r
> @@ -12,3 +12,4 @@ sched
>   sdt
>   syscall
>   tcp
> +udp
> diff --git a/test/unittest/dtrace-util/tst.ListProbes.sh b/test/unittest/dtrace-util/tst.ListProbes.sh
> index a747a045..744bb8ad 100755
> --- a/test/unittest/dtrace-util/tst.ListProbes.sh
> +++ b/test/unittest/dtrace-util/tst.ListProbes.sh
> @@ -70,6 +70,7 @@ $dtrace $dt_flags -l \
>       $2 == "sdt"      { mycheck($2, $1,   600,   6000); next }
>       $2 == "syscall"  { mycheck($2, $1,   300,   3000); next }
>       $2 == "tcp"      { mycheck($2, $1,     8,      8); next }
> +    $2 == "udp"      { mycheck($2, $1,     2,      2); next }	
>       # nothing for usdt
>   
>       # Unrecognized line.
> diff --git a/test/unittest/udp/test.x b/test/unittest/udp/test.x
> index d3d7a598..2ff8d675 100755
> --- a/test/unittest/udp/test.x
> +++ b/test/unittest/udp/test.x
> @@ -1,14 +1,10 @@
>   #!/bin/bash
>   #
>   # Oracle Linux DTrace.
> -# Copyright (c) 2017, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2017, 2025 Oracle and/or its affiliates. All rights reserved.
>   # Licensed under the Universal Permissive License v 1.0 as shown at
>   # http://oss.oracle.com/licenses/upl.
>   
> -if ! check_provider udp; then
> -        echo "Could not load udp provider"
> -        exit 1
> -fi
>   if ! perl -MIO::Socket::IP -e 'exit(0);' 2>/dev/null; then
>   	exit 1
>   fi
