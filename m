Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F281E495
	for <dtrace@lists.linux.dev>; Fri,  7 Jun 2024 21:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717796460; cv=fail; b=Rm5fkeNKwPEe4ynY0GK7eodQBmvybBijtM9Wwuc1AHovAERNhz2/dnt8bMvYDa7Nu4O7rDt3yQjolonbYK6jD/Xze5jcHGxRiZ2uDYsXneb1inDBm2zbikQo75NFuHfW3EB5ptpbJmMWhjvil5mg4k0WGpom5fO4Y6GTgruzgRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717796460; c=relaxed/simple;
	bh=mdJY645vSwxPc/6pu5vpbpDzKJX9kYBmq45Rlu1v1iI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=a5Lr3UTJDGda+UHbQ3nxiwASmd8e5xmt2qo4v+mIcsley7TlReItWV4ZLBbrskQoOYxV5jLfEmRgq2WYegrI4O0d4/35LE5Je4/nMGJvvBp+Z7MNCdx+NONVDPvaxW/MAQAfZoWyubivCKXdNvXEt5xQuEE/t3B7sHCWmQFpZv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kPt6anE7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=I+lIB5l8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kPt6anE7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="I+lIB5l8"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 457CuUk2023572
	for <dtrace@lists.linux.dev>; Fri, 7 Jun 2024 21:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=vvyjF24Te33Xms1JU3x29KuA9SF+yFjBHEAWKaRn/uQ=;
 b=kPt6anE7W8kHGrfqsNbCMlr3fWyp7ZUEdfwqnjJnZYCmtfalBl9B0/ZKWCMQR5vlq23O
 G9lzDx+n0VGymOwqgZA+xy5YGNA0Qhzkefhewl0cBnwsaL5otEOlUlniTlaLWq1qXYiT
 EVBN0XxJPcy7skxGZnzAzDOYVCNVizWBHgLsw5YW91BVVpC5OY1fP0HqLN70RgSsKNaQ
 jOkkchUzLIprsKYAI/20Wb2wUOg9WquTJbba3rH6YmkOktb6Dh2LKcQiKlIivNIof0tc
 hJK+2FGbzxq5k0N4zVY7YTiGIqrc9OKQQLn9v2osLoqF08GkBV358fm6fGexekZ1ZSe1 pg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbrsecuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Jun 2024 21:40:57 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 457LTP1G016176
	for <dtrace@lists.linux.dev>; Fri, 7 Jun 2024 21:40:56 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrsf0shp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Jun 2024 21:40:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4g9/2XvZbmXUO+zKUID3SmEuk23H/hYA2tpCYAqMU/O7D2+uE9uyKbdgpGURfH6NAZHILTbE1NsXG36+0+Kqudsj1db/96OiLkkXwb51TfZR9TAbCA+n95N7vc7pu03fzZdrrMukzhfdayntE/MqQOCO/6c7n1XeKx5IRRzQlWOHfEab4S2o1CFWw2/R4I23os46EDGHVyMOJEiQk5IKd6+0uPEXx9ZxEIh5nnnGRnKPXwetWQgD4AQldGLZQ70uGY/nuwz6PUiKa09Kd5fAwqZUuYCCkoFKN/ZNb17vCLhzk+G5Btu0XHYozpCvNHfS56CCowanRvybWxs6PPs2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvyjF24Te33Xms1JU3x29KuA9SF+yFjBHEAWKaRn/uQ=;
 b=iRGr1fr/jUZZAcngxDy0rPZRPeBKLtnFbBX3pvFMhaKoxPT6QzWs5k3umitKbAaw+g7aymr+i+8z1feBk+IV+wbvetGHmJU5TqHh50MaHGRXJzYpryCUGk5y247VXjvvh87zjIA5D6h6oyVF8wQiUgkUbGi8KywycOuvrhFo052pkNHUr2oQ7ui5ByEcDlupTn9KID/nJuzpfNiJbJivK9+ZdlvrwH5WCt/dEI+tcp5MQVQN0UjKBivA08TdrtBxJQXmSOaliZnWlKXM3u89ng+TLzIn7Va38xnmBVt+O5jeLeiywB5c+cmZRXWD4vQqPLlGLZkRZEUQwdq5q94QDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvyjF24Te33Xms1JU3x29KuA9SF+yFjBHEAWKaRn/uQ=;
 b=I+lIB5l8q4aHL5vW02o8hbkLLL5sIfjrSQJhZIG3N0GplaZR7zftPZrbBtOLXab4KET+0uB6RKp08l/44E2zIgI+a36PtzIwzXbTKNYWiQ3yaDeapQGdCSTuGaGECn8UBvoRXon7wr2ViXNFtjEL2aRU2pbEQKkbjgibTn7aP9g=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW5PR10MB5740.namprd10.prod.outlook.com (2603:10b6:303:19a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Fri, 7 Jun
 2024 21:40:54 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.032; Fri, 7 Jun 2024
 21:40:54 +0000
Message-ID: <c1d70ac8-ee5f-4b1d-9e8c-75075b18db48@oracle.com>
Date: Fri, 7 Jun 2024 17:40:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 04/14] Track uprobe provider descriptions
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240604181113.11505-1-eugene.loh@oracle.com>
 <20240604181113.11505-5-eugene.loh@oracle.com> <Zl+CwFHv6bSJTNHw@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zl+CwFHv6bSJTNHw@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:208:160::45) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW5PR10MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e07f7e5-646e-495b-f44f-08dc873a8251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bjlKYVZsVStGRFZxQWdvb1pxL0gyNW1oRFNoUGcySjNsckhGUmZ6MWJpV05Z?=
 =?utf-8?B?OUhzUUtkUGc4QzhQK0lZQ1BDTEZYTkppT0hic3JjdWlmU0pFaVdDUEQ1WVJR?=
 =?utf-8?B?aHlUcnRmYlc5YnQ5KzgyQ2VoUGpiTWdKbGhWWFE5RTJzVndlQnJHb2xpSWRJ?=
 =?utf-8?B?RXdqUGpuSHlRQ3FPSVc3T1Zpemc4Y1FQemhIS0w5NEV0ODliWG91NDV6Z0Q1?=
 =?utf-8?B?VkZYSElHWVNqdm0rVEEzMk84aFQvOEUxODZxTFNhV0FFN2ZWanliemphaWZ1?=
 =?utf-8?B?ZGNubkM0d05sRDNIOEozNUtBalg1Q2FtemVPTDJCbWVKRndVRkRrRW13TzBZ?=
 =?utf-8?B?ODc2SnFEK2prYktaYVJyaStONXBTcHJMZ2ZRV0pmdDJiNjE4WVhoTGZJWlVC?=
 =?utf-8?B?d0g1bVpWZlphM2tGSVRBakQ5OHYxcDBncmp5aEJBREQvSlZIU2ZTM1JLUW5l?=
 =?utf-8?B?L2Nub2VHZ2pwTGpxdmRWaGJnOTVpT1dzSUVEZ2pwRVBBcjlsYzd1Q1d4L1Yv?=
 =?utf-8?B?cFdac0h2Vzh0c0xwd1FWMWZJRXI2TmJLckxzSmFQL3lMVk43WmZuSEI5bUxU?=
 =?utf-8?B?OWovNUNXWE1QK1V5MDNzYWRGL0lSREcvZ21KRGlvNEUva285TXU0UW9zUEN4?=
 =?utf-8?B?Wnc1TDllOEloSzB5U2I2c3JoOFd5M2lNbDJhK3p0cWNLdjk1bzk5UmNnTml5?=
 =?utf-8?B?YkhCWHVsSHJoSlNnMXlKOGM3YytXM3o0alc0QXRVRS9QVmxSblVjbzNyMnJv?=
 =?utf-8?B?dEp4ajBCcFYwU3dLdlhocUp5Z0FHQUxwZE8zTnNHeDFZTHFvZ2ppcWVhdG9D?=
 =?utf-8?B?ajhsUDVyczY4UFA0NmQ2QU9EUW1ad0U0WlYrVFNCZkU2WGFJUHNCeWYvOERG?=
 =?utf-8?B?cGZIK0tUM2x5aDFVSC92cVRRL1poUXp5VXZRSFBnM0xrL054QlhvZVFGL3VK?=
 =?utf-8?B?YWR0L1JOSEpSWDhkT1FSUE9KZmxzTml5OE5uZEhTNllrZTZHUmN0ZGw0emlU?=
 =?utf-8?B?ZEVYUWtJeGQ2REpUZzVmaFMyeFVuWWpFcFVUcFF3MmZyMTlkY0ovZE1hQlNo?=
 =?utf-8?B?WEF2SnIwbkl2NWErdTlOOE9aZVMxRitmbWg0Uk9VWmZGSDRCZDRRNXBZRkVP?=
 =?utf-8?B?L1BGZnAzMWZmSVpxQWl0aEtiQ2FLcXlXZXNRL01BSzlqQWlnOXBmdjJtT1dZ?=
 =?utf-8?B?UjdNeHNxRmFrcVBwUXVraklXMk0xdnVWQUFLWDJmZE5nODhib1RGNWlDajFD?=
 =?utf-8?B?Yy84QWF0M2dFNEFkYXR2eGpNM0VyQzROQlFtMk9MVG1FSXAxZnIyNHBQOWJH?=
 =?utf-8?B?Q2RwWGdPUzQwOWt1YXRqajdubVgrK21WWEdlcmVXZTdVV1NTWnFtWWlIWW9R?=
 =?utf-8?B?V2JFN3YvV1ZRU3RaMy9RdXMwa2MvQlo5eG56NVozV0FLZW5qMlFrUU40Z2FD?=
 =?utf-8?B?aWNIaVBSRnZ4dEhjL0xYZzRmOEs5WWMyYnI4am9peDJaSWVKNytDMng0V0xP?=
 =?utf-8?B?M0ZLSFlJQTlmTGVFeVhaQ3BFeDl4S1hBVWZJOGNianVzaHpnb280bVVYU09h?=
 =?utf-8?B?N1lrZUtXYnpKUGVKNkNqbkdWN01NTVhwempZWlBqMlFpdHZFYkw1RzZLTmhG?=
 =?utf-8?B?Y0wrUStGK1YxNWVSZkt4R2VuQ3JyR1lSSHVYMW1zRmc3L1JQNFBjcENGUmhX?=
 =?utf-8?B?UEJReU8rQmh1aTREaW5BRjVPQk1jTTN1bXhNS2VBN2U0THJ6eWJUZjdpL2li?=
 =?utf-8?Q?lhldBBqp3xenEWAerx4dKBzqI/7Mbr9NVXjB8gc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WUIrSmxMcmJBdnV2NTVFQVZFRmFJaGVQb3k1VGNwSG5Jb1lrMU9MdVNEM2tC?=
 =?utf-8?B?bFpTdGdKSk5kZFZuV0dtNGxBbGVzdEFlenJoLzRMTUdmN3ZrdUVXNy9DVFJ6?=
 =?utf-8?B?OGdGdE0zd0JRVXJFTVRnK1VqOUlRS3ZIbVplSG9rcVdNMVI4U0pzTGpCNW54?=
 =?utf-8?B?Z3g5cGZmOVFiZGZKN21SaTNjVnlIQXNQSDlWUVdva1FEa01DemR1MC9FNWFu?=
 =?utf-8?B?MnZWcW5adERZVGJ6ZHR0bXdBbEpKNFZyRjMrNERVMmUxUVN0ZS9RVytBVys5?=
 =?utf-8?B?dmN0U0FBM0FvdEU4OS84WSs0bVhJdXJJd0p4TEszYW8xNHhQbE5haDMwVXRK?=
 =?utf-8?B?RStOOS9UMDlKWWdNQzUrSmZ2REtKUVlBL25UODVFenRFUThnMzR4dnNyVzhP?=
 =?utf-8?B?ZFFnZGxTQTlid09iZFJubHpQa3VZV1gxWkx6NTc0U2FKc1M4cjlGYVE3NTBG?=
 =?utf-8?B?RzJqTy9NNWhLRWsyQUtOdjRUdXg2dExpdjU2eDJzU3k4SGVYM2J3NmJWYW1n?=
 =?utf-8?B?YmpJSDBETXBGdzd3NUsza0ZWdWowWEN3anY2MHNseWJCN0ROUEpHMmt2amVY?=
 =?utf-8?B?OFpWdGV0cUh2U2pFdkFxdDFSY2Z6Sk8wUVNuNkx1MU9qNDdxbkNkckZkc0t3?=
 =?utf-8?B?UXVxMmU5QUVyQnI5aVBta2dpcUVtR3hTRXZNOFZaNFNxSHBMaWg1RGlRL25N?=
 =?utf-8?B?c0VVMUdSdWhCTG5BekJFMXRLR3FKNVNaT3V0akVKNG1hcGtkQ3lJZHlXdTY1?=
 =?utf-8?B?QjRGNDBOWDJHNExsQTZreTNRQ2c1U2VaeVYwQ2pLTU1rNzBqbW95QUd5bjBk?=
 =?utf-8?B?cFRvS0dKdEtiQmtBZ2owd2Fnb0NEQ3ZTQXlGUUx0RjByanNKMURtN2R3VlNS?=
 =?utf-8?B?MFZrV3RWR0c2cWc5azNsK1NuQkpmZXdvcXcvcEFwWWQvQkJKSm9YK0g2V0gz?=
 =?utf-8?B?cjlUYXZjdDJVZ280R2FqQkwyOTN2elN3NUt1WXlNTGtBd1BuemdXMlF0MlVl?=
 =?utf-8?B?U0MzUWd2T3JHaXVRcytQdE5vWCtheUdyRHJVNFIzWXVRSHZ1ekQyd2JDM0Zn?=
 =?utf-8?B?UWhBbXBDbkUreXRseXJ4cFpwRjJyWHZmY1dNNHN3cE5tdWtMaFFqZWtZczU1?=
 =?utf-8?B?ZWZBYUxIblRUd2ZicWZxQ2lZK0paR3JJaDFlOXJpcVMwNGs1d2ZGaC9ZUGs4?=
 =?utf-8?B?U0w3VjNqL3Q1RWVaemY4WTNEcGF3bm9PK0NpbDcyOWhMYVdFVFBnTjMyNlEy?=
 =?utf-8?B?QmUyTW9qNWFGLzJrcnJKcFlqNWdDT1VGSjJNczZZWEdGN05heFhNSXNBdTRN?=
 =?utf-8?B?WFRpMVpBSUlQSHJUai83eDlNV0NGOUFDZE1kc1VKaUxaN0txUzhsT2R3YUk3?=
 =?utf-8?B?Um0rN1pITnhxZ3NQSVh6ZWdYL05EeWlzc21nZVRMSnFKZ3o4L3NIRGsrdTFC?=
 =?utf-8?B?ZUJEUFJ5RExmcEZlbk4xNysxTDJFUVdNR0VyNGFXQVhTMTJGbUxVMVkzNjdP?=
 =?utf-8?B?amlZSU8rR3NLS1hVZVRzZzJHOUVmMnNOQ2grR1pNc0crankrT0xRdWJDWGNK?=
 =?utf-8?B?d1c3KzBEOTNSVXZ6TEZUcWtpNHBZcCs1cC91YmhqNm1zYTE0MSt6LzdlL0JL?=
 =?utf-8?B?Syt1YTdvblJLWjM1WWpoMEFxUkVMZ2NhbzNONXhVZlNNMzNsZHlmMEdjM29j?=
 =?utf-8?B?TzVjZjE4Y1lZOFJZVGhnMW1ZWWtVU2NzT1UxdURtb09Yc3B3R01yWDZFTUUv?=
 =?utf-8?B?b1JINmlycW4rT01oZ0E5TFRPQ1owUnJwKzViaENvMUhBYXdMNzJvcTdRSGJi?=
 =?utf-8?B?bmh5eElrNHRyZ1ZzR1JUNzgwZEluSHJ3Slg3R3VseWE4U3ZuWDRoU01CTUcx?=
 =?utf-8?B?dlhuRHErRW9jckZiNmJIWSt5Q0JKdG0wdWpxTWZZdklyMDhYODhsWG5EL2VN?=
 =?utf-8?B?SEFJRzRuVXRrRnNOSjQzWFFvbk1sZ0RIRFU4bGt0L3RFY3lScUQzTHN4T0wz?=
 =?utf-8?B?ZTFzLzBuWnVudWxTaHMrNk5STUdiOUdCLzBmaTR5UDA4YTFhWVZ2eEF0NmNC?=
 =?utf-8?B?VDZMWThjd1oxbXZsbzUwVVNlbWdqaEttekc1azVzcjdiT0g1c0trZ3l1OTNQ?=
 =?utf-8?Q?Kz846wqy2Xyf9ShuqFsLKuPFp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	yELfqkIMBGqXyzU1CJtzpiSrUwGAp0hwDCRfveHzueTsdI2wMF1AXtEu/ecHKdV7I4urXDRGviWvs3zRzA8J+vgfR3hNBrhqb9RFdhiRBezJqtubOqtnOzcsd+UPQgfWbf8pvzt9Q9vyK4Q+qZelfNcAYg0LHShU3oCczsH5D3NJCJxUudyxzYEFAvCD058QFjebT3UfMtonFjkFy4bXJLUK4hMS9Zl7ZsdRA0iIcq+MM0wmXGJ4KRwjm/ssaR/JXTnbPlCyUJCeJzJ4HJoVRErYzvT2Bnr5xvGjBW7EIbKf8DcCT/S+r50ufx1lC76oU7YhBf7JkTakazrPfp0+wNO7kot2/bMNT+4NESrpgjnoCnmAOONGIdfKCWfvPTMV8J2peUXWEnwe0CxJ8Mj9iJEkO7vCmzzmCIpZL2cEjDmHdrg6EdCSouTqSJHlh1ofZMalA2of/yREwFFXsv/V1GbBEAtGXsdBsCZLlxDl6Q4x/aJQvYQYdFsjecJ91Slo3G+t84VEInDOHcC0KVz6U/HrRrdY0gCYTkTmR1xOT0WfTUzPHfIXVKIOoxqw3OK0nxHa6Omq8wOqBdvmTu6HKZtseDhsGLHvECjN4CBN65I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e07f7e5-646e-495b-f44f-08dc873a8251
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 21:40:54.5555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0VD1yOr8Uumd3z4sAu2P9eSkfoBhQOwOWAjrNN8qmpuO1F13cvNFNInKnfNOTVzup++QeIQig01xvJUsbsATyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5740
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_13,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406070160
X-Proofpoint-ORIG-GUID: xo97KLOqeKnZVZ-aZQV3BfwxpmKLMTFT
X-Proofpoint-GUID: xo97KLOqeKnZVZ-aZQV3BfwxpmKLMTFT

On 6/4/24 17:10, Kris Van Hees wrote:

> On Tue, Jun 04, 2024 at 02:11:03PM -0400, eugene.loh--- via DTrace-devel wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> A uprobe will have to decide which of its clauses to run for a
>> given pid.  For now, keep the provider description for each clause.
>> There are many shortcomings to the way this is done in this patch,
>> but it is quick and dirty and helps us bootstrap real support.
>> Clean this up later, probably turning it into a growable array.
> This is the wrong way to look at it, I think.  The underlying concept is that
> DTrace supports specifying probes that do not match anything yet (-Z).  Those
> are called retained enablings and they can exist for more than just uprobes.
> So this needs to be more generic.

Okay.  I looked at legacy-DTrace retained enablings.  They seem to be a 
linked list -- (mainly) of arrays of dtrace_ecbdesc pointers. And 
dtrace_ecbdesc has dtrace_probedesc, dtrace_preddesc, and 
dtrace_actdesc.  In DTrace on eBPF, dtrace_ecbdesc is much simpler -- 
it's really just a dtrace_probedesc.  So it seems to me we could just 
make our retained enablings be an array of probe desc pointers.  That 
would be a small change to this (small) patch.

> We also shouldn't do this non-discriminately for all clauses all the time.
> Obviously, when -Z is not used, there is no point in doing this because there
> cannot be a match-after-start.

FWIW, that's not how legacy DTrace seems to work:  there *can* be 
match-after-start without -Z.  The -Z option only addresses whether 
there is an initial match.  If there is, then -Z is not needed, not even 
for subsequent matches to work.

> Even when -Z is specified, you might be able
> to determine whether the probe specification for a probe matches perfectly
> or whether it needs to be retained for match-after-start.

Maybe.  But what if you have pid1234:a.out:main:go, but pid 1234 has not 
yet started up?  (Yes, that's an extremely weird example.)

Mostly (going back to your "shouldn't non-discriminately" comment), 
trying to decide whether to keep a probe desc seems unnecessary. Just 
keep them all.  They will likely be dwarfed by dtp->dt_probes[] anyhow.

> So, let's put some thought into designing this in the more generic case, so
> that we can avoid going down a rabbit hole that gets tough to recover from.

What do you think of:

     struct dtrace_hdl {
         [...]
         dt_list_t dt_enablings; /* list of (to be) enabled probes */
+       dtrace_probedesc_t **dt_retained;
+       int dt_nretained;
+       int dt_maxretained;
         struct dt_xlator **dt_xlatormap; /* dt_xlator_t's indexed by 
dx_id */
         [...]
     }


> (And whatever we store the retained enablings in probably should be added to
>   dtrace_hdl_t after dt_enablings.)

No problem.

>> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
>> @@ -215,6 +215,7 @@ dt_compile_one_clause(dtrace_hdl_t *dtp, dt_node_t *cnp, dt_node_t *pnp)
>>   	 */
>>   	dt_cg(yypcb, cnp);
>>   	sdp->dtsd_clause = dt_clause_create(dtp, dt_as(yypcb));
>> +	dtp->dt_uprovdescs[dtp->dt_clause_nextid - 1] = strdup(pnp->dn_desc->prv);
>>   
>>   	assert(yypcb->pcb_stmt == sdp);
>>   	if (dtrace_stmt_add(yypcb->pcb_hdl, yypcb->pcb_prog, sdp) != 0)
>> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
>> @@ -310,6 +310,7 @@ struct dtrace_hdl {
>>   	dt_pcb_t *dt_pcb;	/* pointer to current parsing control block */
>>   	ulong_t dt_gen;		/* compiler generation number */
>>   	uint_t dt_clause_nextid; /* next ID to use for programs */
>> +	char *dt_uprovdescs[256]; /* uprobe provider descriptor per clause... FIXME turn this into a growable array */
>>   	dt_list_t dt_programs;	/* linked list of dtrace_prog_t's */
>>   	dt_list_t dt_xlators;	/* linked list of dt_xlator_t's */
>>   	dt_list_t dt_enablings;	/* list of (to be) enabled probes */
