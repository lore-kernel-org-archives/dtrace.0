Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD787EEDE
	for <dtrace@lists.linux.dev>; Mon,  6 Oct 2025 03:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759721651; cv=fail; b=JhWcb9ag+grM0eK8UjgAe17X4PdNHhasQM67b66TH5e1PQjaWw1kuWC2UJK2ZtdVXyZEHqIhgq0QGc2muaZHCktMWgMHBpWsb8awfgP4EgeycBtonWbT++lVsusWWXmykygqb9hRnK4mHUMx/+yLSwlqm8Q980jqTlGZoCHJi9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759721651; c=relaxed/simple;
	bh=iTco3LOgRPp1TRR10jwLSWS6VGn167cfNUFDbD+WUpw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JpoMqNCquoOk3Jiv7ADpYZhGJSNAdmjIv/BjE+8x+5nprmHHYS2OKFS5yisEeHYZoYuAW7gTuSS8Keh/cj5M3HNBwJ9SmdQV0bWjJeOMx6ux81138rjEs0a1JLAstJxnIQmmqzMsmsqjeyYgRgjXSn3yT7MabM3uA07NsBxYIhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UJ9flCF2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rQWkgiYD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UJ9flCF2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rQWkgiYD"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59638Nhl011571
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 03:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=pBcLXKICGyqTzOhImjbWyJiw6Kza3ltndTENWMkoRp8=; b=
	UJ9flCF2LrLZ+TtDUZxHh7MDcMDFRT6+gcQAJUqct6LZaUNOTqMQ3NEX+mFZ0SXZ
	ZR1VqAUubBEnICVYcZ7Il3gCNDrXn8uDKZjgFjxajgNxOyN96ALHZou35bSWsAAB
	O8RMl9SknY2EUOlTW/Hp2VQrXmeH5+e0gOUNaxKhNljdMgF+XEFpnoknajLn984b
	NU78cpKx14wfVggc2xCk6dsssbnL2cMz6gX+Fcrs81TzKwqrscgA8da/j0pyM+W5
	bBULW3Hc+U/TUlsxYSijmWfJOGrksAs7gtrhTluBwKkwyzk4k41msVskwGOePBsB
	SK6C157U1kVDnaTTK8XMZQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49m4pk01j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 03:34:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59601HaZ035736
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 03:34:02 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013010.outbound.protection.outlook.com [40.93.201.10])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49kdp2xwhj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 03:34:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ta4wOqPxc8Y5C13Glj9kZIhH6V0YxwXbwbBysoDA4/xNTG7DfAy3f6s/w8WuWRFe5ju3xa8ykBnvLO68MFtMX1gWJi9S9bkbfSq5nRYJ1o4TcUzBPJm4ytrxK/ksSe5eXOj/qZmfsGr9gIJuAGhCKqUkoMdHZQMWvtH2barZo3lJxR5b4iv+WvgKTm7I/Zar4zjg5HERJ/1UKTtOTufhPhtBuJLucjE0SiFXHSyuz55jybgD66C5j5vR0k8a9//vah8sUJGNWoYWxIfl8+CwhplhbFDDVxPDZaiF20nHAOol/qFABTn01AFBK0HRAC5UG5vFvfAheA9Q77Krsi4YyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBcLXKICGyqTzOhImjbWyJiw6Kza3ltndTENWMkoRp8=;
 b=D0p+zQJA0PBCe0HzII//u+m9iJehN4ifrW+SXIzWPArv7XqOX/HUhj3u9NrgwuDY8f5J3Icc19oDiy0afQpicMnAxsTNCS6SSxFqX1MIyqEK0FZinrPfhHqsjxuD/wjjE2MX2jCW6K96wWBjaOZr6vWCR492aR8wN1R22uGbOwLCIQKXUH1g0oObTRAeg+qI2s7r7sHemwjlT3+Yuzl8t3UcCPbn0yeM0W+tP60R/Mo/lLBg7VGlkK50IeaUb0/3mLT8GTJR8GPatpklqsio0lvOcRvEY0sTuPmQMgGeYI/fhlGggiWuKC2ksFVrb5uAXk251aE9/naOVZ5gHNyokw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBcLXKICGyqTzOhImjbWyJiw6Kza3ltndTENWMkoRp8=;
 b=rQWkgiYD7T8kuUJYZtAnkK0Euh54L2o44oll/IEytUsVdSC9DtPaJQ7sBo9f19RVB0vkfYHrf+AAzDstls/+ymnJKjOyW8wuAgGgT2g3W5jOo6kPsAhOwXxdatI97PTCnn2WBX73sL+OEvMre8L1uM02vUm7tgVGRl9c91gLk40=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BLAPR10MB4961.namprd10.prod.outlook.com (2603:10b6:208:332::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 03:33:53 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 03:33:53 +0000
Message-ID: <3bc924a6-340a-61fc-5458-0f2e10d3a589@oracle.com>
Date: Sun, 5 Oct 2025 23:33:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] cg, printf: allow storing [u]stack() into vars and
 printf using %k
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672B68BCEDEE2F488AD00EDC2E5A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672B68BCEDEE2F488AD00EDC2E5A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BLAPR10MB4961:EE_
X-MS-Office365-Filtering-Correlation-Id: 16447adb-b193-4585-2ad9-08de04892c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFM4dTIxeDl1cFVXWGltMmJPc0xlMzY3TXplTXFqcHpkbWNXcDROUzVzUXZB?=
 =?utf-8?B?eGFTT0hUS0lhamtIOFlscjlrdUZMVGZZN0c4YVh3akRBbm5La3o0SFZsa3lB?=
 =?utf-8?B?YTdmdm5zSmx6MGF3RzNsSGR1b3lwRzBjSDdBQ2JRSDVVZFJYOVV0RU9SZEts?=
 =?utf-8?B?RDgwcjEzR1lrQnhGNzRJUWVUTEJxQ0NZUUFtNS9ybEpkQmJnWm9RVFMyRktt?=
 =?utf-8?B?RTAxOEw0MUc1VTgyUllSZGd5aTZwS0ovc1VrWk1XRTVQVVJqdUI1bUgxbGVH?=
 =?utf-8?B?cGlYMEpRaDV2R29XTDRYTUQwZEt1aGtBNmpMT3NBOXZCc0hwVW91bGNZN09Q?=
 =?utf-8?B?V2hDTnNDaXVrZnlZOVY1YitnZlNHVU0zSXJyYzliaTREOUpCQmJjTzVBV2lv?=
 =?utf-8?B?LzJqajFmNXhianNJd1B3MXVtbCs0QVhZUnpnT2laY2Y2V1g3aFcxcHNCbFgv?=
 =?utf-8?B?anVENWErVWhDWGhWYW1LQzB5TThjSnZ0MnVzeUVON002Mm1xdVRteS9BM3dw?=
 =?utf-8?B?MWdkTmhSVHlISG9oZU9wVWJZTVAvV2p3SGVZdWtlYUphMFROcnBLdmtpNWE3?=
 =?utf-8?B?cEd0VzN4VnBUMzhGaktnOTB4YjNqK3QvT2FEZW04b1ZOUVNNQTNVTUMzOGZY?=
 =?utf-8?B?cEN3NkhuUU56RHQxZXhvZ1JZaFhSTnRxcHFwSHJXcnN2MVhHRlVXS3Y2enR2?=
 =?utf-8?B?c1p6QjIwMXNOdlM5WWxTSG56dEtza2hoR0dsZFpCbG5yNENtV1drR2ptMFpt?=
 =?utf-8?B?UkF3cStEdlZZNXBXRjRMbEgyMkxkY3kwWXhPTEVsMDJaZlhNNU92NXFRQmx6?=
 =?utf-8?B?bHhRQUZzcGc0RXZ0YTl3VERMZDMwdytvbEZuUjNHWjdHZG45SmRhdVBud0pT?=
 =?utf-8?B?anhEd2dxZGIyZzFBUUpvWDZyMUxaWVNCSXc3Z1BqdFV4aHh3V05FWUV4NXlt?=
 =?utf-8?B?bVk1dkxEMjNycDlwMjZIWVB0M3dLTmVwQ3VPRU44QkIxMm5Dam5jeVJZSFVn?=
 =?utf-8?B?MjNpQ0dEOCsxenV3QnE4cUFvOVN3aHhvdEM0WUloRkxVZkpuT0RkS0lMUXNV?=
 =?utf-8?B?WUgrSk5jb25TcjNhcjZBK2svb29lS2JqU1VTK2NvaEdLdXZsRkZoY0lwS0No?=
 =?utf-8?B?YXNKTW5MaWlCMU9PaW1iUDBTdCtPRlI0Q1BxRXE1UU9mV3h2NVBDQm13Sndr?=
 =?utf-8?B?RFFYdklQWVFuZnh5NUkyZHNvVlBMMWZIN0ZFM081U0VEZ09ZbXVuNmFQQVVZ?=
 =?utf-8?B?SVFRdkdQTzVzN0w1Nms3TnovMFErb2xmZytQb2NLelptK295MW1QRGZ4RUVD?=
 =?utf-8?B?Q3JCODdqNExHRXd2bEgvZzhKb0JNQStRRkhNaE40Nk93bzlFNmQ3d1BpMkdO?=
 =?utf-8?B?NFd0aUlqbnJFU0g4bXhjTXlNVEM5WE93MHNFeS9jR080NndMeDNmdkxnY3hE?=
 =?utf-8?B?dGJ1UGVmVzBXQmQzcnp6MzZtNmhuMDgzMVFNbU9UZ05iVDZyVTdtVitLMWFt?=
 =?utf-8?B?RmdOUzYwT0RmQWw0Y3JYNTAzVVozZG4xeGUyc3JPOEw0MjBlM2NjdlluWDhu?=
 =?utf-8?B?WmIzaENoTFBMSEdaWXoxVyt2cnV0R1ovS1RqREphUDBtejMzOCtLaDdPZ3A0?=
 =?utf-8?B?enFmYUV6a1FWWjZzWXExY0xKTzNSQzBqSWJwTzVXVytpUXRJcnNhSDRvdEcr?=
 =?utf-8?B?dWRHRkphNnEvZjFqZithV3NlbUhqMmhqblJJSTl5WWJsZ3RxRklCbmRvQ3FD?=
 =?utf-8?B?S0lSNHBvWGtjajA2ZExMdmtVZXhXdXlNdWh5UDY2emx6V3g2VHhPcTVVc0dY?=
 =?utf-8?B?Ym1KcTZzeVRKUDBzUHJPQ0tvMlZ3VUFBVjMyOU5SNk9sWE1HZjlQZkNSZFVL?=
 =?utf-8?B?NE9xUE40YnpUUDdYMnNxeGJQdzBIbUlnOUVoK1d6eVBZNVgzVVNWdjd2b2tt?=
 =?utf-8?B?QmViSUZhckRRS280dDJmRG9iUE44UXBCNEpzcUIxTmxkVDBGakxhV0VyNjd3?=
 =?utf-8?B?aVFqVUhHaklBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2E3VU1DSlVqNkRQL0k4U1NEVGRLNU9yaG11NVRjSXNpZTBkUTloRFV1cmtv?=
 =?utf-8?B?RG9IWHFaUzJaLzQwbjZhWlFINmovSnhMVjJoQ2dxWmVoeGt5NThFOXZXMDkw?=
 =?utf-8?B?VVVqbmRiV2ZONEo1NTNxVk5iNU5jVXd2ckhVbmYvWVp4VEMzSnQ0aE1TODV0?=
 =?utf-8?B?UWtxY3gwMTIvRXZxZS9PRWhyciswODQrOEN0OXpBUTBiU3hhR1Ztc09Cd1cy?=
 =?utf-8?B?WVpoWGY1QWx5OG1saFBPYzhpL0hJL01VSHRwNFJ0cjNnRi9ka1NoMDRyckZz?=
 =?utf-8?B?Qjl4NFBUKzMyb0JObzdKaWhTeTB1Q1ZRcmlCNFN3QXVwWmlZUTA3NnlCWHFo?=
 =?utf-8?B?MnQvM2NLT2s0enl5YWhCWFpUUlZ0bzJQYXFXK0NPZE9oYTZvNWcyaHNGWEMv?=
 =?utf-8?B?VTMxZWduNjlOdG5acmdwbWIrQXZRVzB4Q2dLbU9GcmV6VnRqWGN6NjZOcHky?=
 =?utf-8?B?NERYYkxjTU95b0s0VXhWRmNmUmw5NkpyZHVjUGZieUY1ZXFhc2p0R0NnMGQ2?=
 =?utf-8?B?b1EwaWNpN0l2eENmZVNic3dTNWw1UnVPYlU5K1gzZzJpT2xQeGtRZWtFeG5T?=
 =?utf-8?B?dWZjZnRxUDFHbC9pWEFYc3YxeE4vTHhGL2NLOFF5b05VM2h5NmVLdC8vWmQv?=
 =?utf-8?B?VVhmSTV2ZWJVNTNybnNzNUc1cmxFWUtXQkxsaGw5SFRXSTlNNEtjcFRhdHB0?=
 =?utf-8?B?cjQ2VVRWaUJEYlVaZFNWWkRDc0dycW11bzRFZ21BVFU2djBNbC9EMFhvVzhm?=
 =?utf-8?B?Q2lpb0puSjZhUzM3VzFUNDcwMTdGVzJhUjhJMGJvS3hlL2FHUmdodHRsZm9O?=
 =?utf-8?B?My9Db2ZNdk9FbzdpbXRKOGZWUW14Y1FubnZFNittK0NmWjlCai9uNVluOVZB?=
 =?utf-8?B?Nk50WjAwVnRST3J1cEVkc3ZWcjNvMGRadkVpQTIzSjhDa0hhcFhXYVV2eWtV?=
 =?utf-8?B?clBGU2pudHBrRHhKVWhndjMyMmFvNE5VZlZmS1dBeS9YR1ljZW52QWV1a0dM?=
 =?utf-8?B?a2g0djJXSlAvQXU3SlBwWWJycVBvWHBOL2pXSE5KSDJHcGxUM1BaK3lIU0dv?=
 =?utf-8?B?OFQrWlR2YTRaVVZ0WHV2QnRRSGtBK2dQODA3bVhLZFF1OFlpOUdhQnRBRlJh?=
 =?utf-8?B?Q3N0dmp2eWtjbFZ6UEMzaGE1Z3NhcGxlUzRLMGs1Y2FyZDIvbWZ0YzJXb2pK?=
 =?utf-8?B?bHpzZG4yaFNsY29wLzlCckg5dS9La29icjFzdVMyeUtzVHdVUnNUVEZYNWhz?=
 =?utf-8?B?aWxXL1phU25RMFBibkpscEptSzZpd1RJUTJpaE5reDdnVE9ZUU9oRjFZYXZ5?=
 =?utf-8?B?L0d2bmMrbjZPdTFzQnZJMVYyNFdnU0Z3WDVtL3RIQ3p4cHo4cENQRXN3VGlV?=
 =?utf-8?B?RDl3NGticU41bUZOS0tkLzBuQnpNU21aV2VnR3R6Y25WMXN1b240ZEoydFBI?=
 =?utf-8?B?eHNDOVlsaUt4MVpnLzVHWDBqOXUzQjd6c0tmTTNBNnNyV2lTbFJjUW9VSmhU?=
 =?utf-8?B?TTNWSGNURDY1OW5RQ2tnbk1QUEtCeEtIQTJQZlRDWjhBcmFGeTRaUjZWenVy?=
 =?utf-8?B?UGZlYllEM0lESlY2ZURVZkNBYlB3WHU2UFpGVWRVNUlmQ3U0cnNyNytrSUJ5?=
 =?utf-8?B?dk12OUJEWGVRMmExTkpTQnlnOFA2SVMxTXpTY0RYQ2xtQU8wZzR1Ykl6dkJk?=
 =?utf-8?B?ZlJZbVByUEVqdEhtSDNqU2haR1FISGZWU3AzVXVBTjk0VUV0Y0xiaTdIM1Vn?=
 =?utf-8?B?NWsyM0RWb0ppSFdLcFRCYW80TElOYmkwOHo5b2wwcW8wZzg2V2Zpb04rdStk?=
 =?utf-8?B?TFBFTERJSkQ4UHgxUk0ya25xRXR6b083YU9DdmMveEpSeVdwY1hZMDU1Rmo0?=
 =?utf-8?B?aTVPVDd2Z0EyWjZQZ3dBRjNnODBJN2wxTnBUUUlBWXM3NDFXVFdCcU04bUhs?=
 =?utf-8?B?WkNKZlN0amd2V3BxU3p3YUFwZHFWRXYrSzEyL0drNFRxQ005WnZoanRneDVu?=
 =?utf-8?B?VXByaU1qNVJuTE1FbXR0Y09XemxUQnV1WXB2TzN6RUlMb0lOZGxQMDNuZW9H?=
 =?utf-8?B?VS9FWFF5cUNhLzY2Ym83clBwZnFHM0hPSnJWWWcxTytCWWZ3MjZPVVp2MGhi?=
 =?utf-8?Q?U+qmBZIYr3IrDmhKMqMNoAs73?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DRJ0iwVzgtmMr5mEBfpwuR5rMj65GHmdH8yf3nzm8AnMvnYrjE6xjEQRVfpgsn+k/enyGi+ATSxCwOQOXkvcoHJ7NIndFiXGSlg6dvRgSYTcEAcwpLHcTror6j/WNAplacqmRNpXev/Gc+XeAvftStLzkcppmIXA0acuUoHMXdR5wdROwHEBJEhjEFag7P+V/3G+sGfqdaKVyA+0V4bBIWkLv+TQTb6Ud2q3+lFV+XQeig1wINmaF3Kb4EFDkvVQPsRojGSsl6U5P1wOndhjWqOqqBzc7cH/3yyOOQ62J1O69kxu6vkUolXGFFRpuIgJrhraX3bDder1wheuCPJ6u3/I+Zq+lgqI+5A3rOk3rTacWmZlgGxKmSoROVlCm4FlRb5RDr4Pex1RPmK3WJODPKarkpSps1On+ojsEs8zdGmnRh5grK8gVrfEl4XZhjABOidc8Jc5nLsHRN/PJwDoeIa7h3iuWt6zyw40JFYiFADPWVzdChjqeeHXuNmINz+1aquukGWJfL3FOFhPTH86DVUAGe62FpYU1Mje64X+fQbeWcBdM2LlYnfqTF2isaI4KeQRpAcxNlmhmoK+vc+dIyiNHRjrvmimQ84l7iwCH00=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16447adb-b193-4585-2ad9-08de04892c1c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 03:33:53.2331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2Cq0sj2hO/JXsxb/TVA74PW/o8mwZZiyUezYos7T78Edyb72BeKfTc2tkDBHMWENGrIX6PShChDMGpCt0whyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4961
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_01,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510060026
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDAxNSBTYWx0ZWRfX6lLMOtJYQds7
 Zoa90G6g0GsbOtn+ueujeX/ahjPvVN39S2ut3vV/50IsCf9uxLRHfEXAe33sV4c5qiuFQzH3+/C
 u6yMMm7TYJ9AJN/DqdQ4dyWkBHmKcRHQ1hN2nk2gHOM/aZIN+76qH4pzvGUmXjJIxnHV7CEx/WF
 Igkq6feSLn18iNI9XNC42S6FSDeA1BjdXbznCzEKGHAjhxru829q7llrg4kFj7AJxZU85/TVxzj
 SUkGAUk3LlOOzIg9xjH0FnMVZrF4q5UdtNIE1stcloVYGUgYVyC9f1t1fGbKMUAFhXFLH9lkpjT
 Dv41YmCjqSWIyiVxTYqIxjE+RJI4yCRpzNh3mnRHnDnYMA1XddaRi8V31V0fOTw9qffY7ViQdBz
 gWSzJKPcrzlJADgs95nzgyrgcm2WDKgIbRxEUdcDcM1v7J2jEhQ=
X-Authority-Analysis: v=2.4 cv=fa2gCkQF c=1 sm=1 tr=0 ts=68e338ab b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=_jC_J6mKyZXrfH-WCqQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12092
X-Proofpoint-GUID: tPI5WPC6o57J-j4mvyhRnofGXBVg_iVZ
X-Proofpoint-ORIG-GUID: tPI5WPC6o57J-j4mvyhRnofGXBVg_iVZ

On 10/3/25 23:18, Kris Van Hees wrote:

> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 3ce13c74..75cd8b9e 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -2647,11 +2647,16 @@ dt_cg_act_speculate(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>   	dt_regset_free(drp, dnp->dn_reg);
>   }
>   
> -static uint64_t
> -dt_cg_stack_arg(dtrace_hdl_t *dtp, dt_node_t *dnp, dtrace_actkind_t kind)
> +/*
> + * Extract [u]stack() argument data, storing number of frames and optional
> + * string data in 'nframes' and 'strsz', and returning the storage size for
> + * the call stack data (not including the size of the optional string data).
> + */
> +static uint_t

If this returns uint_t, then in dt_cg_agg() I would think that "size" 
should become uint as well.

> +dt_cg_stack_arg(dtrace_hdl_t *dtp, dt_node_t *dnp, dtrace_actkind_t kind,
> +		uint_t *nframes, uint_t *strsz)
>   {
> -	int		nframes;
> -	int		strsize = 0;
> +	uint_t		val;

"val" is a very generic name...  not particularly descriptive.  I would 
think "nframes" would be much better.  And so the arguments being passed 
in would be better as "nframesp" and "strszp".

>   	dt_node_t	*arg0 = dnp->dn_args;
>   	dt_node_t	*arg1 = arg0 != NULL ? arg0->dn_list : NULL;
>   	int		indopt, def, inderr;
>   	if (arg0 != NULL) {
> @@ -2760,17 +2772,18 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off,
>   		dt_regset_free_args(drp);
>   		/* mov32 %r0, %r0 effectively masks the lower 32 bits. */
>   		emit(dlp,  BPF_MOV32_REG(BPF_REG_0, BPF_REG_0));
> -		emit(dlp,  BPF_STORE(BPF_DW, reg, off, BPF_REG_0));
> +		emit(dlp,  BPF_STORE(BPF_W, reg, aloff + 12, BPF_REG_0));

It really seems to me that the MOV32_REG can be dropped.

I tried an experiment in which I preset the DW of some storage location, 
then had a register filled with other contents, then stored BPF_W.  I 
saw that only the lower W was stored and the upper W was untouched.

Plus, if we were concerned about stuff at aloff+16 being written to, 
it's about to get overwritten anyhow.

So, what is the rationale for keep the MOV32_REG?

>   		dt_regset_free(drp, BPF_REG_0);
> -	}
> +	} else
> +		emit(dlp,  BPF_STORE_IMM(BPF_W, reg, aloff + 12, 0));
>   
>   	/* Call bpf_get_stack(ctx, buf, size, flags). */
>   	if (dt_regset_xalloc_args(drp) == -1)
>   		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>   	dt_cg_access_dctx(BPF_REG_1, dlp, drp, DCTX_CTX);
>   	emit(dlp,  BPF_MOV_REG(BPF_REG_2, reg));
> -	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, off + prefsz));
> -	emit(dlp,  BPF_MOV_IMM(BPF_REG_3, stacksize));
> +	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, aloff + 16));
> +	emit(dlp,  BPF_MOV_IMM(BPF_REG_3, nframes * sizeof(uint64_t)));
>   	if (kind == DTRACEACT_USTACK)
>   		emit(dlp,  BPF_MOV_IMM(BPF_REG_4, BPF_F_USER_STACK));
>   	else {
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index ba5463a0..bcaa4221 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -1058,16 +1058,33 @@ dt_vopen(int version, int flags, int *errp,
>   	    "<DYN>", ctf_lookup_by_name(dmp->dm_ctfp, "void"));
>   
>   	/*
> -	 * The stack type is added as a typedef of uint64_t[MAXFRAMES].  The
> -	 * final value of MAXFRAMES may be adjusted with the "stackframes"
> -	 * option.
> +	 * Define:
> +	 *   typedef struct dt_stack {
> +	 *   	uint32_t	frames;
> +	 *	uint32_t	strsz;		// optional string blob size
> +	 *	uint32_t	type;		// type of stack (kernel/user)

I guess this is now is_user.

> +	 *	uint32_t	pid;		// process id (or 0 for kernel)
> +	 *   	uint64_t	addrs[n];	// stack trace addresses
> +	 *   } dt_stack_t;
> +	 *
> +	 * It is done in two stages because we won't know the size of the addrs
> +	 * array until runtime options have been processed.  We add all members
> +	 * (except for addrs) here, and then append the addrs array in
> +	 * dtrace_init().
>   	 */
> -	ctr.ctr_contents = ctf_lookup_by_name(dmp->dm_ctfp, "uint64_t");
> -	ctr.ctr_index = ctf_lookup_by_name(dmp->dm_ctfp, "long");
> -	ctr.ctr_nelems = _dtrace_stackframes;
> -
> -	dtp->dt_type_stack = ctf_add_typedef(dmp->dm_ctfp, CTF_ADD_ROOT,
> -		"dt_stack", ctf_add_array(dmp->dm_ctfp, CTF_ADD_ROOT, &ctr));
> +	{
> +		ctf_id_t	stid, mbid;
> +
> +		stid = ctf_add_struct(dmp->dm_ctfp, CTF_ADD_ROOT, "dt_stack");
> +		dtp->dt_type_stack = ctf_add_typedef(dmp->dm_ctfp, CTF_ADD_ROOT,
> +						     "dt_stack_t", stid);
> +
> +		mbid = ctf_lookup_by_name(dmp->dm_ctfp, "uint32_t");
> +		ctf_add_member(dmp->dm_ctfp, stid, "depth", mbid);
> +		ctf_add_member(dmp->dm_ctfp, stid, "strsz", mbid);
> +		ctf_add_member(dmp->dm_ctfp, stid, "is_user", mbid);
> +		ctf_add_member(dmp->dm_ctfp, stid, "pid", mbid);
> +	}
>   
>   	dtp->dt_type_symaddr = ctf_add_typedef(dmp->dm_ctfp, CTF_ADD_ROOT,
>   	    "_symaddr", ctf_lookup_by_name(dmp->dm_ctfp, "void"));
> diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
> index a3e15397..36169ed3 100644
> --- a/libdtrace/dt_printf.c
> +++ b/libdtrace/dt_printf.c
> @@ -569,18 +570,41 @@ dt_print_stack_user(dtrace_hdl_t *dtp, FILE *fp, const char *format,
>   	return err;
>   }
>   
> -/*ARGSUSED*/
> +/*
> + * The data at vaddr is structured as follows:
> + *	uint32_t	depth
> + *	uint32_t	strsz
> + *	uint32_t	type

Again, now "is_user".

> + *	uint32_t	pid
> + *	uint64_t	addrs[depth & 0x7fffffff]
> + *
> + * The 'depth' member provides the maximum number of addresses in the stack
> + * trace.
> + * The 'strsz' member provides the size of the optional string blob that is
> + * appended to the stack trace data.
> + * The 'type' member identifies the stack trace as kernel space (0) or
> + * userspace (1).

"is_user"

> + * The 'pid' member provides the userspace process id for userspace stack
> + * traces and otherwise will be 0.
> + * The 'addrs' array provides the stack traces addresses.  If the stack trace
> + * is shorter than 'depth', remaining addresses will be 0 and can be ignored.
> + */
>   static int
>   pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
>   	      const dt_pfargd_t *pfd, const void *vaddr, size_t size,
>   	      uint64_t normal, uint64_t sig)
>   {
>   	int width;
> -	const dtrace_recdesc_t *rec = pfd->pfd_rec;
> -	caddr_t addr = (caddr_t)vaddr;
> -	uint32_t depth = DTRACE_STACK_NFRAMES(rec->dtrd_arg);
> +	uint32_t *vals = (uint32_t *)vaddr;
> +	uint32_t depth = vals[0];
> +	uint32_t strsz = vals[1];
> +	uint32_t is_user = vals[2];
> +	caddr_t addr = (caddr_t)(vals + (is_user ? 2 : 4));
>   	int err = 0;
>   
> +	if (depth > dtp->dt_options[DTRACEOPT_MAXFRAMES])
> +		return dt_set_errno(dtp, EDT_DSIZE);
> +
>   	if (depth == 0)
>   		return 0;
>   
> @@ -2487,9 +2511,8 @@ dt_print_stack(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
>   	else
>   		format = ((dt_pfargv_t *)fmtdata)->pfv_format;
>   
> -	/* pfprint_stack() uses pfd_rec, pfd_flags, and pfd_width only */
> +	/* pfprint_stack() uses pfd_flags, and pfd_width only */

The comma can now be dropped.

>   	memset(&pfd, 0, sizeof(pfd));
> -	pfd.pfd_rec = recs;
>   	pfd.pfd_flags = DT_PFCONV_LEFT;
>   
>   	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
> diff --git a/test/unittest/funcs/stack/tst.asgn_dvar.r.p b/test/unittest/funcs/stack/tst.asgn_dvar.r.p
> new file mode 100755
> index 00000000..31491c78
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.asgn_dvar.r.p
> @@ -0,0 +1,35 @@
> +#!/usr/bin/gawk -f
> +
> +/hrtimer_nanosleep/ {
> +    # check probe
> +    if ( $1 != "hrtimer_nanosleep:entry" ) {
> +        print "ERROR: expected fun:prb = hrtimer_nanosleep:entry";
> +        exit(0);
> +    }
> +
> +    # check stack(3)
> +    getline;
> +    if (index($1, "`hrtimer_nanosleep+0x") == 0 &&
> +        match($1, "`hrtimer_nanosleep") == 0) {

The match() should have a "$" at the end of nanosleep.  That is,

         match($1, "`hrtimer_nanosleep$")

Otherwise, there would be no point in the index() check.

> +        print "ERROR: expected leaf frame to be hrtimer_nanosleep";
> +        exit(0);
> +    }
> +    getline;
> +    if (NF == 0) {
> +        print "ERROR: missing second frame";
> +        exit(0);
> +    }
> +    getline;
> +    if (NF == 0) {
> +        print "ERROR: missing third frame";
> +        exit(0);
> +    }
> +    getline;
> +    if (NF > 0) {
> +        print "ERROR: expected stack(3) to have only three frames";
> +        exit(0);
> +    }
> +
> +    print "success";
> +    exit(0);
> +}
> diff --git a/test/unittest/funcs/stack/tst.store.d b/test/unittest/funcs/stack/tst.store.d
> new file mode 100644
> index 00000000..68577e27
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.store.d
> @@ -0,0 +1,28 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: It is possible to store to members of dt_stack_t.
> + */
> +
> +/* @@trigger: periodic_output */
> +
> +fbt::hrtimer_nanosleep:entry
> +{
> +	v = stack(5);

I see a problem here with some older kernels.  The stack is often:

         vmlinux`hrtimer_nanosleep+0x5
         vmlinux`common_nsleep+0x40
         vmlinux`__x64_sys_clock_nanosleep+0xdf
         vmlinux`do_syscall_64+0x35
         vmlinux`entry_SYSCALL_64+0xa6

So it is only 5 frames deep and "stack(5)" doesn't clip anything. But 
that's not the problem.  The problem is that on some older kernels I get:

         vmlinux`hrtimer_nanosleep+0x1
         vmlinux`x64_sys_call+0x1367
         vmlinux`do_syscall_64+0x58
         vmlinux`entry_SYSCALL_64+0x1b3

There are only four frames.  So we get the error:

         ERROR: missing stack(5) frame addrs[4]

I think it makes most sense to drop the "5" to "3".

> +	printf("%k", v);
> +	v.depth = 2;
> +	printf("%k", v);
> +	v.depth = 5;
> +	printf("%k", v);
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/ustack/tst.asgn_dvar.r.p b/test/unittest/funcs/ustack/tst.asgn_dvar.r.p
> new file mode 100755
> index 00000000..3b69efa4
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.asgn_dvar.r.p
> @@ -0,0 +1,45 @@
> +#!/usr/bin/gawk -f
> +
> +/myfunc_z/ {
> +    # check probe
> +    if ( $1 != "myfunc_z:entry" ) {
> +        print "ERROR: expected fun:prb = myfunc_z:entry";
> +        exit(0);
> +    }
> +
> +    # check stack(3)
> +    getline;
> +    if (index($1, "`myfunc_z+0x") == 0 &&
> +        match($1, "`myfunc_z") == 0) {

Need a $ at the end of myfunc_z:  "`myfunc_z$".

> +        print "ERROR: expected leaf frame to be myfunc_z";
> +        exit(0);
> +    }
> +    getline;
> +    if (NF == 0) {
> +        print "ERROR: missing second frame";
> +        exit(0);
> +    }
> +    if (index($1, "`myfunc_x+0x") == 0 &&
> +        match($1, "`myfunc_x") == 0) {

Need a $ at the end of myfunc_x:  "`myfunc_x$".

> +        print "ERROR: expected leaf frame to be myfunc_x";

This fails on newer kernels.  The stack is usually
         myfunc_z
         myfunc_x
         myfunc_w
and that's what the check looks for.  One might reasonably ask, "What 
happened to myfunc_y?"  That answer is explained, e.g., in a comment 
block in test/unittest/ustack/tst.ustack25_pid.r.p .  So the 
ustack/asgn_*var tests (maybe just asgn_dvar.r.p) need the same magic to 
account for new x86 kernels.

> +        exit(0);
> +    }
> +    getline;
> +    if (NF == 0) {
> +        print "ERROR: missing third frame";
> +        exit(0);
> +    }
> +    if (index($1, "`myfunc_w+0x") == 0 &&
> +        match($1, "`myfunc_w") == 0) {

Need a $ at the end of myfunc_w:  "`myfunc_w$".

> +        print "ERROR: expected leaf frame to be myfunc_w";
> +        exit(0);
> +    }
> +    getline;
> +    if (NF > 0) {
> +        print "ERROR: expected stack(3) to have only three frames";
> +        exit(0);
> +    }
> +
> +    print "success";
> +    exit(0);
> +}
> diff --git a/test/unittest/funcs/ustack/tst.ref_pid.d b/test/unittest/funcs/ustack/tst.ref_pid.d
> new file mode 100644
> index 00000000..6ed62f12
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.ref_pid.d
> @@ -0,0 +1,37 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test accessing the 'pid' field of s userspace stack.

s/ s / a /

> + */
> +
> +/* @@trigger: ustack-tst-basic */
> +
> +pid$target:a.out:myfunc_z:entry
> +{
> +	trace("Expecting ");
> +	trace($target);
> +	trace(", got ");
> +	trace(ustack(7).pid);
> +}
> +
> +pid$target:a.out:myfunc_z:entry
> +/ustack(7).pid == $target/
> +{
> +	exit(0);
> +}
> +
> +pid$target:a.out:myfunc_z:entry
> +/ustack(7).pid != $target/
> +{
> +	exit(1);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/ustack/tst.ref_strsz.d b/test/unittest/funcs/ustack/tst.ref_strsz.d
> new file mode 100644
> index 00000000..b78a00c0
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.ref_strsz.d
> @@ -0,0 +1,35 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test accessing the 'strsz' field of s userspace stack.

s/ s / a /

> + */
> +
> +/* @@trigger: ustack-tst-basic */
> +
> +pid$target:a.out:myfunc_z:entry
> +{
> +	trace("Expecting 42, got ");
> +	trace(ustack(7, 42).strsz);
> +}
> +
> +pid$target:a.out:myfunc_z:entry
> +/ustack(7, 42).strsz == 42/
> +{
> +	exit(0);
> +}
> +
> +pid$target:a.out:myfunc_z:entry
> +/ustack(7, 42).strsz != 42/
> +{
> +	exit(1);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/ustack/tst.ref_strsz.r b/test/unittest/funcs/ustack/tst.ref_strsz.r
> new file mode 100644
> index 00000000..840f7e21
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.ref_strsz.r
> @@ -0,0 +1,6 @@
> +                   FUNCTION:NAME
> +                  myfunc_z:entry   Expecting 42, got                         42
> +                  myfunc_z:entry
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/funcs/ustack/tst.ref_strsz.d' matched 4 probes
> diff --git a/test/unittest/funcs/ustack/tst.store.d b/test/unittest/funcs/ustack/tst.store.d

Okay, but need .r and .r.p files???

> new file mode 100644
> index 00000000..6a9f7c94
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.store.d
> @@ -0,0 +1,25 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: It is possible to store to members of dt_stack_t.
> + */
> +
> +/* @@trigger: ustack-tst-basic */
> +
> +pid$target:a.out:myfunc_z:entry
> +{
> +	v = ustack(5);
> +	v.depth = 2;
> +	printf("%k", v);
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/printf/tst.ustack25_pid.r b/test/unittest/printf/tst.ustack25_pid.r
> new file mode 100644
> index 00000000..e7732fb8
> --- /dev/null
> +++ b/test/unittest/printf/tst.ustack25_pid.r
> @@ -0,0 +1,28 @@
> +
> +              ustack-tst-basic`myfunc_z
> +              ustack-tst-basic`myfunc_y+{ptr}
> +              ustack-tst-basic`myfunc_x+{ptr}
> +              ustack-tst-basic`myfunc_w+{ptr}
> +              ustack-tst-basic`myfunc_v+{ptr}
> +              ustack-tst-basic`myfunc_u+{ptr}
> +              ustack-tst-basic`myfunc_t+{ptr}
> +              ustack-tst-basic`myfunc_s+{ptr}
> +              ustack-tst-basic`myfunc_r+{ptr}
> +              ustack-tst-basic`myfunc_q+{ptr}
> +              ustack-tst-basic`myfunc_p+{ptr}
> +              ustack-tst-basic`myfunc_o+{ptr}
> +              ustack-tst-basic`myfunc_n+{ptr}
> +              ustack-tst-basic`myfunc_m+{ptr}
> +              ustack-tst-basic`myfunc_l+{ptr}
> +              ustack-tst-basic`myfunc_k+{ptr}
> +              ustack-tst-basic`myfunc_j+{ptr}
> +              ustack-tst-basic`myfunc_i+{ptr}
> +              ustack-tst-basic`myfunc_h+{ptr}
> +              ustack-tst-basic`myfunc_g+{ptr}
> +              ustack-tst-basic`myfunc_f+{ptr}
> +              ustack-tst-basic`myfunc_e+{ptr}
> +              ustack-tst-basic`myfunc_d+{ptr}
> +              ustack-tst-basic`myfunc_c+{ptr}
> +              ustack-tst-basic`myfunc_b+{ptr}
> +              ustack-tst-basic`myfunc_a+{ptr}

Same problem as in v1 of the patch:  mismatches.  Maybe get rid of the 
leading spaces.

> +
> diff --git a/test/unittest/printf/tst.ustack25_pid.r.p b/test/unittest/printf/tst.ustack25_pid.r.p
> new file mode 100755
> index 00000000..c0110e00
> --- /dev/null
> +++ b/test/unittest/printf/tst.ustack25_pid.r.p
> @@ -0,0 +1,37 @@
> +#!/bin/bash
> +
> +# A pid entry probe places a uprobe on the first instruction of a function.
> +# Unfortunately, this is so early in the function preamble that the function
> +# frame pointer has not yet been established and the actual caller of the
> +# traced function is missed.
> +#
> +# In Linux 6.11, x86-specific heuristics are introduced to fix this problem.
> +# See commit cfa7f3d
> +# ("perf,x86: avoid missing caller address in stack traces captured in uprobe")
> +# for both a description of the problem and an explanation of the heuristics.
> +#
> +# Add post processing to these test results to allow for both cases:
> +# caller frame is missing or not missing.
> +
> +missing_caller=1
> +if [ $(uname -m) == "x86_64" ]; then
> +        read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> +
> +        if [ $MAJOR -ge 6 ]; then
> +                if [ $MAJOR -gt 6 -o $MINOR -ge 11 ]; then
> +                        missing_caller=0
> +                fi
> +        fi
> +fi
> +
> +if [ $missing_caller -eq 1 ]; then
> +        # Add the missing caller function after the current function.
> +        awk '{ print }
> +             /myfunc_z/ { print "              ustack-tst-basic`myfunc_y+{ptr}" }'

Get rid of the leading spaces?

> +else
> +        # The .r results file has an extra frame at the end in case
> +        # the caller frame is missing and the 25-frame limit goes
> +        # "too far."  If the caller is not missing, fake that extra frame.
> +        awk '{ print }
> +             /myfunc_b/ { print "              ustack-tst-basic`myfunc_a+{ptr}" }'

Get rid of the leading spaces?

> +fi
