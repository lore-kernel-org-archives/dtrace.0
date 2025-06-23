Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828AF190664
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 14:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687454; cv=fail; b=lsKCGPLj6RjTCxI7eubBfttzB+loIKxRWjv8ROF+NybiDQ2ihQBxdT3U4DNHPakelD85qoDuiAVX9Ff7PrFUSUoIeGCXxnZRSDEtF5fZQfn8iQYEQ2CYZGgnY5ledBs4ldXw/AXNJI9icx756dmvCuolY3B+VRi6bQpcKpBhE7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687454; c=relaxed/simple;
	bh=y5zf1y7heRG227847HupTY9dLe/dL70pbbMU3+vQvNk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=S3V16iSZOaNrELCZR7lk3sfFe80c+HfzosbCcG/WP/msqyLEWM6owpY+yzJO5xj8QHV2ft3IbYH0ijKfZpkr+63NDOl1mzgXvVqnc/LPZxEo+m/AmrYX7fsNL6xqNJOqtMvU0x//qiX/iTZGq2zJCZ313YKvt4/2RFzr88tW6JE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VU+UubUj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Z+Z0d3X1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VU+UubUj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Z+Z0d3X1"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NCiboT021243
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 14:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=xZch+ujqEpJIryenphLt4vBy1LIZF3t3bojGVexevR4=; b=
	VU+UubUjUkwI4cn4hfHXzETvbgqrSZzfG3Q/0tiPssyY7wlTV8+LBaaadMQJhqPa
	YvEqX4i7+Uc+//njVrD5blEcpPTSyv/ZfoNMnFTjC5LM9RPz1pl0kIeq8MFZ6xr3
	7AziXL3IKLnkKkJT9VoK6JPD1uSMFY6tmO/4kCDY7kahCuF9r1rNTySQGRQNTfuz
	A1mn/VZxAaepEeEv6ZotSa4GZuRNx0ndXnn1UKyAydscSAri3MZKmX6apn3nWZuF
	qj8penGSQEeMG2GY4Tnd/4B+4gY7Qu7lQHUoxatjNFGP+GVz5lWHzQH5Bv8lfEVn
	ft1O1Sk8Deli2cW+wZN0lQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt79p98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 14:04:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55NDsJHA039142
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 14:04:10 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2079.outbound.protection.outlook.com [40.107.101.79])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr3cf15-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 14:04:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiimz1l4bDcmeADZ3fXAy2smN/lvztF92OQkeUjckhGRBTBurcejdZ2w4f//KDqEx3hyTTN0+cbv6A3PuOzFhENFXPPgKOF+bt0RNotQIx75qWQzHbchsw184jU8zMj9Mso0DaozocYuPcaVM0fHmIVKZWBvgJ9nBhE+EN53QNmybX5R86RWrx+ry3barSu/wlGWmt3mi+5R3cP81TsBCw7Jz/SLOIIX+yRoFaQt6wV/aEee7iqhIjIeOaYI/bZHt6quieJb4mng8DHa1kN4k2K6tXicssytU/FSPVwIulONkHn5qYtD3zrdK6uguP/ds4iq0zc66zmt9FpIppWIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZch+ujqEpJIryenphLt4vBy1LIZF3t3bojGVexevR4=;
 b=O2eTlDVwq9nvt1h95Zpqz3OzZ2VLaglc/Gx/2UpQL7Bhk35Q1lCWq5tFSG2xgdusfASgQuu2n+YDTu0W8W4WnBa9Nxfe7CE/QMgv+UlKsAbXSCzabC48PdIgY7MVQLKBm55GjvCoOGEBE7PilP2eua+/Wb4BIRhxPefD/c7FKV5UvKq/YBt/PX+lRPTI1k1dP8ciLHDbF35bpkXZx3hby9mT1qegNO0yfZ4lRUwEKc7v4yGyeax6wXOOeNFyflTkbRdEhjKNtD/Uu1iNKEkDxPTaZTFO3JHdJM+aQ3XqNWNdD7GBpz2o5uSzLw+ZBvAKCyTSkqgHi3iBX+foNWgTXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZch+ujqEpJIryenphLt4vBy1LIZF3t3bojGVexevR4=;
 b=Z+Z0d3X1Ndp1FugqadkHK3cz6kffWVej1QKt3Qr+mJYclrwbFw/t0qcf2m5vDxqTJ/kT42oXP2ZiaBduBSQJ3m/B5CWXZJKTkJ0fDD+4W2FD7lRr83PH7xJiIpJrqkte0qDJVaV5NJpaL6P93N0H9veoEjXyf3hBXcnRCRddFZo=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by CH3PR10MB7561.namprd10.prod.outlook.com (2603:10b6:610:178::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 14:04:06 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 14:04:06 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, Eugene Loh
 <eugene.loh@oracle.com>,
        <dtrace@lists.linux.dev>, <dtrace-devel@oss.oracle.com>
Subject: Re: [PATCH 01/14] Fix stack-skip counts for caller and stackdepth
References: <20250522180118.27343-1-eugene.loh@oracle.com>
	<87sek3d83m.fsf@esperi.org.uk>
	<6cdb7118-e678-57e7-adff-a74a1ff39e19@oracle.com>
	<87jz57zxvn.fsf@esperi.org.uk> <aFQ4xujz8hJRUGjB@oracle.com>
	<aFQ7jfnA5eKnDMRc@oracle.com>
Emacs: if SIGINT doesn't work, try a tranquilizer.
Date: Mon, 23 Jun 2025 15:04:00 +0100
In-Reply-To: <aFQ7jfnA5eKnDMRc@oracle.com> (Kris Van Hees's message of "Thu,
	19 Jun 2025 12:32:13 -0400")
Message-ID: <87o6uey2pb.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0084.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::17) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|CH3PR10MB7561:EE_
X-MS-Office365-Filtering-Correlation-Id: 07762c9d-3652-420e-2ee4-08ddb25ed0e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGlLUURSbmYwS3AzbGhUU3ZocG5QdFd1WmVscVFGRno3VU91YXQ2eGlIT0x1?=
 =?utf-8?B?WGdyVnlMQTE5ZkdnbHlaejZMKzN1L3dwY0VWUldTTjVIdWhya3JsWnk3MXFi?=
 =?utf-8?B?TnZUWEU2aURPQVRzb2ZqQUN6TnEwUUlETG1VR2RNdGVwMzVBNzNMS29KWWFH?=
 =?utf-8?B?VG5xVWZtaEpoUThJS0NMSXBxTDhrL1dtYzc3S2Uxa1RGU2VybldPbjRXaWxj?=
 =?utf-8?B?UkxReml2WTFrQWIzNUllVnhXcU9YbzVSUEdqMDRmdCsrRDVRZ3ZvQmlFdHo2?=
 =?utf-8?B?b1N6QTY3MEd1K0NFcXU0NGM3UGZ4NXVwa0huekY3bmZybmFpODFFUTBlbEoz?=
 =?utf-8?B?QlU2bHgyMHdXaFpESWVJQ2JIZzMrZHpPYlQvQ2E2VG40VVVTdWI3cUdzaFdR?=
 =?utf-8?B?VTMwTFNOREh2UEx0VmxCU3lpdzNnaTBGNEJyUUV4d0Ivbk8zTkVBWjJiZHpX?=
 =?utf-8?B?Vzhra3djd2lueXdGOGN1TUw1dnlwS3RpNWVuVkNibHVaTzFCanVTMXppVTdV?=
 =?utf-8?B?K3c4aTZCMTVjejVqYzJCU1h5UVlyeGVJNmlHSGdBZzB5QWM2Y2wxNDBOczJ2?=
 =?utf-8?B?a09uN2RWOHNPL0w4UVd1eFBqKy81dDgzZjN5bHdDZThTQmtCVmo2V3pZR3F0?=
 =?utf-8?B?ek9rckpSRjI0TnU3UjVKeDJqS0w4K0cvWDNoU3BVbmpVc0JQMmRUS1EvZUlC?=
 =?utf-8?B?Mlp2SCtLZnl4Z1h4ZlY0Y3ZqOHpWZThMQng4bE0rT05pcEJHSk9tRUlvelNL?=
 =?utf-8?B?S0ZZZXRwTlVlTml3cFBZa3Q3VWIzVFc0TTFsY2xnbDZvV1VTWU5iV2R4T3Ja?=
 =?utf-8?B?TC9VMksvaHQ5eEcvZnh3ME5ieTRxeGpiYXBmeFNKZ1VpOHV4YmdsbVJpOVdQ?=
 =?utf-8?B?MkJzM0dJeUd4YzdtTDRKZ05wU0VYOVNZNTYyeGRGRXFTeGppWURqcm5zNzB4?=
 =?utf-8?B?TVA3dUE3RVJtUndGVWU5VXAxOGZDUWtuUVF3RU1MSzZ0Ukp2ekRYRHNlQlVN?=
 =?utf-8?B?bTErd1c0Zmpsa1d6Qk9SbHIvS1hjNDEwK2YvbTZFMW5VcFd0TDRHaHJxVE4w?=
 =?utf-8?B?WDZ2MXZ3TmtYMjN2UlA4ZTNUcDNqZUxHOUF6QmwxSEx1VHhqQkZmbWtqNVRi?=
 =?utf-8?B?MUQrcU4rV0ZCc0R1QlBLaS9kVXo1TVdFUVo4aGt0VlFOYkUzOXc0eEFneExt?=
 =?utf-8?B?VkdDZEJQbW1qSVkwcmI5Z2E3UFZQaTI0ODZUanNUY29kT2F1UmxNTE52ajJ1?=
 =?utf-8?B?cXV2UFFKNVNVNGdJanBpSFR0QzZDbmtVd2tUejUvN0g3M2FlUkdlbUtOeWxq?=
 =?utf-8?B?ai9aVDJOdDVXV2FobThLWjFib28vV0p2ZC9IYnAyNldTTDB4QlNwVE5jQ0xn?=
 =?utf-8?B?YzEvRDlBaVROaVVLQWt6cE04by9XamhhQXhyOS9CQjREeXdxWUhyTVVabHc1?=
 =?utf-8?B?WlFWQ3cvNWpJWmdBTkZ1bmxseFZaNUdlV2N0QmFsRkJ2cjFGMHU0UXZ0RVJ0?=
 =?utf-8?B?MTdzemZpVEVZYjQzL0FzM1crZ1NRZUhEQWxJQkRobVlLckp1YWtQYTYrOUR1?=
 =?utf-8?B?L0svY0JqK2wyc2JTSThrMU5DRjF0UnowOW5JTWJlRWdycENBOVBNTzI1cWpS?=
 =?utf-8?B?Y0xscUZ5ZERJWklXR2N0SkZtSXQrc3VXWUhRckVwNTNDL3UxZG5PS3pVS3RE?=
 =?utf-8?B?aURZeHRYTHIrNzlMZGM2a3ZBbkU1dnFaK0dGYWdHWTJXZ2J1dHpMc2VQTmhJ?=
 =?utf-8?B?Y3pjdmppWTFIOEFFa1ZvUjgzK0IzOFZJRGhwZlI4Sm5EOGpsc0VRMThVWVpl?=
 =?utf-8?B?d3NMVmdyUXF2R3ZkZDVudVpHNDlmclgvU3FZYldPWlpGNDBXOVlUWXF1Rnpv?=
 =?utf-8?B?c2drdGxMLzZXc015RUxCTUR5OWxzSnRHK2d0SEhTaVk2S1BKK09ucmI5NHEy?=
 =?utf-8?Q?w8BIbDTxPAY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm13Q3RNY2cvWW9SVmJvVHRxR1VIbGcvSUlnY2lPYXlabWwwejNMYjd2RUpB?=
 =?utf-8?B?NVU5NlRUVjEwRWVVNDNGM0w2MGFwOStXUjVDTVRnKzBqdDhDd2xaMWcyYlh3?=
 =?utf-8?B?MjM1OXd6ZU5YQjdNY25kWS9nQ0YzSTRvZ3QxQzMwU2gvTlBqUkc2ZmlRUE5k?=
 =?utf-8?B?ZndFanlsS0Q4OUhLRW5iK3BKSGIwZTVTWldQb2laTmh6Z3NSMVF5azZubG5I?=
 =?utf-8?B?b2gzYmlORko3bk9oYnE5UmRTZEVJdWdkTGhrSWwrY1oweStzdEpCWlB3S09U?=
 =?utf-8?B?Vml3cVJsb1dvRmRscEdaODJ6d0J4V3FWNU5mVzNTc001ODRZM3VmZEZKRE8r?=
 =?utf-8?B?VXlFMjBLTHFNbFJUWWZKRDR4RFpsK0ZCS0lQZzlNbmxpd2prblRqMmsxcUtt?=
 =?utf-8?B?R2R1Zk9YdjB0Zk9LQjB5WkRCUTVWSzBlY2M3S0tGQ01BY2thRkJxb2ZlWmZO?=
 =?utf-8?B?cnNiVXkrTXVGL2FQbzhsNlkwWkJPc2JPQk41MjJETGFrRWx3a1JXbnRQZGhG?=
 =?utf-8?B?NzRGWG1BbEk4RktIM1BTNlp3V0cwRnovcUprek8vMXBJeXY3UmZiTXBkbWFx?=
 =?utf-8?B?aDVheml5S09hUHdoQWtCRFFWWUxOZWREUFNCdC9iV25WUUN0MDhLYS8renRG?=
 =?utf-8?B?TEw2TmU3cEQ1OUc3QXM0UWdRNFp4VW42VWZwY2hBbEVDVVJLdWg3Vmo2N2pa?=
 =?utf-8?B?N2d5NnBTblQyZzVsV2orKzBEbzM3dFZleUU2cXkzNzQrRmdORFVHS3JMUi9U?=
 =?utf-8?B?cmpWWXEyN3dWdzdIcHpkbXExN1M1c29CL0pURjdwOG5nSEY1OUpmcFVkYnlV?=
 =?utf-8?B?OThJTVI0clljZFBSamxjUTJwSUZkWWZwelJQblZyWm53RGQ2bTFURGFrKy80?=
 =?utf-8?B?bG9uYy9uTDJmZUNiOURwRDIxYXVjTFZBNnVTUjh0QklicE45Q1h5b1N0MEU4?=
 =?utf-8?B?bXR2aDBKZGxOblFIRUFhWVpyUWgzRWFaeXU1RzhuVlFZVVhlekFJaWlwRVJo?=
 =?utf-8?B?enQvR1RhNVlnVkNrbm9GZ0tlSE9Zem9HV1VMZmV1bHdGZEdzOTlXbWY1NnNn?=
 =?utf-8?B?SGk4VS85clVSVmVnS2JVU1FsbEpHbVA5WngrNUJ3NWxISW5ZaVk0OW8wbm9I?=
 =?utf-8?B?MXM5aHlOeDhEdE1sa1RRc2JaT1ZzOTZGUGN2RU1ONkozOXcwRGJYdnVYQ3Y3?=
 =?utf-8?B?M2YwMTc2QXlnQWJ0SnVOYVE0ZTI2SEV0a09jSEZMNkNZTVJLUEtHS3ovVm0v?=
 =?utf-8?B?Y3cwSW5na2l6Wkp4YXlMN2RaTmtOZGRSTk84VlE4eTdISDlSaUFtTjhRTWFa?=
 =?utf-8?B?aVhyOUdnSjRkTWxKRXYvVjBJcHB1S1hzYWhoYThxV1pEUFNaNWhsc25TOEds?=
 =?utf-8?B?Mkg0d2o0S2FmVEs1aHBFa3lid1ZOWFRhaXczRmxSZ2ZpZ0tXRHZLZzNmdU5B?=
 =?utf-8?B?dU5uUmo0QTU3NkREWlpaV3NqWDB5d0pTRVZ6Q1lMUytXVkc3SS9pQ2Jpd29P?=
 =?utf-8?B?eDdHRDZNZ0ZWMEVtZ3dkdlN6elZQam5YeVk2UjVBbXdvdUFKUzRjVGFaWFhI?=
 =?utf-8?B?Z2VZL1V3TUVqYmhWaTg3REFRUVdJVm9VbmpWOGFKR1BkUXlmRklyc3lTdXk5?=
 =?utf-8?B?V1NPZ3FXNHlwdkRBZDRFZ1g0L25HN3pWdnBQR0V2YWNxaWlGUGFBRmhlc1ov?=
 =?utf-8?B?MkxtczA1ckRuWHk5eWpCdkJ4VFdTMWQzdTJSTHlyYnNrME1zNFdBQTdyRG1Q?=
 =?utf-8?B?VjRKZVI0ZmNRb3pRMWZQR2Eyb091TzJ0ankvTGNRNnFvQlcxQ3d1Z3l1dmYw?=
 =?utf-8?B?bHlkU3FaTVl0M05nY3ZDZGNGclkxQ2dzejhLbTkxNVR3QmJSL0NOZ0psc0lU?=
 =?utf-8?B?aUZpUnlyU0paN1dVQm02ZkMwNmoydlRqRHBrenVYOWphZHBGSkFjSDgyT1l6?=
 =?utf-8?B?dDg4ZFUrMGE1bWROa3B0d1BubExRMVFHKytUdElPTGhhOEw2VEdLL2ZtV3Bt?=
 =?utf-8?B?T3ZrSjBjNHlDTyt5VUxRZFBHRllhcVF0V1JDcHZNSEdLalc1NVp1Q0FBeUUx?=
 =?utf-8?B?NUJrd241TkdBL0VDcmJDRlNSTzdwRXdVWGZvZVM4b25VL1BzUkNDUStNMlp1?=
 =?utf-8?B?Q1d6Y2YvMjMzWkVNbmZGZmNHSDIzQnF5Y1hGOW9IcXMrV2VlRFljcFdUcm5w?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Bw0T1e37RSyTgSuc+5/6kwCD2HGpFk2BIlVjzvrodQnEx/rjvF3/mfmsAZlUbuSYOzcq0YSqq9rpSa88vqYmA1rQjaQYPfj8eYuN2zqzQ3j2vKbGykMNEilGZEoDmgSlqaMTja8F/rDCnT5jSfLqhb7f+Shb4tT/jt/8mlzACTJ9tw6QxHnNKIh+zlMlF9C21sjIqTbv8C7pRZfCKRnBp60Uj23ZnD6UIhGUtSwbXRwHzNE2XDyIBJz7CrwE4elYnBni29BFAf82RgSUhgMmSS0wN2yjHtafTtsl2TlY1+9SmNXjUZKhC1ZII/Zol0ZWLidpgxcHe8AIbbqWElPuXYFQanZhuzrq3tDhOR8p/uUo5ccxIJ200fywLj62tX4aMSsuaRKZ0nrhD7RiMVlWBpifRlrYLMGBgS+JxukNTPo/iPNZ5gNVpL4Yw0LemmvbXYbOx1hO55K3wqgoRhDImDu6fBn7sbEICErC48Hj0xfcKsBHLotScrJ/8SqeNI1+8YwH3Di8veO9oYvcgZaMDL/cpxw+8HvW7WgLLtksBqbqRtTWWrI2kVZa9OfCF9/wo8iLf7uPaeSa32XaKrmbE6JPocO0U0DJlHqzqSsCwa4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07762c9d-3652-420e-2ee4-08ddb25ed0e5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 14:04:06.1578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bq4OJwl6/hgyps/ZFsFjYZvZoWIustnAEsTW+jQGiBwKDK9tBDWQXKSgXvQn7Qc7AbjD4iaccjPxihvYCneB8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7561
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506230083
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4MyBTYWx0ZWRfX1Cb0u5I6Ju0e jHbT0kcSiHV0k+id4KP/2COqAOEgA1YgaCymJNrmNeCyB10QjNf715yvcQv1M0byPyD58whwyMU gSOcVirkkynBvMFqwsh5gk1E3kWOJhbf9ko7DJtd9Qv7WhbLQoqG6GS8txT1v1vHqK3lbzmoAT+
 5+KAdIzuy4Qd4ZfpHZ5XR813G1hHqwF/v2DAHV0oIxr+pixqSxPMQnVYNpSUz8JpadMJawI1NSC 5d0GKBWKPh2XKyyEMN5dwLn205olv212iKrTc/57cbjwdkUc2tlsWZ12+HxGL0liA32dV+xYiAi /OcOJng1WYcSpC/kzV6832YQDmYRC1lDTdKkr9a6n3vwr537J0MUumz2A0wSnGco4qYkafnIvhQ
 YCLeSDA91HhKg+1RlOWT0U5lLpbVeIACyK2UdVGRxjpEJ42vD2zgAyzHthX/Re+EOeCRGSyC
X-Proofpoint-GUID: U8ovk_3n03MhkpYlJ4-rnrNzr2knSZBv
X-Authority-Analysis: v=2.4 cv=QNpoRhLL c=1 sm=1 tr=0 ts=68595edb b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=oJxJmM1qSA6hj6xqOv0A:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: U8ovk_3n03MhkpYlJ4-rnrNzr2knSZBv

On 19 Jun 2025, Kris Van Hees uttered the following:

> On Thu, Jun 19, 2025 at 12:20:22PM -0400, Kris Van Hees wrote:
>> On Thu, Jun 19, 2025 at 02:03:56PM +0100, Nick Alcock wrote:
>> > On 16 Jun 2025, Eugene Loh verbalised:
>> >=20
>> > > On 6/13/25 10:33, Nick Alcock wrote:
>> > >
>> > >>> Note that we declare the skip count volatile.  The compiler might
>> > >>> optimize code that uses the STACK_SKIP value, but we will subseque=
ntly
>> > >>> perform relocations that adjust this value.
>> > >> ... why doesn't this apply to every other extern global variable in
>> > >> get_bvar()? They're all similarly relocated...
>> > >
>> > > Right.=C2=A0 There is potentially a broader problem.=C2=A0 But we si=
mply do not have evidence of misbehavior in other cases.=C2=A0 Ruggedizing
>> > > other cases could be the subject of a different patch.
>> >=20
>> > Aha, OK. I was just wondering if there was some extra reason.
>> >=20
>> > > The problem in this case is that the compiler seems to assume &symbo=
l!=3D0, which is reasonable except that we violate that behavior
>> > > for our relocation tricks.
>> >=20
>> > I wonder where the code for that is... plenty of symbols have value
>> > zero.
>> >=20
>> > But, really...
>> >=20
>> > > Consider the C code:
>> > >
>> > > =C2=A0=C2=A0=C2=A0 uint64_t dt_bvar_stackdepth(const dt_dctx_t *dctx=
)
>> > > =C2=A0=C2=A0=C2=A0 {
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bufsiz =3D (uint32_t) (uint64_t) (&=
STKSIZ);
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *buf =3D dctx->me=
m + (uint64_t)(&STACK_OFF);
>> >=20
>> > Hm...
>> >=20
>> > extern uint64_t STACK_SKIP;
>> >=20
>> > So we encode information about the stack size and skip value by encodi=
ng
>> > it in the *address* of the variable? Is there some reason we don't use
>> > its value? unlike the stack offset, we're *using* it as a value, not a=
n
>> > address...
>>=20
>> The issue seems to be (and perhaps this is a cross compiler problem) tha=
t e.g.
>>=20
>> extern uint64_t PC;
>>=20
>> and then code accessing the value of PC (e.g. foo(PC) as a call argument=
) will
>> yield:
>>=20
>>   50:   18 02 00 00 00 00 00 00         lddw %r2,0
>>   58:   00 00 00 00 00 00 00 00=20
>>                         50: R_BPF_INSN_64       PC
>>   60:   79 22 00 00 00 00 00 00         ldxdw %r2,[%r2+0]
>>=20
>> which shows that it is interpreting PC as an address to a symbol, becaus=
e it
>> loads the address of the symbol and then dereferences it with offset 0. =
 So,
>> we cannot plug in the value during relocation because the only value we =
can
>> put there would be an address where the vlaue can be found.  To get arou=
nd
>> this, we "use" Tthe address as the entity to store the value in, knowing=
 that
>> we *never* will interpret it as an address for these specific externs.
>
> Not a compiler error - since PC is extern uint64_t PC it *is* a variable =
and
> so it is present (and accessible) as an address in .data in the location =
where
> it is actually defined.  Since we never define it, we don't have a .data =
(which
> is fine because we only use this for constants known at link time) BUT th=
e
> compiler of course is free to assume that we *do* have an address to the
> storage location for PC and thus that we get the value that way.  It does=
 not
> know that the value is constant.  So, the trick I use is needed to make t=
his
> work.

I'm just not sure why it's assuming that its value cannot be NULL, given
that you're not dereferencing it anywhere. I guess it's because it's a
symbol, but that's only a guess: I haven't managed to find the code that
implements this (?)optimization.

Anyway, this is not an objection to this patch, and a patch changing
this approach to something that didn't require us to throw volatiles
around and hope the compiler doesn't optimize things wrong would be a
separate patch anyway: you have my

Revieed-by: Nick Alcock <nick.alcock@oracle.com>
