Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8248F7D
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753374776; cv=fail; b=IfPgOI1FrjyL3snf+IgqjBy3dl94tT4EU2su4DdVxmbUmhfGPlaj/XyUz4VqPrJ4KHTov7+NNZmZfG/6CtzdfuqlG7FLx3JtU85uBDZVCILYdEQ9+Qp9FVxCmhUsFtv9wZVFnDAGDNGqRu98JrZXeQI2iPrrMexBu52GfLZ+g98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753374776; c=relaxed/simple;
	bh=QuAO8RD/kOdRh35nZYfVt605YBytIEqQUm2sDZJrq1M=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R6bwyF+Jr2fNSp+VaMy/xvzwJnnV92RX9drVHTVAbRbkHs0W2H//48677WPnFD8X3b3LSidGto/QyNDPNgEhZOcRdX7Sd7eYMjS3L6OpnCE4mYvOopdmfyCjskSqHIRU7jquBCx1SJfke/NnnNbsc9L7xOblmZ+/yLtvIoSNeKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mmWNIqO1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ibNI0YIy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mmWNIqO1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ibNI0YIy"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ODRNt4002826
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=1L5Bgs9RVsCumzfql61ZvdP6RsbZqjUT7reprFQP5+s=; b=
	mmWNIqO1MTAx8XbcN/0Gt/dvvq+2eFHk1LWU8/M2ql6+G0dI5zRqv211wMNwOfLS
	HFVtlcJDkfX8kEBZrGp1jlCSb9FsOmR5xLSlrHnzKePwG1cdZrrgEpEPuyzSeyaw
	rL1edpUW6zcbpPWzABjxxXhfDQpK2hTiOUc/ccvb3BGTWntOCExosxeTLR52uCo+
	fRNGJOgLinv1Ibmqxvd8DaeyreOqk6VhpkIy6zWo5oK+LgDdq+tvJxsvW9RbgTmT
	gXR8XIecCVFvNk+IDVOQ/4Nj5MX7EWMcqj1eNtBJUoXSIa1Hjj0EtX5y1X95w9s+
	1HGG7/X9zr/xO0v7XwCJjg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 482cwhvfds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:32:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56OFF2qO010759
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:32:47 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801tc1dmn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 16:32:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8pMRSO72h6rnZQ00leOaiTaoNwUH6E+WiLvOdXI0XJ/+s8Snh/LKgJWEUMzVlNaV56is2e3+aO7IV1F37wCdWWKjyoW2ZqQtmR07AUwMtUw7Yf77W3XCAw3GDrE/4FarFvflWwvn7XgXqw5tR5bWfAgQ3NJK6BQ2thRDtb/yL6cFFcrhRGLDOvkSIacLwdaRi/QleQVYUMl7OewxYOm+pIx3UkOHY7ALUhNOn4Vo6mf/vOq5//0F69RCuhNIEevRlRT0mCS0PCz4DC24WtpNgd8vPFp5UJcYFCNnEQDgYGzRDDfQA6GXYVuWLyvwq3Rq1AhuhB7hQCZVCx8xf9Cdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1L5Bgs9RVsCumzfql61ZvdP6RsbZqjUT7reprFQP5+s=;
 b=MLrUxs8w3gNuz4q3K81qWgVXxUDI8eYcKWroeh0AN5ItFtn2Qe+7CKGUAVf+luPkBrtOu5YrbGli/W5PF2Fy/JUd8J/kHQxt6Wy/h9QLv3lGbVv9+hjMRxRQh7AK9rP9vz5KYSqMiMopMN+uLij4vzphLOKa1qLW20pKYvpSwOCLCDRa5GF8n320NDkQIhZg7v3VNh4a1E+yntDLW/0GSuYMim5gAWMgFrUJX71plLY1/fpZqTu3VakwGq7KRyMZS/ij8r5TdjppLdPc7CO0UY/xGNyzvauipPTqNliAqVnZSZA/4pLmcmGb53+uaJoH7m+5HykY4SRdccmAjYWlow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1L5Bgs9RVsCumzfql61ZvdP6RsbZqjUT7reprFQP5+s=;
 b=ibNI0YIy4bWUijT3p+tTM6tFfljVCarIYzWIw1//45J1d3GbIIb7+Hrev/fhGYoiCB2GyM0zdPUFR645hdj3m9yP2K7jxa7gBxuXgI6LeDdZyGJcWwdJKm5PMzJisCpbKtPRWrx46Xr9Y430Hov+nlatzaI6gdiHnAw7J0Pe1/w=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4421.namprd10.prod.outlook.com (2603:10b6:510:33::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 16:32:44 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 16:32:44 +0000
Message-ID: <a84420f3-be19-d5fd-ef38-b542af302cfd@oracle.com>
Date: Thu, 24 Jul 2025 12:32:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] demo: remove demo script depending on
 non-Linux OS features
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672ADE9E7B4B3BDAB17A3B0C25EA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672ADE9E7B4B3BDAB17A3B0C25EA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4421:EE_
X-MS-Office365-Filtering-Correlation-Id: b82a61c5-27ff-4021-09f2-08ddcacfb73d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkRvTWlGVDZaY0lIUitzNVdsdzB2dzU1MUR2ajRoS1dyVHhzVjJQNDJqTHBk?=
 =?utf-8?B?d1JRYmFiZFZrYzJNaUFjZ0ZNZWhLV3JUSXFFWFlnVlVqbVZBNWlVQVpLb0FL?=
 =?utf-8?B?UlFXd1pibVBsUnJneElEdlRuUGZRYlZFMWNDdXZhZjJBZnJtRzBHc3o3UFFx?=
 =?utf-8?B?Zy9XdVA4SEpaLzgwVXdQYjVrKzFpcGl3VEV1UjhHaFNVYkthL2RSVzBPbWtx?=
 =?utf-8?B?V2RhOXlmODVwanFyZWZnNkp3akxZcTMwTTdBa2pSRUxpQ0g2bXRWdlBxNGVm?=
 =?utf-8?B?UCtFL05qVkQ1T0Q1N3R5ZENqWXQrcHRDbFBKUjZWVDJtcjdYZEhod0VBRHRi?=
 =?utf-8?B?emJBMmdsZElkWi80NHlQL2Z6NEhPUUUwUVdVcEtGT1ZxelVBbHJIdnB6L2lj?=
 =?utf-8?B?NmtDb1lQRFdndkE0eEdGWDZlUEZkS3RFNzJTS0h6Tzh6R2hzbzZxRVV0WUhG?=
 =?utf-8?B?bjRKdnd4NkJMTmxmV0s5OWMrZksxNFdaSnJQemtVUVN0dTZYaXZUcjF2d2Nj?=
 =?utf-8?B?MmhvNjEzOEdMQ1hCdlZuYkN6WnI2L3ljTzJiUktVR09acGFqUFNFT2U0cDdm?=
 =?utf-8?B?d3NaaXhDV3VRbC96MlJjWFN5S0F1ZExsUWN2TUt2b2Zxblh0Tm80VlY2MlZQ?=
 =?utf-8?B?VEFvVnY2QkRMU0xhV0hSYksyM05xZVFBMFQ3cHlVZjV4WUtrNzkyODhIc212?=
 =?utf-8?B?ZWEzMjQrMzAxTG93SlJ2WTRhYTYwMVRxUHd0OVkybG1YR3BFa01aanZ5UmdP?=
 =?utf-8?B?K1FvQ3BUQ3A3TW9seW05cHJVVUw4MTlOTkZDaU1UVkkxajBHNW5JMHBmdWRJ?=
 =?utf-8?B?WXJEWlZ4d2lsV3luTDkreGFHRFpOUDZvcXFYcmJNa01KbUZvbklSdXBhd2dI?=
 =?utf-8?B?ZVIvWXpiRWswbVF2UzhBSHpSL2RJSmVubTVSaEpRV2M5NjJsY0xMMk5mNmZU?=
 =?utf-8?B?UVBSaEp1Y1p4TW02aUxqZnl1RVlUdGQzcFlsSTE0bTc4L2NTaWY3Rnh1YzZv?=
 =?utf-8?B?c0s2dzUzTWRwOVhuSDFyeGVmU2tMVUlCaklJejJnTk9ZeUx6V3lYU2dLa0k3?=
 =?utf-8?B?VFYyZzZhcnZVZHVlYVdkZzJ6YTJYaVR3SkY1bmpXemd5MUUwT053azN6SC92?=
 =?utf-8?B?TGxTQWJ4SlpEb3kwZFpNcm0rek5BMkJQVk4rUWVQM2I4WGNrRjVyajRLNThm?=
 =?utf-8?B?STJXbk5JZjlFUEJDNm9lS2JmYys1cFlxRWJYQjBIalEwZXZET0pabjJlakRI?=
 =?utf-8?B?bHRrbm5OVXhacGpjN0pIekJmUkZ1a2RzY0puVGtmTzk0MzM3TWRHbk5OeFZy?=
 =?utf-8?B?WEVRZlN6Y2FVVHZXeDBaSTFjR1RiVSswTWlTYnc1Z243clVpdnFCQW5yQkNj?=
 =?utf-8?B?Nk9hQ3BJWFBtZ3pEU1dZS3R5S24yZGc0ekdOQ0QvemcxN2YwZjN6ck4rb3pa?=
 =?utf-8?B?T3p0NlduRmVqeWhWSEJZQmxqRk5HQWszbnRPVlFTdkU3eE1SYUpYcnhHNjNw?=
 =?utf-8?B?T1NjWmhudG5NYVNVNkpSenlTVjhxaHRpRGs5N1doMXBoSjZoTW1LQmt1RkNJ?=
 =?utf-8?B?aFJDcFZKckt3RG9iRXJQOHEzMmY3MmxHOFVPajB4eDFvTWhnenh0VW1xajRl?=
 =?utf-8?B?bFhPM2ZNcVA3WW16ZExMNkttUFNMZi9vRFNHaTdaZUVZTEd1WDBOR3FiQzBP?=
 =?utf-8?B?QlFkNHhwbG53QXBXTHRrRlBScmozQVY4U0ZqdUk1aHdrWVBEWnpjU09QMHR2?=
 =?utf-8?B?QklNOU96VlFPTTF1d3pldjhXSE5Dekxsb2N3UG1OL0hLemtTMnF6bXdoUlhl?=
 =?utf-8?B?U0ozZnp3NHVITXVmZ1A5bEZUT0FPbVlONWRTd25KcUlHQk0xR3dlQXRCQ0o1?=
 =?utf-8?B?cEZTMDZCYy9yZmFCemlMMkdNUndKL1BqclpGeiszK1pOU3ZOMGFtOWt6TS9a?=
 =?utf-8?Q?pF/WiLbzGtA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzJxREIwcGs0M05oTkQvQ3U4bkw1UkZOdHhVTUJCdjd6U0VqS01wYmJVUXpm?=
 =?utf-8?B?Ui9MbmFobUNtZldBdisvY0wrcElvaGhFUmtoNXdkVFJkd3J5MXd4c2VQQXVx?=
 =?utf-8?B?TmxzYUROYmcyQ0NYN3d6ME1CUEhHSHdLdlltcCtyMXcwcENjM2pBRzVwL3M3?=
 =?utf-8?B?bTNjVEVEalBmVkt0RWFBWU1MNVV2cWdKb2pOY2RTa0t1RENLMmxVZ3Z6UGhT?=
 =?utf-8?B?UUtmeVlMbFI3SUhnTWx0aXc3UElLbnhhb2VNUE9NdUpZRWx2bnBEN0FGaE9S?=
 =?utf-8?B?QWgvMTJ6cmNuZ2J5MGZIWkdkcE9BUXJzenFoNFU0RUdvTVhmc2dUeEdmalVY?=
 =?utf-8?B?SUZwQWZHSkJuYVZCV3JSbU9xdmlDc092TGxiSCs4QmNibFZZQ0JreWRmNU13?=
 =?utf-8?B?MURPcVJVN1QxYkZrT3BPdjY2RmlzYkdLRitJenlxby91TmpqMXZoOUM3bHlZ?=
 =?utf-8?B?NU44bHJzRllnVVJrTnRoa2hERjNkdGhWT2ZuWjJSTlRVMDUwcCsxU2M0VDVq?=
 =?utf-8?B?cFR2YW9Sanh2YTRGcEkzSzVzaWw4SWFzUWFVeWRGV2RLQkJSMmFPbW84YTNk?=
 =?utf-8?B?Tlh1MWZmY3FueDlQKzdaY1FNQ2hCY1Y3emxJSUJDZnVUT0hSRGtsQVdlVzhs?=
 =?utf-8?B?R3BxbktxWkNTbkRPL280QkdIWHByOFJnUkZVdk1VajB3aW5aUncxbzR5Uk9h?=
 =?utf-8?B?TDduOEV4Z0hQa3d0QXViUjNWYWZIUENWQTBzZ1lCN1Y1aGxYbjVmMnJZa1ZF?=
 =?utf-8?B?Tzg3OXU2QkRuSzFiNnhmbXgwLytTYkVidGVnb2pNbVZxaC9oVENqN2t3K3Vt?=
 =?utf-8?B?ODdzOExKMzlkYWdPcGovYTIvck5rdGQ2UitNUjg1T212a3h1cmxneURtRWl1?=
 =?utf-8?B?dmhvYlFKYXU5MWZPUVhuQ0tQdDdYZkRoVU80V0NvenAycUhlckROQ1dvbGJV?=
 =?utf-8?B?eXFYaStiNkMrU2g4SEVURnpFNU9jUEx0Vk90S3h5cGpYYVRmTktyUmNZd3Mx?=
 =?utf-8?B?dlVhKzgrRk01VStjZ2lBUi9PUW8zenJZNGtkNHdMYmdINWY0dHQ5NkwzalVE?=
 =?utf-8?B?RTVjdVZBazlDTG02TTZBbEpuVG1tTm0wa21Ya05KTHFmSWhWWnhVVVRmdmhi?=
 =?utf-8?B?QVM3ZXpyYjErUmErMVBsQVMwQWN0WmZoOGF1Y2ZscU1BZ0YyN3N4dUpMc0Zj?=
 =?utf-8?B?dHU4dkNVZTNUVXpyT3RSRkVWN0Q1bThzN25hdWN2UDNpMXcxM2preW9tQWdC?=
 =?utf-8?B?V3A2SkZIZTJEL01GdGJLTXc5SmVlS0w5dFRnaTBsaHZ2QnJkUVB4OUlXRGxH?=
 =?utf-8?B?QlFvZlJiOVU5ZlM1bHJpZk9iTWQxNEtNcmFIOWlnREpVY09PTnRSdEo5eTUz?=
 =?utf-8?B?U3RzaTh1OEtNNTR2aURaK2tmeHV5MkVRaHNCaWtvTXY5eXdOVUJSb0xtTjYw?=
 =?utf-8?B?VnlrbU5YZGhydVk5eDRXanNlbm5HUkR3OEdEWjFYd0MyQitTam9kck4xc3pB?=
 =?utf-8?B?eUNqSGd1WXNwU28ySnBzOUxuNjlBZ3hPa2FMaUNyc2xaK3NZUzkyQlYyOURh?=
 =?utf-8?B?OWltTm5OWmdNQzJwZjIrYTZzVlFydWtwVVgyZUp3bmxoUHBVb1hBbUFqN0J3?=
 =?utf-8?B?VjkvNTVRUlpBV0lKY3BQa3JmM01OaTl5RmZJNTBoK2FqQVNXcmRDOVVZWE8y?=
 =?utf-8?B?N29PSElGb1N1UkNHc3Z1VDhMZjVlWXdtLzNKbHFyUWVCL3kzQkRFU3pvdHhG?=
 =?utf-8?B?Mi8wRHhycWp6cjB5RW5Kd1hPRlVWRzlnK0oxZnFNc3g4eHcvUHJoMXBLNUht?=
 =?utf-8?B?NFVLTGNaaTlqU2syemRuWFBQcWxiMWhDUnVUUk1xSWh4eEl2WS9BcnNKZWZT?=
 =?utf-8?B?VDBCZzFWbXVDM3ZCVnlObEk1MWcxcmVTNmdQUzlTVmcxaUJWenIxWjN2VnNH?=
 =?utf-8?B?dDdNQnZtUDdNR2pPZE5UTTFtalRoNktZWTRDUHVJWXMxaXVIZTJ5RGtyM1NX?=
 =?utf-8?B?bTIwR05NTSsvVlNxZDkzRE5ZbExVNG9yQms4b0hnNHI4a01ONWkxZkphaUR4?=
 =?utf-8?B?ZTFJVXJVanNxb3d1akpsNHQ0WmVjdlBOLzdWNkpveExDN2VsOW9DUG5qZFFw?=
 =?utf-8?Q?q+DZv8EHw3hV5lr0Ebo6/U3k9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Q6OD3kBhQgOzo5tc/nz7P2k0Jl6vTOac8uuEnRBnNZtaDj7m2fz/4+idm88zwFbpOlvf8YSdzsn9TWyqijJbtuo4DBqAlx9tVg5mXIob07pb9+VfOkVtrnx/oYzh6iMMDd3LTzEcgu/iyMXbYWs+BsDhJXdLwAcYY22yxRGC5uIIdERCtCfJbLztVC+IOvIhrwAvA7zfg5AHq2I6p20RF8fmAgIdUUu3h1BdnKLVc/SkJHFWHM5sErBMJUjVabQ4n0vOiQUS0o4d+i46dXN0zuiMENC+yvpc8eZ8mysTofpxoSuubRVazC3ueTIAq4kxt3egMrFhPwwtgFem+dyQs/xpNlTVwJIUjjB3WZFYgbm1G8Fdf+3MEXqVXw4DSlei2uCd5ks/3Z3zMHxf0EWBS6VipcPRd/lWQHe6SQPr5sjVNCNP17wkU6gpt45xz7LokxggjZ+SLt0y8U4iaO8zHaGuBrvOlr/B6PcxNzpbl5ubr68e6wVEecnXxiTRVvJ4gIpkV4lHHlmPExBpZ8lB7MFF3c5bYOpMEsOv7phKmudtV6JwtAgRwFsv81nGOK4UoNdbW48vMuN3l85r+9Z0UbG6PQ50r2Ti0746kbFQa+Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b82a61c5-27ff-4021-09f2-08ddcacfb73d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 16:32:43.9106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vjhwKpruvO//qRAFErDloR0gvnfo72DEm93KusjUCEHA5Fop7H9yfCixTXlQ1DypOnBUd+OSOpgGMRWpP0GIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4421
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507240125
X-Proofpoint-GUID: Efyq-kXXWBuUn_v1OVQ1SlW_sYE-T_Ft
X-Proofpoint-ORIG-GUID: Efyq-kXXWBuUn_v1OVQ1SlW_sYE-T_Ft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEyNSBTYWx0ZWRfX5ISGYaLz1F57
 6si5mHKz3MmU0os/yqRgqbeyOc1ch6NoUtRKJbuz1M274aCGFm27YAAkbM1mXfFRCD6TQlFXNIZ
 ftZbVB3gk71uYJF4CTtY7GALqqhk1Ta7Qfg93jnx9QbPMzPaAo7NYcWZwtLnplMEocxi15gsyLX
 gx+hhG4ph7t2h/hhzEITb6vRCVBvEEVDW78NxY4p23VI15uNKXAtEmwlztAOzQITFmOMYNsOZqn
 TKkMr/zXypLyXPK8n5Cd7EWyyAH9F2DyjAvt1d8VHUSBPz6B21bneGXhuUtC623wwirGn50aOOs
 y1DeUy6NgwDFWCc55AGqnIuVHIxYVsdavDIHO8hLPyschgcIsXCCMnG2yHzCKPEclWffMqwI9G1
 jiXVmSUkqqa+yJX002DMtLg85y+Dmb05ly8uhAm+0wm461l515LGHvWQlbB9IVH1tnoR6uOk
X-Authority-Analysis: v=2.4 cv=IPoCChvG c=1 sm=1 tr=0 ts=68826030 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=1oFD51F_3Z2FdQHGYx4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

I do not object to this patch.  I simply do not understand its limited 
scope:

$ git grep -i solaris test/ | grep skip
test/demo/buf/ring.d:/* @@skip: Solaris-specific, unconverted */
test/demo/struct/kstat.d:/* @@skip: solaris-specific, not yet converted */
test/demo/struct/ksyms.d:/* @@skip: Solaris-specific, unconverted */
test/demo/sysinfo/find.d:/* @@skip: Solaris-specific, unconverted */
test/unittest/predicates/tst.predcache.sh:# @@skip: Solaris specific - 
requires rewriting

On 7/24/25 11:50, Kris Van Hees via DTrace-devel wrote:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/demo/struct/kstat.d | 29 -----------------------------
>   test/demo/struct/kstat.t |  1 -
>   2 files changed, 30 deletions(-)
>   delete mode 100644 test/demo/struct/kstat.d
>   delete mode 120000 test/demo/struct/kstat.t
>
> diff --git a/test/demo/struct/kstat.d b/test/demo/struct/kstat.d
> deleted file mode 100644
> index 1ccc3bb4..00000000
> --- a/test/demo/struct/kstat.d
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2005, 2020, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -/* @@runtest-opts: -q $_pid */
> -/* @@xfail: userspace tracing not implemented */
> -/* @@skip: solaris-specific, not yet converted */
> -
> -pid$1:libkstat:kstat_data_lookup:entry
> -{
> -	self->ksname = arg1;
> -}
> -
> -pid$1:libkstat:kstat_data_lookup:return
> -/self->ksname != NULL && arg1 != NULL/
> -{
> -	this->ksp = (kstat_named_t *)copyin(arg1, sizeof(kstat_named_t));
> -	printf("%s has ui64 value %u\n",
> -	    copyinstr(self->ksname), this->ksp->value.ui64);
> -}
> -
> -pid$1:libkstat:kstat_data_lookup:return
> -/self->ksname != NULL && arg1 == NULL/
> -{
> -	self->ksname = NULL;
> -}
> diff --git a/test/demo/struct/kstat.t b/test/demo/struct/kstat.t
> deleted file mode 120000
> index e9f7e5b7..00000000
> --- a/test/demo/struct/kstat.t
> +++ /dev/null
> @@ -1 +0,0 @@
> -/usr/bin/mpstat
> \ No newline at end of file
