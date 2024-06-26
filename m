Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE9F28FA
	for <dtrace@lists.linux.dev>; Wed, 26 Jun 2024 14:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719412308; cv=fail; b=Y9w36Ek/AvnK6IzByWX56vU2C7qzYcPfZNNv47/eL4WordcoQXQam/1tIjmgnW0D2WccoBZTV0FRmPHetufJG+y837iEXqU7U4UjI7oe7JDLu6yqEf0Iqi+lzZrFb0FbptWWmvtBA1gPPmOFxrAU8HnZiPIM0TtYA8ll9ewnvSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719412308; c=relaxed/simple;
	bh=GPqu6SmOka9f8fvZ8d61icFmk4SggMjDgYIvXqpY8sc=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PqmWTClvBPQmlpyX4fPi7uuPKScCfpAM0xVkY2hHpx0DgshhPyym9r61y691hewWWymCNytfHin4IbH8QhiT71V50JlfdVMzDOv2/LZWFzgEDgmzS10aT4mcfW1lxux5flNoHgiXlsmZWZEWkXXLjIOl3PW2AkwOzMHLXmLqubw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=crz4yvAG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lRAY7iQI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="crz4yvAG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lRAY7iQI"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45Q9sHWj025745
	for <dtrace@lists.linux.dev>; Wed, 26 Jun 2024 14:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:from:subject:to:cc:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=38qdFPZlrDxk5OGKLkU+Y8RD7cHHRrTqy6NhHFNd7XU=; b=
	crz4yvAGHAgkeL85lu2jZaUs/ZDrCAybl+QgfnQrw9SL2mIeL652teHYCJOz6f16
	JpKoxq6MMS4jU76dMgTUmw87tuHagUOnRiscjCLHTp+LTz1YxOVOp6YfVWvx0/9N
	9mb+J0aM5T6qtCM7Dk2PmzonyvTEvASXFHDLIQXXfw1l7x/W3BdjBD0WubT7qMR4
	Ii+79A7MMY72Rom9a52jY6twFNakUms6oCwlK4P3aiJIjYCr44wSGIi33t0W/UWb
	OIncmvjO8PfAjuoQ98EF9SBZZ0YB1lCyn8tBtq2yXNxEJp2j1/NdBeWCk4nERNEH
	ZrKFQcyx1t7rtMzo5zAaxg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywn70bg1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 26 Jun 2024 14:31:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45QD1sNi021559
	for <dtrace@lists.linux.dev>; Wed, 26 Jun 2024 14:31:43 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yxys625u3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 26 Jun 2024 14:31:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wtu+hMWcy9YxjuWtztvj/hiTjlGErV6m59QrjFlrrWMCoJq7hHtq8itbn9inOPxfDqKupmrgFtzS8OKVLzNEwl2aU/Qlt2kEQwfCKZbzG0e1/YCqc9m2wOeci6BQdge/ybEEdu9KmNbn3MM/KuVeJ5dHIQPna7/StgqBmcyNoQrLKSShzdYORFi0TjzQtxnBnWP3RTlYgZllzNFdc/DQOPXj8RheVm4TLo3oqUWqSLE2fSCvub44XMmH1kxUmKFWmyjebCKjhvyfGKhkzZvS7odOz5+fxpttiL1X31RZ688QjuRYPAiRSMcf6U0KlfsJgv3H8QHVeJpOx/2wkpG8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38qdFPZlrDxk5OGKLkU+Y8RD7cHHRrTqy6NhHFNd7XU=;
 b=NOB0Xsit8hJ4Yn/eGPPS7CAlSiGExcr/r5qWgNEi8ZOmUSUOBS2i2YyRBA+haNNdsLJkWnKlLFfONNt9JLEENdE76Fp1PcY3tH5xs7LrBmQFgmXHlVjlyNQ/kXl523Y1gO/p6R0eFHyF3vxwuFtOjF01LhyFauKrPNCtDc7+HSpYJed0H7lpmCdqQLJtuotK12xYPDS4h7XrGPPyMa8aXKCTR14kUxanaeeki3hhDR2dqk+wXE+RMk14ovKNi1Uc245xXCiHrmH6aTwz0rkuvOfp2PYkxUkyOHG98u714fw6zeyeI9o4mYNRez/bm4ounOBElQNRQSPIsGAkj+sE2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38qdFPZlrDxk5OGKLkU+Y8RD7cHHRrTqy6NhHFNd7XU=;
 b=lRAY7iQIXR2FJZvrj2IZb7DW1wOLhKXt5tIGQePl0dVnJp5B2YC6BBG6AwenZUpEefQBQpgf2YEK6rohpdqpWQU+rfi59ojMg7K1E51K/3C69nUiJERZW+3y7hQj1fZ50DlRzyLA93RhOt6VSdbAO5hXH45iueelMptcBpoGTAM=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by SA2PR10MB4475.namprd10.prod.outlook.com (2603:10b6:806:118::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 14:31:41 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%7]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 14:31:41 +0000
Message-ID: <81e2a658-8489-4db8-b441-990e228ad4e1@oracle.com>
Date: Wed, 26 Jun 2024 15:31:36 +0100
User-Agent: Mozilla Thunderbird
From: Alan Maguire <alan.maguire@oracle.com>
Subject: Re: [PATCH 1/2] sched: fix firing of sched:::on-cpu
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20240625162230.1439537-1-alan.maguire@oracle.com>
Content-Language: en-GB
In-Reply-To: <20240625162230.1439537-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0622.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::7) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|SA2PR10MB4475:EE_
X-MS-Office365-Filtering-Correlation-Id: e4be05fb-1119-4442-52f6-08dc95ecb246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|1800799022|376012;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Yll4YVhaN1BLbnNFamsxUnh5NGRLUk13amhGenVZeTVqMXN6RnBTdkUyRUI4?=
 =?utf-8?B?Ym1NR0VkTzBJWmpmMi9nWThEMHlSNS93V25yd2xOOU02d3BNczZabkJsU0t0?=
 =?utf-8?B?dTRuOFljaklRZ2dyS1ZTVTl3SFpWbkJGUVRhVFFDb2MrNEFCQVlBeFgwSUFM?=
 =?utf-8?B?dmlTMkNxSzNHaExJNUhJQ200cmJmTlJVU2RZQkM5aVVobUIzYXVlU0hOdk1w?=
 =?utf-8?B?VDZYTUpSN282U0w1TzNKbGZpSnZrc3Z2bnF0VTBHSE9kMmhraUg4M0gxZkMz?=
 =?utf-8?B?TWVTajFMYVZpQm94OVJDS2hMQVdsZFY5R3Y4Wm0raFZvYlRKdFpFNTNoS2lm?=
 =?utf-8?B?YnU3NU5oMVA4Y3JnQmdBU3ZQVmJidDNLM2RXWnJJNVRBS3JlaHJpbVJsbFVZ?=
 =?utf-8?B?MnVMTGZHbVBXM1NDempZY3RxaXhkaXhlSktFUDB2NlZUT2hnTTQyVlpLYkRE?=
 =?utf-8?B?Qm15aXg2eDVGYmFURzVrQnNLQTdwa0F2UGp0eFk3RkVhMjlPM1NhUExhMHNW?=
 =?utf-8?B?aHZ6aGxtV1QxT2xwRVlJNmJsck5FQU1aVyttRGZnK053WERiOHZxWVF4Tk9q?=
 =?utf-8?B?NVM2RWpHNVF0MDArL05LQ29HTHFUdVpvdkowSENrelB0NWFQc2czQm9FSHFi?=
 =?utf-8?B?b2pwNDFRTjNKaGhORGNGZXl2Z0VpM3cwaGJnUUlkaW10eUEzY3NUSGRYZWpp?=
 =?utf-8?B?U2RmVHAvVjNzTDROTjBENGIrY2lNTTg0WEhobk16bjZwWDJabTM2Q3lId1U0?=
 =?utf-8?B?OU1FSVRwUnE4cXU2L3c4WWpIV1Rxd2pGQThwUk5GQUh1OW9jRW5XbjZPTU4v?=
 =?utf-8?B?WFNMK2llakx2MGVxQUNuWVNSL0U3NXNtalBLNkM5YURvMVBCSDZTSEdmNWhS?=
 =?utf-8?B?c3UrYS84RjJBMk5TVjEzNXNxRG8veUwwVlJsVXpUcExwdXZpd0x4S2VzcnRo?=
 =?utf-8?B?RGt3cEFwWE10M2Rjbnp3dEVoNlkvUGtUWFhub3VWNG9WZm85ZVptMW5HZnFH?=
 =?utf-8?B?Q29QU29ZY0JEVGtORUE5amRaRCthVyt2RVg5UGpndzcvRlJra3BqeGRGd2E2?=
 =?utf-8?B?bGx2eE1zU2VNMHVrNVBCT293RzFwNk5YZlMxWS9ub0c3UDhUeS9MNmp2eHNl?=
 =?utf-8?B?Nlluakt2MEtrRlora0MwMXQ0UVplL05MU2hMbjdnWXBZUnFBNHp1bGhNM0g2?=
 =?utf-8?B?MlR1R0Rjbkh2dXRTNFR0RmRMS3dDcW5uL3pnNTgrUVBnWkphSEJRWUI1Ym5L?=
 =?utf-8?B?WEJ0S3FDaHhYQmQvZHpEWjl2QjUxYWhvdTdPZTVZaDVkYmcyTVlOdXNiZWxC?=
 =?utf-8?B?QytpZ2F4VHBCcXVsdjA0dnk1Ulh2dHRFM0RlbVVhRlVzYi9XeGpqTjhLWHFV?=
 =?utf-8?B?OHB6UEVZQUgwQjVDNUt4a0hnRkloODlicThaeHlxVW9CRzFNN1hiMWs5UWg2?=
 =?utf-8?B?emE4cnVvQnJLZGMyZHl5M1p4dE5lT2dZbjFueGFoc2J0TGVKMEhNVy9qRFlN?=
 =?utf-8?B?YVZSU2JSOXBvbFBVYitiNytPRVdOdnR5UTR0akVNcTNvZTFHZVpacUhMeXM0?=
 =?utf-8?B?akdCVzkwL0s1cXRhS2hJYnpGajN1ZENsVWVtbUdaRTJINzF6bTdPR1Z1aXdh?=
 =?utf-8?B?dEd5VTY5UWxrc3NsZlAzWWlJQ3g5eXBFR1RxazIxdmVnWUtteG5sQkp5M0xX?=
 =?utf-8?B?RWtta0UrSlM3MDNzVnpzbGZuZEszUjdkSTJMZzNrVHlLVUp4YUpWRUdkZE0v?=
 =?utf-8?B?VTdPMVp4SjZZZGYxd0gvQmYxMG42QXJHRmp6bk9zRTVORkFEWjJWN0MwZGNB?=
 =?utf-8?B?RGNLMDU3QVZtdWhvTmlyQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(1800799022)(376012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N2VwY3BtdnhNMWZRejlCeDJxcCtrUzhSUUNqcGxSaTF0TWtlTjc3TFJOai92?=
 =?utf-8?B?ZTY5VTNXZkdwL1FndnlxeitjcjFMdkJqZlQ1ekF1MzNhWU1kaGRwOHV3YVE0?=
 =?utf-8?B?aUZDWDBNOHY0ZGgrNjNma1pkdXo3MGhmUXIxd3R4aE1WcC92bFFweHlSVjRF?=
 =?utf-8?B?ZTJxQkFlb0ZLVUdjcVRCWlRvT0llZUhGUjhLTUM3djJoazdTTWFKVTUyV0Z3?=
 =?utf-8?B?d0tvemVBRnRvYlRqOWsrWlVXTzBqQkhCOVZxaVI1YXdhL3BLdFUrVHFnbWlC?=
 =?utf-8?B?MlRZTW5zMGJQV09vdThPc1NOVUpSblZsWU5jU3MyK3g4Ui80MmszNTV1KzZJ?=
 =?utf-8?B?Q1dsL05Oei9SeEp6bms0c1FPMGw0N3pEQ1FIaHkxUUpaV3Z2dVZEZ2FHNEM3?=
 =?utf-8?B?ZUpTa2wvSFlRdCsxc3JHdURJb3J2ZnFYNFdyUnAyTVNwZlB6MXJnOGJZcU1C?=
 =?utf-8?B?V1JaQ2lXczU1d2RZQ3pTVDIzQ0ZCQy9YWWFXekl4MmJQOEkvdFpiaXFyNDJJ?=
 =?utf-8?B?bTRQNFpVNjhjcXdVd2VZcWVzL1FsRW44WHNEbFhWTjhod20vRGczSnhwbksz?=
 =?utf-8?B?WEhnOVF1N2lFVWRIdFJwTXFJQXFzRzd2dHE4cjJ0R01zL0NwKzhZY1FwUXRn?=
 =?utf-8?B?UWFNZmFoRXVtWm5SNTFmR29QNUE2NHFITzBybmYyOUY4Mmw2T1RKWlFLdTZD?=
 =?utf-8?B?aDBILzZJMEd0TnJUdUN1SlV0ZTlBNjFZUHVPeU9iWEhIdUZRNDVLYWsybUkz?=
 =?utf-8?B?bE0yVGJQRTlGSENOZTdsa2hFcW9jOExvdGN2ZzVZTDBMYnllb2QwaFlQWVhj?=
 =?utf-8?B?QXhaUkRHTzNzbG9hL0h1MTBSbW43UnRKMUt2TVFqWktnNDFoSmlGZXo1Ym13?=
 =?utf-8?B?Sm1xcnZxT2kwT3dRT0xUcTVMNmNmMWROU2YySm9wVzhxbnMyREp2NnMxalBv?=
 =?utf-8?B?YU16anY3c3Rvd0NjVHJYQXpRMHBKc0MwOC9kdklIbEJsNUFpQkRQeUFaUkx3?=
 =?utf-8?B?cS9Cd1MwSWFKOVF5QUJmN0tHTmw1cEt4MlhLU1RSYWJIZjI2NDMxUElhYXZr?=
 =?utf-8?B?K3lDcnlLcDNHVkh3NmxWa0RleHo5azJ2S3RxV2RkLyt6M2pVNnREdFZzWkVG?=
 =?utf-8?B?MzVQZ3pjOVZ0Nk12NERXclN4MkYzUzBSSlBRMkRldkg4UlhCWGwrN1IwbjhD?=
 =?utf-8?B?SDNlTURLVzhzQ1hNUDVieXozSkhRckthdFNJTTdIOGxhMDU0enlWVDVNa2JJ?=
 =?utf-8?B?cURwUnpuSHBlbWtTcHRwSWxkMjZKZEl5ZEZKeHEvRGJvZWpRcGdhTlZkTlh3?=
 =?utf-8?B?aHdMQUM4Z280NHljK0tOazRCRjZJM0hoTVZ6QWdDWmxqY1lQUHZiRVNaSVpR?=
 =?utf-8?B?bDAydG14R2NLNGpJdFRYSTdFNk9oQnlLWTFSL0l0WkEzb0YwNmNseFNoNGFh?=
 =?utf-8?B?elBrTTB4eXZEOXVsY1pWQUpSS05MV0MzZUppNUV6WmlXTzNyUFovQ1N0QTds?=
 =?utf-8?B?b2RMS3VwMTJoaGZRSkZrUU90N3N5WWs5cjVTaFVZbHhBOEdZekhDdHJpSHJZ?=
 =?utf-8?B?ekVZbmtobkd0VUpjTXFBbVJOTmJubEo3UlV1UDR3S2xWYURjS0ZSbUpsZk9K?=
 =?utf-8?B?djRnZ0ZydTdyQU9qczlwdDhTd1ZsV2pqTUdtNklTRDVHbzFCNy9zc0FZcjJP?=
 =?utf-8?B?Z3lFb2JEdjJPcVhqdkwyYVAzSnRtOWFkUzJST1NkSDRGMDBDakY5UVZwS2Ex?=
 =?utf-8?B?Z1U4b0dnUjZRV3hVcjQwSTdwTmh0QmJ5TWxYNTg3LzV1Sjg5a2paNzdZRGE5?=
 =?utf-8?B?a2xjQThjSzRTTGpYN0U1K0dsUFBIbXA3K3VhSGh6OUI5aGk4eFM3QjNGMVpr?=
 =?utf-8?B?aHhLZDc0ckZWb2dBY0U2dzV5REI0UEFMUGk4Um9UdXhoMFgxM21DcXdBM0la?=
 =?utf-8?B?R1h4SXZlOTN3bG5WTCtMUTc2YUxTK29CRVRDaWRHRTBxZFZ5Y2krK3d0UkNM?=
 =?utf-8?B?OFBBZHZnNjFJTkFHa2xROS9mUjAvZEtqNnlJQlluSy9BVWIyMndNMkx0OW1n?=
 =?utf-8?B?VnNlMGJBaFVVbTJ6OERTUE1FSFBCSWQ5UnhQQ2pEQUlOMzdKYytsQk52SWtB?=
 =?utf-8?B?OHcrUnI4dktoLzNnVEtoZWxIZ0NRS2dyMDEvVVJGbVlqU2dQc0RiYm92WlJ1?=
 =?utf-8?Q?iNYCGtzG0ntM0HzbvJ7GDaU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	QOTu8pDBO8T+cRzV6kQR2TV77aznCWJZBof4XvZiW4kWl0KD5AM7AGnd32sEmsv3fycXGYHveSr9K5i4e16vRz5GuF3rVh8aYGj9CshRX3zhwzJdcScR+4y2KHfszuofHTgNhtxlRn00Mn0jHKjSRx6tuHpnA6e99EuycUpiwpACzm+bTkgZqFQJ9NWb+JyAj8ufM0ZGFj1TS4JBJpc8LVF4jcbyCF6PYA1tT1CmGlTHg8Kht53QYoNdkSYbPM2SAV8xqIZ2vnbnciSCcBUWA2Ahr6qfGNytJxNe7utIHZ8bFYmzC3TbkRzdr1fNaO/AOWkwUquuwieFbLZ/iMaZK9l5ywhLcg92UAAr3yDZH3nVtHZai7GW4MjwQCpcp7lpLNrqmkiYX8AFpclvPsOeoFmzTSbK3tT5kUVjpHZGFNimVN5IorSw9Gz2HDt1tWwK+Jg526eefMx6y03JApTNcWwWd21i3b0W0bX1+bkwPDVjq+ynLorl58dGpcU78wT4Wiub4AIjpUNd1WdCGecliQcFqBOzcDqeIF0zMAPLXEdl2YJ8YJ6pVNv2M6DhyxLNMET2xoeLiSlRw8+sHfCiSpLyqQ0kyFErH7km1jaj/eY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4be05fb-1119-4442-52f6-08dc95ecb246
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 14:31:41.7635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: skdZ2rIfnhed33YJ3MhoJQULj9qxiHCSJ4pvGStYxrrQUuv52eXy1SA6qaql16ItzcxOLfG/jOUk5EcrsAwr6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4475
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406260107
X-Proofpoint-ORIG-GUID: oJzuD2Y7qtJORs8CAXzbe7qk0n3EhEEG
X-Proofpoint-GUID: oJzuD2Y7qtJORs8CAXzbe7qk0n3EhEEG

On 25/06/2024 17:22, Alan Maguire wrote:
> sched:::on-cpu is not firing very often versus off-cpu.  It appears
> that - for recent kernels at least - fbt::schedule_tail:entry
> placement is wrong.  We can instead rely on the cpc:::context_switches-all-1

further analysis and tracing suggests this actually maps to context
switches out (i.e. off-cpu):


static inline void perf_event_task_sched_out(struct task_struct *prev,
					     struct task_struct *next)
{
 	if (__perf_sw_enabled(PERF_COUNT_SW_CONTEXT_SWITCHES))
 		__perf_sw_event_sched(PERF_COUNT_SW_CONTEXT_SWITCHES, 1, 0);
}


There are perf software events that correspond to "in" switches but this
is the wrong one; I'll try and figure out the right place to instrument
and send a v2 if I can find it..
