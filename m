Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE3D3D6F
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 20:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752177826; cv=fail; b=PFe3XIXAczxJbEeYG5YbfyQ3KNjxCzK7dDaH/tW2GV8wKdAL3Vo/MofTWgv6WC/QaXmhpErevnN4LPOTp6t/mZjWYHP6f3/UYXoKksbN1Kqlo2lZhIp4JbM99Tw3y4SQf8T+Ch0QurmTqu5U3SrPlGh7rsKXo7Omc7uHptUIBc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752177826; c=relaxed/simple;
	bh=Y+tacfbCwAEQG7aWF5PUhUjmODYZH0AJwVVIyVePj8s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lzUaS5Jt98cY84f5QF7ucpVEW8S1NbKVFaFcMFTeAxoTdlD4yJbIgGhO3krd9dwhgmSfLEb6Wp2fosdkvqi2+OVDkB0RlyQda9W93vACHfM1smsulYslCYdY5556MQQXIi1RbMHpAmR19vYfIf6i98W4J4WdfJQHfWImxFVuZuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JxHBciYW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZcpuXoHX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JxHBciYW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZcpuXoHX"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56AJpi7l021234
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 20:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=HRYCbc8vPcXjZnWgzYfw/gOYC5X7eXXZVc8G2UD2kI8=; b=
	JxHBciYWVzuc7BgvXttrurympf/qleXkNTrvRlAo+bcwjiQantKCCCamN0dn7CBd
	bSWFAMqOk7t5G76HGs9S2R07NnJHs9nBTkP6IMa3LTQOAgcKD7RZTmsDdpHbdNAn
	5Kd5HWzoOGUkuHSj4AVXMAJjrZpR6i7cG6WmhcpqDaeMChb+l3WfMT2dvwmBzZKF
	cXyyLRcyvA+0C9Je/gn5ZBU0ZdlvwNoOWMBNytAI8AEc7nKtdDe3BbaRoW/QQ3cq
	EOZCNPLDXEz8AlTomg9dDLBM2zji9n1iI3uufw2qhyoipXTam7KP4/n4rQw5mk8X
	k/XkHhBJAMh0B4uJtxqMvA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47tm1xr0nm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 20:03:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56AIKWxo014170
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 20:03:42 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgcruha-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Jul 2025 20:03:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIyAvQyQFW0B/bV9q3hNB31Wom5S/nGKVLxSUU+38BSpwK0ad2TUHTnWs3m/vpSvNwYg9pJiXMqpA6W78dIVpqF7NWCLNkKbBxb0Eaker/5W4wl0JFiJ5fiybzgpe7dBa5nqz82HiZE+8yIgz1w+ipjZx4gnlLuhd0TbDyoYGFmKH53cRjsFRIed5Ty4AYxCpYYsMIVQjCnHHyVSWuTmQ6qtBt8KnIHhbGSlQDIEeK6Luo6BuY57KevCzX24HWJQcVXHHLgk9XQ/PZtM+aHKnMh4V3AKJHMTA5qG1dJNcJzlr6/sqb2rETe/UUv3zIFvQYtwXSUkTkMJEOLcbCcFqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRYCbc8vPcXjZnWgzYfw/gOYC5X7eXXZVc8G2UD2kI8=;
 b=WL3wPli5WovGl3ZnvnrPkUN4RucdkbSZrylZwknp3EWtog4ipkLEpgfEzo7EP6HkeRG4zms+FvpbnGGZo90A1ibk5y10mY9xLITTprfz6DyQYJcpLFnnpNmEljhNTbNrbvTTUVcHxSJcGyj059QB74nOvd6bIYEd9VF5Xje9g+hS3p/3uOaDhaCRnQV3dVA7vijnX2YmEAevKyOsWecgD1MK3oSInrFq+2Mt0Dp2Du7G5xi4oLtdAvgyFc9BoAeB+e22mnPIfXOj3CRJGh5HAOzB7dcTeRZQkl9GRue8IDOtfgyD/msRJjJqKQizl+xgJQhEErkOBV+0bwfuCxU5ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRYCbc8vPcXjZnWgzYfw/gOYC5X7eXXZVc8G2UD2kI8=;
 b=ZcpuXoHXrAXVPUiSfEFBbBBO7fc+kl9TfqfnqcMzPMwENUQoQ6RtocVlUCsOSK7OP6mZX+45YaFJurj0neGQcCXzpA7XERvqlugfU2hgBQJn3AZJKI4d4qbO5/ZoMMboYF9qSFsu8dy6+aZLPFBSfIqKqFqrFREWveKri26F+UA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA2PR10MB4476.namprd10.prod.outlook.com (2603:10b6:806:f9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 20:03:12 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8922.017; Thu, 10 Jul 2025
 20:03:12 +0000
Message-ID: <1333109c-48bd-8e96-b16f-0d264c950e04@oracle.com>
Date: Thu, 10 Jul 2025 16:03:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] test: Skip err.Z_no-w for now
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20250708045257.13808-1-eugene.loh@oracle.com>
 <87ldoyev5f.fsf@esperi.org.uk>
 <4677a328-8622-794b-5273-f0aaa6d12032@oracle.com>
 <aG7/DBUnMDy1PVVS@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aG7/DBUnMDy1PVVS@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR05CA0079.eurprd05.prod.outlook.com
 (2603:10a6:208:136::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA2PR10MB4476:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d6423b0-8872-4313-58f6-08ddbfeccc2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVhrMTRIRWVHdm9BaXJMWm4xWWQvMGdqQVNKaWdaZ3Y3R1V2dnlwT0RFUVY0?=
 =?utf-8?B?dVdVenMwQUpxSVlHV2JlUmFieGowbFc0UDVWd21JY0xjSzJuWkRMMEl3bExU?=
 =?utf-8?B?M1Zka0tKa3JEUUJiWTZUNUwxZE54M1hKRDd2MjlxaFlCVjlnMWhNbE1KcjNk?=
 =?utf-8?B?a24zQ0Y5aGF0NUFhT0xXd2h3NVY4TU43akp1ZVZmeWhSU2pBRUFkT09WRS9C?=
 =?utf-8?B?bE8xQndLRnlrQkRLVG51cFhXRG5PVHphSTFFcGc2SldzMHpVVlJtaTJ1bTND?=
 =?utf-8?B?WGdDWWRZL1pkYnc2NDUxSHROOHN4R0Q0UmpVcVY4c1lSMXl6SVludklDQ1cx?=
 =?utf-8?B?ZThHQjZUZCtlRVNKdm9nVjhPRUdaUUhMalpPOHF2UGFBQldIdXhZZUxDNW5J?=
 =?utf-8?B?WlcrVGsySHJ2dGwybitJV0FibkNMeVZWTVlYVDlSd201Tm14YlNCamVZTlBw?=
 =?utf-8?B?WkhhUUVBbXBFaVB1UWFzdG5Lek9nZVA3Q1JoZ1QwZFZrS0F4NlBkU01OTWRP?=
 =?utf-8?B?bVUzYm9yZ3ZxdHN6SGVLYTY0ckFUYWcwWE5ic3Vjb1gyaGFkSjUrU1NKa1Fv?=
 =?utf-8?B?VHhCMCtPY2pNSUk5dURNLzFHV2pKRWhVdDBrUGI0T0t5b01VSGo5eXpVeHBY?=
 =?utf-8?B?ZXFlQjNyN3RXMklEUk83MG9hQzdVeW1Kb3U0MnBOL3lrZTJ3OXpCblB0S1VH?=
 =?utf-8?B?SEloUTg5K1JXTnB3WVlEMUlRZ0lFMDgxQ2NKd1VPQmZvdFd4MjhRd2I5OXZY?=
 =?utf-8?B?SUgrWlRlUVQwaWRVbGVyazhHcmN1SlJBS29YY0pQazBPaWwvbXRHYm9Takdr?=
 =?utf-8?B?SGxjMVFyTFRKSlZkeklET0Y1d01kRVNYQlhYbmMrT2RPb09icWxzaEpHbXdk?=
 =?utf-8?B?VU5STFM1dXV1c2lFMkdmVjJ2SjVJMmcvMWsxMXlGVkI3YkV0eUtZcUwyeWVW?=
 =?utf-8?B?ekZnVEVjMXJMSmZlQlZ4ZTdGMUlwUGZlNERkNlhsRDQ4ZHBLRkFUM1V6b283?=
 =?utf-8?B?Ym9IMXF0dU13WVhTWFJSSVNiZ0FPajRVa05CYVhqQy9Xc1hKQ2U1cS9tUnJP?=
 =?utf-8?B?TVJhUjNYeVp1Y2xaR1l4aHFWMm9BZUxrSDFOaGhCRXpWUjZlMGg2MXJWMjV4?=
 =?utf-8?B?dkdoQzIzUzVXZy9EVThVRGIwUmpYOEdUZTU5bUlFMWhRSk5DYW5UVXpOU1hk?=
 =?utf-8?B?Y2dPRFFFb2xwNmNCMWlQQVBxZUFLaHFXaml0bXMyVFptTU41dmkwMTA2MjF3?=
 =?utf-8?B?YVFvS0I5TFlNd1NjdFJGamJXcHVHbVFIOFhBTk9oWEl3enlPTVc1WXNuUFhs?=
 =?utf-8?B?MmNUUmRZQnM5cGNUZjkxTVlUTWtXTXJvamkza3RVc1lCb0o2SHVHUG95ZklE?=
 =?utf-8?B?UGVwNW5qOTZ1Mm9OOHloWXcvT3ZKaFNEOVVKaUpuVFB3TkFnT2pZalFPQTR2?=
 =?utf-8?B?ZDVVNzk0c0ZCN205WmhNRFNCZUNBcmIxRk1PTmlHclg4d3U4b0lQY1RhV25x?=
 =?utf-8?B?dXdPbG0xWU1lYmNwVEhSQkRWNU5oZzd4SjBUbVByOWZsZGJjY3FQTlAzcUF4?=
 =?utf-8?B?UXN5dk5yem1KYkVuY0xRU01NSUFOTWhQdHdZNGExNkZmR0hZVkFCcWxXVjVD?=
 =?utf-8?B?WU4ybE85K2NkSUZ5MXZkNy9SdVFwK081b2xaOTZMN09VMUVKVnpoK1BqVHFh?=
 =?utf-8?B?SmQ0WkVVQmlrNWJkbW0vbjhPdU85aGF4Z3pmTTBSRHdZeGkzZVZzem5zVE1N?=
 =?utf-8?B?MGtVMENyZW03aFJUQ1hVcldmMEhGN3dKd0RFQ2FvbkdmK1dpZDRyZWFIeWZs?=
 =?utf-8?B?SUswdHdBYUN1RDNYamVjQmNPUFc5QllzTStQTnUxR3Vjd2tpYldYYW8rZGtv?=
 =?utf-8?B?SmFoK3JGR2twWlRWOE13L0R3TmtqNDIvaTZic2YzOFZ5T2VBemxjaDlsaVBa?=
 =?utf-8?Q?Xn7J7LpADBU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUJmSnh2b1FLTFdJZ3B6OEE0M3BrL09McGcxc1hiQ0NEeEx6OTBrekJ2Qmsy?=
 =?utf-8?B?b3Q4bWI1WjJZVFlTNjRtdjczeGtjS1pzOEJUbnJHMjBzOGxSN2VmdElVSm9r?=
 =?utf-8?B?RXRrRVRXYzZnZkovSE9YbUpHeFpPZXRiUmhGdW1PMWMzbUVBU3ZmR3hDaDJF?=
 =?utf-8?B?dlRGbUlkOW5wUkRUN013TWdGekZndit6bVBXZHJkWWE1Zk41bmZpYVZYMU8v?=
 =?utf-8?B?M0xQZVMvS0RySVRIMkwwVzJBam1WSUc5MlhEYTRLQms4Wi8xSGtjSHdwVjF2?=
 =?utf-8?B?dThDaW5ENDA2V3hqODdZcTZRa0xFM2hBZ1VxS2F3T01PQ01GcmRnOVFSQmJp?=
 =?utf-8?B?aFIyMFJQeVVvNHJxTDBpS0JDRkQ5OXlNc1VnV3hERUlma3UwMzhUUGZtVi9O?=
 =?utf-8?B?Y2l0dmpJREo4bDNHd2U0OTRnZC9WNlZjNDJIejBQcGVSWGExSWRoMWpQRkts?=
 =?utf-8?B?LzNrK3hodUhBNGJrdHVINXhvaUttTmZMWmlQd0p0TkY0eSt3bnlDNXBvUUtE?=
 =?utf-8?B?S0tMeEJQS2ZYbmxwcnJtS2J1a25rWXVKbnhHMXZhTW41ZHFhdkZoSkJlVjdN?=
 =?utf-8?B?TkxRY0ZrMnAvVjdUQzJtc2xmeUcxUHdKNEZWUitCejdaeFY0cTlQMG4yTUts?=
 =?utf-8?B?anN4RktZY1RQVjlGQ1ZDcUZwbUpmQ3J1bDhCS3BTeDRqS0pmNGVud0lWN3JH?=
 =?utf-8?B?YTFjYTFzZUFwejZlR0Jvck9kczhQcUpQSURUdWY2YmRWanFuVFRyTWxycmRW?=
 =?utf-8?B?OG5mb2ZYd3VWUk1VRytOeWszb3ZjYWRaODdkNG1jTnJTU0RjWVlkeTh1VEM1?=
 =?utf-8?B?WDQrK1oxY0lQUmdRWVJiSUJjMldxaURyM01XUkFGaE5yREZMTHBDeGMvdUtx?=
 =?utf-8?B?NERyRDBQTko2YklzdkVUdUpRT0kvb044U1pHZHpnTGVQcHlZa0NNQzliTVhJ?=
 =?utf-8?B?SlluUDdjSDgxQVZwL3JldkJMRHE5NTgrZjdLYXNkM2RFSWpXVE92Q29QSDBx?=
 =?utf-8?B?VFFaT3dqWThKYnV0NnZ4Ymh5OTRJMWJxMXZlb2dRN2U4ZFBnVGFKenNLM3Bt?=
 =?utf-8?B?VWtpaFdDL3ZCWmpjQ21jQ25EeG1xUzZsSDEzQnR4Y2lGM29maWhDS0lOWmZB?=
 =?utf-8?B?Qk5oRnRsZE51VzUxSFZ4MHM1R0R2Zk1XbXQ1dFFDV2NyN2t2U1ZTZitmeFRp?=
 =?utf-8?B?YlFsZVNvUFIyTDV3UDlxc05JM0haOWJTcDVoeHVwN25hRUNub1hMaHFnV2FK?=
 =?utf-8?B?bkZvZkZNWWRzZzJxbEYvUTIxaHBmNkt4VzJNakUwaXluR2ZFcXNtSHdBaFhn?=
 =?utf-8?B?K29ST0dQSW0zNktkV29CaDIvU25qR2pZT3hKNzdxdHhVVFhDdkMxaGpQOGhE?=
 =?utf-8?B?RDFMZWhveHFXVzBGTTV0Rlp5R04xZm14dzA3R3FlUW9wUWh0eGlyWFNHRWQ5?=
 =?utf-8?B?QWs5dXFGZjNCTXNhVENuVDFYUXEySHF2eVdjNkFiSXVmNDhUMUViUDRRbGxO?=
 =?utf-8?B?S0RsTzhUYUQvVEV2b0ZodC9JSkZPSTdVRkljMGJFWGN3Mm9WNVZ1OXU3a2dx?=
 =?utf-8?B?M2s2eEdCcjBJSnZ3dnJZb2JuRzlwR0IzdFV2SVJhanJWTGhUaXhDck9uU01u?=
 =?utf-8?B?U0ZSTW0yVjJFdFlBc0FsS3lMam1rcGlSMFEzQS9TUGs4bGt3dUZkWC8rMi95?=
 =?utf-8?B?TjMxVDRUUDFKZ1crR2hHdXYrWkU1WmZ1UEpPclphSVNuc3YzaGdkcEE5SHZR?=
 =?utf-8?B?bmE1WlBBTFF6bkhBeDB0TXFHam9HTlNSaDFKY3RnUmhZd1YyZkg2eDVkb3Bz?=
 =?utf-8?B?SUc2d1B4Yi84MStzYTNMS2ZZd0dPdVBGRHBWOW9nUzk0VURhUE9yNU1ROG05?=
 =?utf-8?B?cHlaYzZteXNUWnB1UmhZWk5HVTJoanNCN0ZySWd5TVQ2RnFuS1VELzRzM3I2?=
 =?utf-8?B?emNRTmc2cnd0aTVpVmdXWlZPSURpNHl0V21NUkpuU2M5SS8xVjNscGFGMWl1?=
 =?utf-8?B?MzlWcTl1TnlQM3J5RERBdlFJTW5WWndVelErRkNseEZwTWkwY0x6VHFZNVVu?=
 =?utf-8?B?czR0ZUZ3V0JuTk1uaDVUMTg1T3dXb3dXb2ZTdEx4N3VVOERSSEo4VlNQVk42?=
 =?utf-8?Q?47faoUfyZnBe3Xc8C5eSmlWd3?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y/ve09mESiKIxG3h/TO/U6oBLOYlSnq0YeQN117qHepyHCfWlbia8uepMLjYwMQPoEneCQqmUkB6plDmcJDcYD6pXk06CcwWJhZdnxxWNTfTAV/Q0FkSvS6EL983czd/ixKTI+qwLdZUXJyER8hWhqDMx8Bdjwh++c4YpVfKQYCjaPOypsw75L/yjCwR9Ra0wyIbFW2tl60UPMfrXujct5HlTRvd4Y/2azXTb/8PByQ7WmfCg5No184P2225YGr/3lKToKlKZuf5rkqf9EFe94VTJ0eqlB9WdSKOs6PfxJmjLlXKUoP8TvCkMnYiShsUgMqQ9N01Xyf+xJTIBIQ6/+Cjm75anlhfhBL2CC/iUJJprxGr12M7P/ptVSggAWRMU40VYYd3u1ItYplFDacTTJm/Vel8pyhGCTK158ICQyI+XkCic0VUFFP2bCHJQlwZ9qHeiYhsPDaQTwpPQNyY8xobKadYSYLWpmEZHyx7mxMar6pu22Jz1mPCNiJMKSB6tZq6V7H7QCkZtDjiyGXyz4WIwFcrk3vVDoKDciJ8bF3PJ24SX7vUqu4raw4TNT0hXFdDX+UU0fh6/XjCpEEHfq37b6fNUH9sRc9chAAENAk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6423b0-8872-4313-58f6-08ddbfeccc2b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 20:03:11.9431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ud+IojrL9Nqx8J9bsoPVAvnA33FcV3vWPvD3O0SDSK3Ie6gHGO9T0tUrFouQ7rs5X7qvq0ESKM+fbEwD5VuBWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4476
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507100170
X-Authority-Analysis: v=2.4 cv=UOrdHDfy c=1 sm=1 tr=0 ts=68701c9f b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=WCwoBmoCnJWgRMMPISYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12062
X-Proofpoint-GUID: sxR9w8k0zR1mGKIbodseAkzGf3JNn6Er
X-Proofpoint-ORIG-GUID: sxR9w8k0zR1mGKIbodseAkzGf3JNn6Er
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE3MCBTYWx0ZWRfXyLiOG3cvWLPB dDOJUGrsR2HrFxOtyyTtbDPZ/1xuADn2hHTbTOHwXpLY9R4WHI86zp54MXPEoSS0T46MSH+DGU7 Q7nsjhtQFVdiybQW5kCnEr38ofjSPB5HHJajj9Nm3AiB72lqQGtDJxd6rxovBcqjbkaE+5nxWna
 guI5y46RJQ6Hgcg/Dl9dgF4vGdt+1AMzr64tKU86xb7Q/ufBSDxwcVeemow7Urg2xZsOIcE21Pr 4g71RuNyj1EiY01Tr2wOP5GIC4aa6kSFeIfqW1rs4PP3tKr9+5q6jyUIBgVFNDj6x0TnONTsfVt HZBlLJFJVBJZt8NYenWAUHxxODmirfxPF1c0ZCNh2oNqJTZnd0+waC6rtuDeWQbzMYEjsvfDs9U
 8lUoIbSyAwucSyOUSMmpQLoJ4tAQX09zgg9lEHoHWd9B+RTMDBQCbU6bBFlc+IZKLhzl+ZdN

Okay.  I'm withdrawing this patch and will post a different one in its 
place.

Your first proposal sounds great, but I'll go with the third one (which 
you recommend) in order to mimic Solaris more closely.

On 7/9/25 19:45, Kris Van Hees wrote:
> Yes, this is a bug.  Solaris (and DTrace 1.x) would load all the DOF into the
> kernel, even for probes that are not (yet) available (when -Z is used) because
> the discovery of probes happened at the kernel level.
>
> Since we do it at the userspace level, we do not load BPF programs for any
> probes that we cannot attach to (yet), and therefore the destructive action
> condition is not detected in this case.
>
> That is obviously wrong.
>
> There are a few ways to handle this:
>
> - Report the error at compilation time, i.e. if we encounter a destructive
>    action during compilation and -w was not set, we report an error.  That was
>    not really a valid way to do it in the Solaris days because you could compile
>    D code and save it, so you wouldn't want compilation to abort due to a
>    destructive action because you didn't know yet if you were going to use it.
>    We don't have anything to save compiled code right now, so this could be an
>    option.  But it would change the error from a runtime error to a compile
>    error, which is a change of behaviour.
>
> - When we are ready to load programs and start tracing, we can loop through
>    through the compiled clauses, and if any use destructive actions, abort if
>    -w is not enabled.
>
> - We could have destructive actions trigger setting a global flag, and check
>    that when we start loading programs for tracing.
>
> I think that the 3rd option is likely to be the nicest, because that flag can
> be set during compilation, and if we ever implement something like saving and
> loading compiled programs, this would still work fine (we would process BPF
> programs that we load and set that flag upon load if an instruction is found
> that amounts to a destructive action).
>
> Thoughts?
>
> On Wed, Jul 09, 2025 at 06:39:31PM -0400, Eugene Loh wrote:
>> On 7/8/25 08:15, Nick Alcock wrote:
>>
>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>> It is unclear what behavior is desired.  For example, consider:
>>>>
>>>>        dtrace -Z -n 'BEGIN { exit(0) } foo:bar:baz:bop { raise(SIGUSR1) }'
>>> ... isn't the lack of semicolons here a syntax error? (Or have I been
>>> inserting them pointlessly all these years just because awk needs them?)
>> I routinely omit semicolons.  Okay since even Solaris.  E.g.,
>>
>> # uname -s
>> SunOS
>> # /usr/sbin/dtrace -n 'BEGIN { printf("hello") } BEGIN { printf("world") }
>> BEGIN { exit(0) }'
>> dtrace: description 'BEGIN ' matched 3 probes
>>   CPU     ID                    FUNCTION:NAME
>>    51      1                           :BEGIN hello
>>    51      1                           :BEGIN world
>>    51      1                           :BEGIN
>>
>>>> The first probe exists.  The second one will be ignored.  Solaris will
>>>> reject the script with:
>>>>
>>>>        dtrace: description 'BEGIN ' matched 1 probe
>>>>        dtrace: could not enable tracing: Destructive actions not allowed
>>>>
>>>> On Linux, we have:
>>>>
>>>>        dtrace: description 'BEGIN ' matched 1 probe
>>>>        CPU     ID                    FUNCTION:NAME
>>>>          0      1                           :BEGIN
>>>>
>>>> Perhaps both behaviors have merit.  For now, just skip the test to
>>>> avoid test failures we are not ready to arbitrate.
>>> Does execution fail if the probe exists but there's a BEGIN that exits?
>>> I guess so.
>> Right.
>>
>>> So the interesting question is: if you start with -Z and
>>> specify a destructive action in a nonexistent probe, and then a
>>> USDT-containing program starts up that provides that probe, what do we
>>> do? If we don't terminate, that would be surprising. If we terminate in
>>> the middle of execution, would that be more surprising than checking all
>>> bodies at startup and failing early?
>> I think I finally understand what's going on.  The point of this patch was
>> to move on to more urgent matters, but there is maybe a bug here I should
>> fix.
>>
>> Solaris rejects a clause even if it's not going to be used.  E.g.,
>>
>>      # dtrace -Z -n 'BEGIN { exit(0) }
>>          bogus:bogus:bogus:bogus { raise(SIGUSR1) }'
>>
>> Solaris says:
>>
>>      dtrace: description 'BEGIN ' matched 1 probe
>>      dtrace: could not enable tracing: Destructive actions not allowed
>>
>> Nevermind we do not use the second probe description.  It's a baddie.  Our
>> Linux port has no such complaint.
>>
>> What about the case you propose (which is, after all, the question being
>> addressed by this test)?  Well, "it depends."  Put another way, we won't run
>> a destructive clause without -w.  The problem is that during discovery, we
>> might first encounter an is-enabled probe (which we "enable" since it's
>> safe), then later encounter a real probe and reject it due to its
>> destructive clause.  If you squint just right, you could see this as being
>> not incorrect, but it's kind of goofy.
>>
>> Ideally, enabling probes and their is-enabled probes atomically would be the
>> right thing to do.  That's a tall order.
>>
>> But falling back to the Solaris behavior of rejecting destructive clauses
>> without -w is the right thing to do, even if we are not using them (yet).
