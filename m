Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C2A3A451F
	for <dtrace@lists.linux.dev>; Thu, 13 Aug 2026 21:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654936; cv=fail; b=jKu7Dc5V5wot94Smh5Tu660F4NtVLPY2gdPXYCSiQxoXgOm3gnPSv1aF82QrpsRmvk5zmlqVi2ntVfM46wJGjGImzJ1j5NqoQvhtcIPRNmStBb9Rksgg6rOWE5tqGIUHyeUwktNvT42J80LiaTC8G5IMXyxcK8hFqo2Slg9a480=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654936; c=relaxed/simple;
	bh=ghxfkDdHlPedMmC9/SB9TJeeJNvzTwTnYncNNuYl+qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=axiJuCeSLFKZpMOJl98+BVoUgptYzPK/ToGCROUk5kIeA2mkHsAFL5AGW9aOnj1hVO5ROWi/r779Fy2782tyZldDrq1gpC54ICjUCOUM9raSiPmuKNHh9VS1hRfx/N2Vbf2kNc96CnNWGR6kr9caDmVuZt1a4lgZyNHHezSfItw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RShenooq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OS+Di3AQ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RShenooq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OS+Di3AQ"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DK2N023195498
	for <dtrace@lists.linux.dev>; Thu, 13 Aug 2026 21:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=6gIgbyNMmBedaFdkiL8ChewhiVIa49EoE0tEpwoE7wY=; b=
	RShenooqSAR1qQlj9TYu70C1jzx/i9OxYRsvQfsnXM+0u9868Q33P4t7pLD2tIYi
	e6Xr2NbHdTFTIEgztXGt4jeqe3jr1U3Y59wJNC1s2rluS/0AvyhP2Wwju/y6oUCa
	U7zmLhJpjyZlvju4boQ5sF/QT2PzMQf19cfaliMTQP57JeYhuCYByqDjD2cFrDup
	qEmce4vSWJ3FnHrRoo+7RTZk4H63Zc6pIiGoOx3bCILVgDyY6ClXU4GgdHrbeoXt
	bSfdvTDo8hBk/Dqii78dLg9XcQIjO1ysSpI/Crs9GPGbgjODAM/lJUavUVZsq42f
	snMjDMOJ/sAbqT8whEixQg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fwvfy2yne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 13 Aug 2026 21:02:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67DL0pkI030176
	for <dtrace@lists.linux.dev>; Thu, 13 Aug 2026 21:02:08 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010039.outbound.protection.outlook.com [52.101.56.39])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4fwtwtkjdd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Thu, 13 Aug 2026 21:02:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcbg6PV/PCdpYTjWm+hgNV0UuVH4qSkJuo/s2ATAmXmPKOBfveqT93ynPlXwLdMDTihJuKbIToYaJYTtIiFMZeC4Eb2OZhFdlt1GazzEQdNuBbLvecxjhqnK3tCtmlQHxhgmFcFUfsZiyGHJn+G0rqvzA4aLLoQ8NUDPOiqmA2OC92nlI5dV9LEe7VfIDG59log30bcnEyWCa/ADcIVF/eCvW3FG9sBpfe+36vFI+5tNDUV569pyUvlV+RY8Jjj9Btdi64Ghp9KubRZlWsC2eEpMmHj4/sg13Yje0OGW91nRWYNJbPfsCeHiooNcHzMAHXp/WNgQA0HHeu5XIgzDqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gIgbyNMmBedaFdkiL8ChewhiVIa49EoE0tEpwoE7wY=;
 b=kHl0/wSg6FSzlZcU/B4p5TmxPA+Hcu65imW8bTDzpBHy8uQy5QDifLz4xcm7fcGxivI1aGHNpMSpce3EakUmitI7BzzY2+lsdZ5UyGMyPgnH6uMEk6VBvTyLWOiRDOYO1A6CTPEij1ZM/qB9qbGjmIOzu2EZCpumexDNvW7EmijXXeznrp6GUG6dwqVjbNZKH9NhnSoNVhtQ3NAc3F/6mYe7zgDUNcCXY7hcptZKutMFffgtAPuGB+df4Y0IZ+Gi5Jmv4KD0mGkK119dGHlp//VU6xfPlzFikRv2XlFIJIxRzf9yhWdRiWs5ICB+YYUyLi/S07i1biRUvfStvLOZfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gIgbyNMmBedaFdkiL8ChewhiVIa49EoE0tEpwoE7wY=;
 b=OS+Di3AQTdkZF1VyyNnDF2nqnbMgn9oGT0GMowf+/Pn9WL0mIEewFOBNzkBJxIsG6IYDOSqJr+L35I4FO6cNh7hRpVaT3aDCThaTsN38erJ0gMCTCtGAWeKmL/LSQjcmID6fSOHy3NMtdiP0Qw72f9Aasv5sHTSG2tbRY+y/2hA=
Received: from DM6PR10MB2476.namprd10.prod.outlook.com (2603:10b6:5:ae::24) by
 DS7PR10MB5022.namprd10.prod.outlook.com (2603:10b6:5:3a3::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.14; Thu, 13 Aug 2026 21:02:06 +0000
Received: from DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537]) by DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 21:02:02 +0000
Date: Thu, 13 Aug 2026 21:01:14 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v4 0/9] Add python, PCP support via libdtrace interfaces
Message-ID: <an4wmo2RQQ3DwUjN@kvh-deb-bpf>
References: <20260812132212.527871-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812132212.527871-1-alan.maguire@oracle.com>
X-ClientProxiedBy: CH2PR16CA0025.namprd16.prod.outlook.com
 (2603:10b6:610:50::35) To DM6PR10MB2476.namprd10.prod.outlook.com
 (2603:10b6:5:ae::24)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2476:EE_|DS7PR10MB5022:EE_
X-MS-Office365-Filtering-Correlation-Id: f9aa4be0-eb84-4f92-ca3e-08def97e1f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ppVudZxOOdCXqG2f5Ykdx/BaQgZmRqX21MseWxGLpxpnOyBgp4t1e/Ls6H9Pf/Dy+c7CdE34E/aGHADLH+FxWifhf15bVsslKAXcsrbgt0TChJHoAdjI6Gc9dMux9Mj3KEBrjFAH1GIzCSbjkuA1PLkojqz56w53DGOFW+1wEbqsYBRCqX6o2T3u9NdIHxXIjJ/xP4MrS2e6hcrqFI5XuzjZi7aeXGFTDaGHLUg+8ycEvcg3e/2tjiaae5ZIiA6dv0TsUuhBY11CbZh8Jph1dFFNXMOG7YqH0D2ewGSrUPwG/i0EdmERK9yN85tw8YlPtRgQ5z9GJwFv9PBdvt5Ax7OTXfw1OrhbCugwvTY9WGULJGY46ERTGVa9JL/cNu4EZP9CFRCkTiDWAx0D8+qYsTqHYk541JRs+KXPIwtLDnkSz86jpjoF7z9AtYxL3x1GOgHzbjIoccuib2C8WmLhZnZZxXvCALcDVSM/FUlIU+7zCPiN7SG+CIpmhYjFFbrMfgGhpT7VTpMjMesqhTTDc5EJ7c4mFAkAHMXYbP/7MIPInF1V+Wh4jrX/EpoJp7A0kZUO4FV5QSuFM0+4vf2xyfDrJE/FOAltTnpH7XOcjic5h5NU3TA1BENd8KrU2BWz807hvz1GYdj+aQgPglBtKrO5Y/uBFI/LQaKesF+i9y0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2476.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnlpaUJzVmtadm5aOHZLZGVjcFJPdVYzTUhZQzB3MzNNRys4eGFHOXJXWmZX?=
 =?utf-8?B?K2IzK1p4UmFkUHhKR1hMNlVQZzU0WnZVc01KcndjZXBOeHdqZkFWZ0dJSjRC?=
 =?utf-8?B?QUVwVjF0c3VWajlaZjZsaTM4OU4wRE1MaFdOVGg0Qi9UZHMzOXpUcGNkaDBS?=
 =?utf-8?B?ckI4YndyaGZ0WjlwaWJ5dStwSDdVMTJiVGkxUm5RdU51cFZ0S0hkdXNPU2ZO?=
 =?utf-8?B?eXRWeXpQZWpyWmxEZlNMOFlaNTVFNWlFdW1MQWQ1VHBPb2VkY0dMSFpSTjRa?=
 =?utf-8?B?NVU5aHgyYU4vb0VYdTVmZzlPdzNzdnB5ajZza2NwczYxSGpod2xEQlFiVEwx?=
 =?utf-8?B?Y0tPOHJZYWdUQTRxelk0ODlrNG5kdWI4KzlHS3NTSmRjeFNvM2d3SCtGNUtS?=
 =?utf-8?B?Yzg2KzdXN0NZNDlvZmhsalMvZW5SdUFBY1dGQTZjRStXclNrSCs4SHdOUURu?=
 =?utf-8?B?TmQ1QnF3N1RTaU0vS0o2a3F3ZkpjYVM2bWVtenZ3blhLMGVpM0c1NDhGMjV4?=
 =?utf-8?B?VmxRSCtZdDRzeFJoK3ZUNTd1UjRQdnZLdW5vbENRM0ZjaE9DZ21ZaVI1Ny90?=
 =?utf-8?B?TEhmc0VxSkdWbjNVb3hjcnc4MDVCU0FyOVdRS2hFNnVVdUIvWURLV0xHOFJy?=
 =?utf-8?B?QU1ZNUpuWWY5eWxLQUQyKytyN3kvTUpMNHZsbnNPT1hudEc4eldGUlpLZmNz?=
 =?utf-8?B?WTQvcUZiU1phM3NpeGQ1UkJiaU1MeWpWYytKb3ROSWNpVE1YeDVUL1NMNHQr?=
 =?utf-8?B?QjZ1OUZlTGl6ZXRtZ25hSFgzWEpRRUJXVU4zZEphRE9iSDkrc1ZuUC9LWjFl?=
 =?utf-8?B?NlBtMGVMeW5saEFmZ0N3Y0VlVlBXTExMSnhIRjNZQm9KWjFNNm9wSHA1eUZW?=
 =?utf-8?B?Q09BaDRmNGtob3JJeFhWZ2cxRzVWOEFYb1RvS2ltb1lzQzh1bFZOZlpjNzB3?=
 =?utf-8?B?MDlmTEJXd3V2MTMxL0Q4UE44bU55b3ZnaytNbHhSSzdnRjNPQVZzNzkwL2JE?=
 =?utf-8?B?SHdoeThtcVI5QWlhNGxiODdIRUpldjA2L1pLS29RankvWmtKVXNxbFkvQ0sv?=
 =?utf-8?B?emlwRG85dlhHQnZ6S1NrTzVTdkZwb051V1FrQ3FhTTNQd2E0TFRYN3poQkw5?=
 =?utf-8?B?Tm9GdEg0TVN4bENGOUZGbkdnWjA1R3BuWlFydFNtZ3F2NjBWQ3V1SGY2Rm5C?=
 =?utf-8?B?NFh3d1ZWTUNYUDJ4RlVmcnRER3Z0anExT0JEamNYZGMyYTJXSlorbE8vMkJN?=
 =?utf-8?B?LzVqNVlPd0lza3YrTFdaSk9rVHhJek1JaXhyOFVTMHIwOXNvZURkWE05MWM1?=
 =?utf-8?B?am9ma2NMdjlZdVk1QzJ1Q1Nrd2pCbWMxeEJXTGF4SjlBWGt6a1IyV25nMmNl?=
 =?utf-8?B?d1VPRXlDU3VodGFMTkdkVlZEdDc1cTFlYzhrV0ZjTFdJUWdtVFFhZWtZNm5U?=
 =?utf-8?B?UmdCWjdLTzFzbTQ4bnE1U3N6TXBlSVhMWEZmYjhuaEc3S2NCUnpFb2RFN3BK?=
 =?utf-8?B?SDNGOU1Nbjhnbmc5M0dLQ2pYaU14em5EQ2xHZXQ4MDYwaUNRQ3dpbUZTTjNY?=
 =?utf-8?B?Y3FyQlZZeW9USnR4b2l5NFY5M21tL0QvUjZvZVVXb0V4TDErYytjV2JIQlpG?=
 =?utf-8?B?bFlPRVJJbDRUNXpUTTduOGw0ZWszR1EvcHBOVDNXR003cGlGaUVVbHpzSTN2?=
 =?utf-8?B?ZE5keVo4M3RPblJDUkJ5RmlJYlg0bE5Jc0wxUXlhYWJwcEpDalBlUjdMVlhu?=
 =?utf-8?B?alpSNkpMVDdqK0ZKalhlRkl5QytzOTQxZzk4UE4vR0QyUzRUWkRKbHZJZGc0?=
 =?utf-8?B?QTBQWXo2NSttcFBWU3RXeWNrL3JYcEFSTElWOHdlck4rdEd6YUl4UG5GRXBs?=
 =?utf-8?B?N0NiUTFLZ3kzSyt6dU9Fa0p4eW9PL3F4SE1XN2srb3BiOWFxblBwczRlMkdP?=
 =?utf-8?B?ZkMrNUg1c1l2VXFzdVZuR2RJTjhGOVdHSDNmRmpHbHBtRVR3OUFGbkVJS2xu?=
 =?utf-8?B?NGx5QVhnNGhmWk52RlFEYmcwUFIzWkEvdCswN1FHbkJuQkJIZEdQYXlNY2VP?=
 =?utf-8?B?M1oyaUpMcis1RDk3U0x6alhTZXVieTNMT2h1WnU2bkF4UUZUQkRlZjRFelRC?=
 =?utf-8?B?a0JGa0EyNHRrUGUraFlnN2NSZllZUXcwMHhOb081Z3RtTFROZkdjdGNqUFQ2?=
 =?utf-8?B?dTl2RW5PZ1pjbWRVcnluYmYzdlBpK09TMzhRZXBydW4wSUlqcGtnbms1dENp?=
 =?utf-8?B?SGlRWEVnL2lGV0dUUnluL0NzYkpVOVNkam1PYmFaaFlTOEJVTk90L1dnNDBl?=
 =?utf-8?B?Z3FWZGttKzdnd3QrWExTN214TVY0bjd5NXE3RDZRVHNtcXVqQzQ1c3N5VHhx?=
 =?utf-8?Q?5ZnB7yZimW3bdKFA=3D?=
X-Exchange-RoutingPolicyChecked:
	Ds+Y24hhvYoicYiQkU+cr8xA09c3BFgqCr0IfFVTDnXEgfVAlhCrjzVHG8Xe6ToFeKaylGzfMhcCVRuTi5kB7Uot5YzRihQDieU4FoWRwcRBq0ryvpbzb/OARO1STFpmaALIhKfIG2CTQm0aGODyxBKWjTzoKAbKamMelHNTOlA4fDu9hTJKsMwOyUqMRAMApQhwmUWize93TUgPB2AoTJo0BT6gx+qiT4LdiHZuKhkeBZp6XzgIi0sWW07nPO4egUo+LGj4dGNThpeI+egpW5SGqQX5pwLYKhhO1SbwWlSgvF+28QkOz4x8DP55RyrRMJ6wbxAfhIfdXR1UJ8E4pw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WQTxccTYsQMZ/6XSf2qBxbFwpbNRV0+sqOdm1/A1485R/dS++cBR4Sk5BYZRZVtbGCQB2y0fgla4Kn4RcYJ+JV/4mHBsyDH9bIB0WsMYeUfrhaqbHdkjFg75LEEJMshir4ucaVKzCxrGsCBqHxq+pMl6aEvvnTAClb2JWcvciL79KEnJwpq1CHxSLKiOm9xD9NLKrNWGKSpUUdr4JUCvfhzCZ4ocI3/LvB5SSZN6w7FR4X/rBKt8qSFopXr++VSpsuAeQLA76G+NDhX0/rZ4ZOX02xGhKA+DBp4sb1MEvOLv27h6igDJeaoZZTbhFaHKMZ+xY1hQNQq3OhQdvcwPfU+9LLmhbRJdTsr9CrNjqmRKHQ0N3kiMN0rQcVYpnCaOTUs9qANyYASBmZOYstv1tjOiCa+WRLUAQORIqZDKnhs3yVGHHVxl5vxezhRyJZlzuUYfhoikqyi51u1DE/scES9ljara7MxZ7MsxKKkcatlGdDlii9h1QhYzR8nmU2BucVpWprAigZ+ZQjFXKHJZ4Fc9CBYEZ0g5ndqarNacM4Zh/eVa9dAezavI634ydsqsbD+0enLtF1PigulFptMnAfwS/BxW5/S1dxL9SIiOnnA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9aa4be0-eb84-4f92-ca3e-08def97e1f5c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2476.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 21:02:02.2005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EtfkDLj5rZlbFr8uYUGvtQivoWVe2oQucmw22L79Da2rBb1L8aFITi8yWswVEOlM83LM8VNXgg8wkWmoXJaJx0YOJMMZrrvsQovcjlDjGSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5022
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608130153
X-Proofpoint-GUID: AIvMp6TS8f3cVfn5MZVYisztXfBGG0gu
X-Authority-Analysis: v=2.4 cv=K/sS2SWI c=1 sm=1 tr=0 ts=6a7e30d0 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=oMMYMnFE5O6HsP98Hd8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12098
X-Proofpoint-ORIG-GUID: AIvMp6TS8f3cVfn5MZVYisztXfBGG0gu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDE1MiBTYWx0ZWRfX8GxjLayL3zAC
 VBHDmPdAWkqf4/HzRA6Ys04a3zxc0F2QC7KNdE3F28dEaPW+2HluSPD7aTFw0I+dZVnp96wlkfl
 Adj0B8GazDoEbUzvHBwAajS4bFOPm1lk0h9XpKEmN5vvG5ZYYcveaC8Hc1GU9mAW2kqO7wNvNI7
 7f8YlGd/RbH7oJ8rRUPbu4Y/YKA3lAPQ3/K+O1LreVRpuLWO7zDoOMF/LSrW8tuhFh3wwB5J/eB
 ML2crxDHZ3eCcrfpKAW8Ly/eMLV1t3mYswkNPM7JfmIpQlTLJdvQJkV75JYeK0lRawUHZbtlkxL
 JHLWOR+bLR0zwaIwad5Rf43UNkyGQGDLN6H6COrsvtTsHUkY9aU2JKm4LiG2eIkpiHJhErP+4H5
 UGkU5l75LyyviBBjiM8Bx965pYsZ1qdVp0SNaFYqIO4/Wz5c6+rknrsB72GGQP2ExMVm20SeXET
 jWyU/c10PtBZFzt8fIJoYUC1mgjcohQlMeJPzrMk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDE1MiBTYWx0ZWRfX3oysDWDLMzHa
 Qq/SDHZvw1k8dWfi6tsMrNNB0k7No+yHkuI//IJt+c3j7Lq50GNB+B0/4/xrgGzWYdPJBoADcsQ
 SgBl8NOoXGhxjWEssyVkje7pHGEgnFx2de7E5HvG8gZ4ORYdXCvB

As a preliminary review, here is what Codex has to say about the series.
I run every posted series through it as a first level of review, and to
evaluate how valid its findings are.

Here goes:

• Found four issues in the nine commits:

  - P1 — --without python RPM builds still force Python bindings.
    dtrace.spec:174 and :190 use %{?with_python:...}; %bcond_without python
    defines that macro even when its value is 0. Thus a Python-disabled build
    still runs WITH_PYTHON=y/install-python, despite omitting Python build
    requirements. Use %if %{with python} around those arguments.

  - P1 — Dynamic PMDA aggregation instances cannot recover after disappearing.
    pcp/pmdadtrace.python:560 removes the instance from the PMDA indom and ID
    map but leaves _data_instances[instance]. When that aggregation key returns,
    pcp/pmdadtrace.python:541 returns early, so it is never re-added and fetches
    yield no value. Remove the name-map entry too, or restore its indom/ID
    mapping.

  - P2 — Changing the PMDA domain as the installation instructions require has
    no effect. pcp/pmdadtrace.python:1219 parses domain= from Install, but pcp/
    pmdadtrace.python:1228 instantiates the PMDA with hard-coded 487. A
    collision workaround described in the README leaves pmcd and metric PMIDs on
    different domains. Pass domain instead.

  - P2 — The multiple-session regression test does not close the sessions it
    creates. test/unittest/python/tst.multi-session.sh:50 loops over j but
    always closes dts[i], excludes the final session, and leaves the others
    open. It therefore fails to test the close/refcount lifecycle that the
    preceding BTF-sharing commit changes.


On Wed, Aug 12, 2026 at 02:22:01PM +0100, Alan Maguire wrote:
> Having python bindings for libdtrace interfaces to compile, run
> and collect information from DTrace programs is valuable because
> it could help integration into metric collection frameworks like
> PCP.  This series adds python bindings for DTrace (patch 4)
> and provides tests for them (patch 7).  The support is
> similar to what cmd/dtrace.c can do; compile a program,
> enable probes, run it and collect data.  Support is also
> added to grab or create processes as is done by
> dtrace -p, -c options.  Aggregation snapshot walk is also
> supported, with aggregation values filled out as raw values,
> ints, lists of function names for stack keys and dicts for
> quantized aggregations.
> 
> For detailed description/usage see the README in patch 4 and the
> tests.
> 
> Patch 8 then provides a consumer of python support - a Performance
> Co-Pilot (PCP) Performance Metric Data Agent (PMDA) which enables
> flexible metric collection via DTrace scripts.  See the README.md
> in patch 8 for more details.
> 
> In order to support an environment where we have multiple handles
> per process, some prep work is required.  Patch 1 fixes some issues
> with multiple handle use, while patch 2 improves sharing for
> vmlinux BTF (and CTF generated from it if needed) which multiple
> handles in a process image will benefit from.  The upper bound
> of per-process handles is now limited by the maximum number of
> BPF programs attachable to a uprobe which is 64 (BPF_TRACE_MAX_PROGS)
> which is encountered with attaches to the BEGIN probe.
> 
> Patch 3 makes available some of the functions used in calculating
> stddev() values which is useful for the python bindings since they
> do not use the print callbacks to do this.
> 
> Patch 4 is the cpython bindings themselves; the README.md describes
> their usage.  Patch 5 packages them and patches 6 and 7 facilitate
> testing them.
> 
> Patch 8 then builds the PCP PMDA using the python bindings while
> patch 9 packages them in a pcp-pmda-dtrace package.
> 
> Changes since v3:
> 
> - Fixed up issues identified by Kris around custom BTF path (patch 2)
> - Added PCP patches 8/9
> 
> Changes since v2:
> 
> - Fixed some handle lifetime issues and related potential segfaults
>   in error paths (patch 4)
> - Fixed up packaging to derive python package version from DTrace
>   version (patch 5)
> 
> Changes since v1:
> 
> - Fixed multi-handle issues (patches 1/2)
> - Improved aggregation representation of stacks, added stddev and
>   *quantize representations (patch 4)
> 
> Alan Maguire (9):
>   libdtrace: Support multiple DTrace handles per process
>   libdtrace: share vmlinux BTF/CTF globally to support faster startup
>   libdtrace: Refactor math functions into dt_math.h
>   python: Add cpython bindings for libdtrace
>   dtrace.spec: add python bindings packaging
>   runtest.sh: Export PYTHONPATH when running tests in-tree
>   test: add tests for python bindings
>   dtrace: Add a PCP PMDA to expose DTrace data as metrics
>   dtrace.spec: Add optional PCP PMDA packaging pcp-pmda-dtrace
> 
>  GNUmakefile                                   |    2 +
>  bindings/Build                                |   35 +
>  bindings/python/README.md                     |  167 ++
>  bindings/python/pyproject.toml                |    3 +
>  bindings/python/setup.py                      |   67 +
>  bindings/python/src/pydtrace_module.c         | 1997 +++++++++++++++++
>  configure                                     |    4 +-
>  dtrace.spec                                   |   58 +-
>  libdtrace/dt_aggregate.c                      |    1 +
>  libdtrace/dt_bpf.c                            |    6 +-
>  libdtrace/dt_btf.c                            |   79 +-
>  libdtrace/dt_btf.h                            |    1 +
>  libdtrace/dt_consume.c                        |  340 +--
>  libdtrace/dt_impl.h                           |    7 +-
>  libdtrace/dt_math.h                           |  358 +++
>  libdtrace/dt_open.c                           |    5 +-
>  libdtrace/dt_printf.c                         |    1 +
>  libdtrace/dt_prov_dtrace.c                    |    6 +-
>  pcp/Build                                     |   56 +
>  pcp/Install                                   |   37 +
>  pcp/README.md                                 |  260 +++
>  pcp/Remove                                    |   27 +
>  pcp/autostart.d/.gitkeep                      |    0
>  pcp/dtrace.conf                               |   12 +
>  pcp/examples/packet_drop_reasons.d            |   14 +
>  pcp/examples/packet_drop_reasons.json         |    8 +
>  pcp/examples/syscall_counts.d                 |   11 +
>  pcp/examples/syscall_counts.json              |    8 +
>  pcp/pmdadtrace.python                         | 1232 ++++++++++
>  runtest.sh                                    |    2 +
>  test/unittest/python/tst.aggr-actions.sh      |  133 ++
>  test/unittest/python/tst.aggr-change.sh       |   75 +
>  test/unittest/python/tst.aggr-stack.sh        |   61 +
>  test/unittest/python/tst.aggr.sh              |   58 +
>  test/unittest/python/tst.exit.sh              |   64 +
>  test/unittest/python/tst.multi-session-end.sh |   75 +
>  test/unittest/python/tst.multi-session.sh     |   58 +
>  test/unittest/python/tst.proc-create.sh       |   56 +
>  test/unittest/python/tst.proc-exit.sh         |   57 +
>  test/unittest/python/tst.proc-grab.sh         |   81 +
>  40 files changed, 5165 insertions(+), 357 deletions(-)
>  create mode 100644 bindings/Build
>  create mode 100644 bindings/python/README.md
>  create mode 100644 bindings/python/pyproject.toml
>  create mode 100644 bindings/python/setup.py
>  create mode 100644 bindings/python/src/pydtrace_module.c
>  create mode 100644 libdtrace/dt_math.h
>  create mode 100644 pcp/Build
>  create mode 100755 pcp/Install
>  create mode 100644 pcp/README.md
>  create mode 100755 pcp/Remove
>  create mode 100644 pcp/autostart.d/.gitkeep
>  create mode 100644 pcp/dtrace.conf
>  create mode 100644 pcp/examples/packet_drop_reasons.d
>  create mode 100644 pcp/examples/packet_drop_reasons.json
>  create mode 100644 pcp/examples/syscall_counts.d
>  create mode 100644 pcp/examples/syscall_counts.json
>  create mode 100755 pcp/pmdadtrace.python
>  create mode 100755 test/unittest/python/tst.aggr-actions.sh
>  create mode 100755 test/unittest/python/tst.aggr-change.sh
>  create mode 100755 test/unittest/python/tst.aggr-stack.sh
>  create mode 100755 test/unittest/python/tst.aggr.sh
>  create mode 100755 test/unittest/python/tst.exit.sh
>  create mode 100755 test/unittest/python/tst.multi-session-end.sh
>  create mode 100755 test/unittest/python/tst.multi-session.sh
>  create mode 100755 test/unittest/python/tst.proc-create.sh
>  create mode 100755 test/unittest/python/tst.proc-exit.sh
>  create mode 100755 test/unittest/python/tst.proc-grab.sh
> 
> -- 
> 2.43.5
> 
