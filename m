Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2BB188A3A
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 18:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752691388; cv=fail; b=QvhJKdUYMjAEvCMw3a367XrxLN+UpPdpnYXyNf9eM53OcQnYUTu4h0EpE1D4YBXGM+wH3zuFFRIbt/TluUz54VWoADdZYyjMp/Me+UpxHf6h660dboG82IrWw7K9DY1Kk7mjj3N/CXgPV5bIgUpUSiVSqDgXvfhV+QcpUjWjwl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752691388; c=relaxed/simple;
	bh=s/xNss6X17VYQIXK5AGPQNZKwhAZrgItcLXKyQiuQbY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YX2gI9MPfv+sYGrrNTvtccfhTPVy8zIiSj+NJtnq253V3eOs6CytvhcittjnoS9VHYEnbdCjn9U7lKyY9Km7PJ9WJ4yrd16Vj0KZqo2/1zY+PlJKJdyJiprxl3Q5E1pfQKnBZ+nHQ0t8CGWbhNxBD6j1RZ+5sZyexc4etHWa+Kk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kOwp0T8E; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pv6Y0dYt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kOwp0T8E";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pv6Y0dYt"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GHfji2012814
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 18:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=1x/Lpc3MGoRh/MTNsn62nxCph54ZSZ5aHIJFQ7jSKIs=; b=
	kOwp0T8E02CMvct6FEd3jjq2pQyVbwcylde+U7SC6lgB5Nt8oer4eNmfUEPhGSVy
	W7nJcWTx8pVurqjawme0DkOGYhi8r0errK5uUN8IFHoXxcQQhJcmuAmbMVAHsAWN
	d9IKgUu1lrBRt1vq2LhbYO8M0VlYGk3two2PbLZh5TaaVWwoaAbrkdgqyTq42G5C
	9tzAoq/3guz3Ugs8rNx5/2PpG930G0mkDN7I+3lgSRCPn0iUta7UmUx5FzPx0fqz
	/AvuMMqzaRUBrSPFX8aO3ghQFa61rUAdIT9HQm01A4VOZVk0egGdnt1tONJtgVi8
	ztke9fHjY3x7z1/lxfuCGg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk6719ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 18:43:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56GHCCLU039729
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 18:43:03 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5bremt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 18:43:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kojOx2Vk6sLsfYXN9ZDKC/1gtTzTXpxOXUg2qd4wWgItbEAqUVK7LaeDsqlVv/yy05EV/KWrTHKJrMeUEkovQIgkPexk7Ps4K7ClSnPVDfZAcQfbM48UTALMq4y4MVsCn34n/TYsuZ135GOZS85CCGu14Q7NWOjXSnVSQ9EB4m/8czLR/vqsn1vwQBbxs82D0zs9XG+yzv2muNl0X0rnW2rg7qRpNS3u2Zp67dPpYASzAvvBqHtzkoM7MOmNnyiC7RvnSQS6r75itdhJg1WMzV+ccBqzcBR1SMy09YIZa/QMSsnrhwl4/JVjk5NBAMG9yAWABs4d7Q5zWGdWEN7U/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1x/Lpc3MGoRh/MTNsn62nxCph54ZSZ5aHIJFQ7jSKIs=;
 b=hpxcCpvXJRpvKhxugTg+r2MTlYtxOpoDJYa9tm73IxFPWlgPyc/OZ60xB6dfk7PL3LbZy7paskYA55QEd4egiPtmhofeXZTw/AcoJWyD+N6BHPgwOaGv+yXHnQ8A9bexUF/uf6P7jViVH81ony7WZEO0OqsL0z9j9Pi8Awf8mQcnXdlpJtXWRw88ycvCxSoiZ2zxP2XkSbInfL9IqPdwHarZPCvYcMzEG3lAJEFzcKM6uoViGi+Cww7UJF4tLP3iJeJP1ObLT7T87euc6em6K9r6vtadojD8GShXvcKXgdM/QjHTOEiDxmzyBfPpg2RkWmD4K59w0btV0bbjMFGEgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1x/Lpc3MGoRh/MTNsn62nxCph54ZSZ5aHIJFQ7jSKIs=;
 b=pv6Y0dYtXRI8Is4ap/iAJX5k6+5MRN5a8ziMNtX5Fo31rO6Gs3elrNTgRaC0uadzfYJsCOu42LTC8ob9qSyVjqwDZ7w3yvEwGMBBcjgvvDdFFRtDlfeU9lv+So/bmyfL8r7Fa81Ck75k5XKfvaMN2vGbeti3cbomQMrLGbZndDQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BN0PR10MB4888.namprd10.prod.outlook.com (2603:10b6:408:115::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.36; Wed, 16 Jul
 2025 18:43:00 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8922.035; Wed, 16 Jul 2025
 18:42:59 +0000
Message-ID: <11cb468d-5f2e-f716-d7c5-ecac0409e403@oracle.com>
Date: Wed, 16 Jul 2025 14:42:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 1/3] Cache per-CPU agg map IDs
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20250501182252.27772-1-eugene.loh@oracle.com>
 <87v7nsmfvb.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87v7nsmfvb.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:332::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BN0PR10MB4888:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c88885-8b0d-41b1-44bb-08ddc4989696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dW12VTBjUk5WS1ZRaDF5S3NkdG93elczajhPbktoRERaR0VjVkU1SktpcHZE?=
 =?utf-8?B?LzFudFJLbVFHTmxDcUxScVlUQldpMDlqVXFFakE3NDVpc01xMXpFU0p4T1Ir?=
 =?utf-8?B?aGhGZHJRbFBJMytJRmZLMi9aYW5uem9uM08wNWpPQndGekVvM3ZTeWxJajJQ?=
 =?utf-8?B?d09oY0VISFFCZy9NQkpNaGp2VFB2ZUpPWngydFBQZ1VDYzdjUzdRblpBZUxq?=
 =?utf-8?B?TmdwVW9aSWJXTUpEVEt2eXQ0SXhIaWJqTzVxSm1oVSt4QUdXMG95dmJVMzNp?=
 =?utf-8?B?VWJOT3hPTVZwSllFM0dQaVBld3IyNUJUbDNGdEZ3MEpVY3FoR2Q4UG9IN3Az?=
 =?utf-8?B?aVMzdGdOWTQ2T3JNT0lIcnROYVBYQ0t4VXRRQnlFekFBdjBNR1J5VkpIZkZM?=
 =?utf-8?B?VTJ2VHkwbnpZdURWRC9EQmF6SWdWa2xZNFFyUGFRdjdxdmNmMG51ZjUvM3kw?=
 =?utf-8?B?c0JRd1pXNHRFTFpaQUJtOTJTQVMxdzRoQlJtUUFDUXVkN1B4OUxyc2FBZG9I?=
 =?utf-8?B?WER0K1FLTGtNaE1hVXZnWWkreGVZc0FiYm4wOTNPaFh3UUZSYzEyWGN1SlF6?=
 =?utf-8?B?MDB3eGZoWm1uZXNqdEV5QTRaRkJFcXh3bjE0L1RJSmxKaVdML3Rlb0x3NWVI?=
 =?utf-8?B?QlF1N3BUL0R1NCt0OTRUalBFVExLK2p2RkQzSDBnM2oydjZ3V3laa3pPVTdo?=
 =?utf-8?B?cWt6bWlQRnJwdExkcVh5RWNRcDBSOUQ0cVRJMkR1Z3ZPbkJjd3RxeDlzRldy?=
 =?utf-8?B?eUZ3NFRuVkZ0NjRQeTY1cFpwZlU1d3JyUlpON05NL0NIbWhFWlZBWWt4emVJ?=
 =?utf-8?B?ejk2YUEwNmR0ZTdOdWJXVVU1MG50NHgrWDZmc2hJRHRVRnJJeWFQNTlQeHlM?=
 =?utf-8?B?TzMwRkpHeXZjVExuS2VGWnlRRlhLZzNIanhXQUI5cHhHN1lQcGQzTGs2WHND?=
 =?utf-8?B?U2cvVHVxakNUWm0za2ZiOTlMNzBQZXBMY0QwZlZCaktpQnpZek5ERWxnR1VO?=
 =?utf-8?B?M3BMcGdvMTA0RjFTaElwam1GOXZzMnhmK0J3NlBRRTBGVlMrODgvdkQ1VXlM?=
 =?utf-8?B?MmFFM1AvcHJqUXpsMlh1VUR4S3FCaE81ak1kYmlieklJbW5JZjBJVUpxL0Vp?=
 =?utf-8?B?cHk5ZkpiWmRLZ1gvcm4vSFBYQUIxb1RtY1RVN0lQQklHQUFnL2dqSmV1c3VS?=
 =?utf-8?B?Vmcxa1lTNG5NS29uTXViSzUrbURPdzVCY2ZmY1A4dGVDREk4U2Q5dU1KK29s?=
 =?utf-8?B?R1QrY0xZdk5USHA0dG1CclQ3OVdHZVk1bXZnWDhpK3pXV3ZpaS9RM1BPUW8w?=
 =?utf-8?B?cDVGMVJHUlNQVjg5SXVyTnk2Ykg5VCtyNk5GckdzbnFiTXRmQzgxdDJteGhn?=
 =?utf-8?B?UjE1Ulc3Mm8rTjloa1pjZWlXTkhVZHVUclppTGJ1a29RTlQwbElJb1NSSEM2?=
 =?utf-8?B?d25CUXY2NWEzeWhzOXh0aVN1NkdpaTJmR1BZL0NEU0VCUDZFWlFralR0NmpX?=
 =?utf-8?B?UmhKa0o3cEhFdzhLREtlU3ppTWlyclU3ZXM0OUI1a3IxNEhNZ3B3RUtPQmVB?=
 =?utf-8?B?U0I1RjFCb25QeW1mUnRGczAvNnQ0dUlxbHdqTHFvQjBjZTd6QW80SXBrdjFv?=
 =?utf-8?B?RkNaWTRKa1lqeElPTzFJSUhmeU1hRjNCRzdQWFliTXFObEFXTzlieG8xR3N2?=
 =?utf-8?B?R3pZMHQzZHBXMjJWM2dIRW9yUXJkK1Zwd2w1bElnMUF4ZUtYalZGa3hPb2lM?=
 =?utf-8?B?SUhnS2J1b1RScVFraDdHcVdmU1JES3RPam5od244anIwdzBXZHdSVFNBWVNj?=
 =?utf-8?B?QzUwTlpSdDRrNE54a3Y2RzFMajBla3lsc2NpVW9TNWI1Y3JDa1Z4dHR5MVc1?=
 =?utf-8?B?NzhKLzFmdVl2SDY0OTYyRmhtTDBaL3hUdHlrbE9vQjIzZ2ZibkpXMkFSMXNY?=
 =?utf-8?Q?wxjyYySEWbw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDBad1p4TnFGblpIcUU2QXlqU0lpQXdyZlpNTWpKbnFmWW1jQlY3SG81b3hW?=
 =?utf-8?B?UENWR2t5WHV5anUwb2JyeTg2dGEzV09LeUZ4R2pHd01zYnNtVWc4aERubnFS?=
 =?utf-8?B?QmY3djF3VDZhbGJiV20xdWZubEJBNFhiZEtzWXorKzB2WVZRYVpJeEMrYXZk?=
 =?utf-8?B?ZGFaQVp0OXBrRlpXWmdWanpESmJ5U3RGRWI0QlNQVDFaM0dDQi9QT0RQRzlv?=
 =?utf-8?B?SzFiVnNqRVFNUjZReHlRMmhiUWFBc0h6akVaWFlLWnNzV05ES2gvMm51VkR5?=
 =?utf-8?B?dE9iOFJSY0IrbWVVaDgxRHJ0TC9xVFk1N2p1Zk9mNXJxNGovYnBqMkF4djQ4?=
 =?utf-8?B?MW5Scjg3cHRRUXZsTDVJOUN3YmxNMjBvK0tQM3AyeHdZQU5jM3QzOXhPTXBD?=
 =?utf-8?B?alZaZjliQWEydXJndzVteTFhTlhHU0ZRR3BCWWpRUWcvZXZTd0hPdDUyMmdZ?=
 =?utf-8?B?dFZsU1A1L1VqcHFLS0ZYdHhSbmhybE90eVhjT1liQTQzUy9rNWZETm9tcDI5?=
 =?utf-8?B?VXVuWmVCdG52WXIvU1lYN0F5WndiU2FEVmo2STJFQjc4Z1dOUlRZTStjYnM5?=
 =?utf-8?B?bzdzeG9XSnI2Y0pRQzZSb0tmM1lXeE01ZXBnWGdRRXUwbTJiMkVVT3A5SmNu?=
 =?utf-8?B?Y1preU1zOXF5VTBxRjEvWTNLOTlDTENaeEhsK0IxYVlzNFlNbVRicjZXR1Jl?=
 =?utf-8?B?dHd4MmtzdTFOZ25qMTNWbENxdkRteG8wVWZmcXV5QXYwWTBVRVppRjRNUStJ?=
 =?utf-8?B?bTZCZHJQRkpRZU02b3JqaGZ5NURDeW5Bd0NuRGJEaGc3YjRFdFR3WWw5Y3I1?=
 =?utf-8?B?Wmp1d25MWVppVXo1Q0tOdXZqdjlmQ3BlcFhUT2tZSGtKN3lzSHZJM0FyZEIz?=
 =?utf-8?B?OUFzMGUweXJSUklybnNYREJ3d2F6cm5wdnBKRkxBTTZFSUN4UnZEUlpVdGtO?=
 =?utf-8?B?ODBmdHNTUE92MVBwYmIraktZMS94YnJRWEdGODNoMk8rY1FLeFd1QlYwcHVB?=
 =?utf-8?B?ajZjc1Y0emtXcWRYZG53TldSQ3hnOTFqUUJYSzFJRWRSN1pEaUhpVE9XUkhq?=
 =?utf-8?B?eitFU29tdk14ZzNXeDZodzVyejlQQnZYWDhVVmNhMGQ3Nit5RTBBU0Zkcnoz?=
 =?utf-8?B?SCt0aGFvUXpwSnlKcTdwam9Xc2psQkZ0NzhZaWIxbXU0U21wUXpMNUlOSzlm?=
 =?utf-8?B?cHBBVGhJZ3NVa1ZqWTNCOHB5Y3hVZi9aZVcya1k2QmxSall6QnpsK3lTQ1dx?=
 =?utf-8?B?aTR4RUU0Q3RjUUZFTG0xM2VNOThoaDZjZTNackJHNnY0MkZyNmdTc201WDN3?=
 =?utf-8?B?NndyZ1ErUEttNGZqb1p3S0czd3lHK0FlY3JVZWlUcVpkVlBIM3UxRG5OWktX?=
 =?utf-8?B?dkdHdjdDYVF6MFc3bEcyaDlITHlvRTh5bm4vbDhiVzk1T3k0TzBEWUV2YUxK?=
 =?utf-8?B?Q3Awc0lKbWoxR1hLa21rUW5ibXYyUkQ1NVQ4RlR2WDhJRTUwZ3o2Y09qUmRE?=
 =?utf-8?B?WkhFcnRqUGZXVWRCbll1TUpOQnhMSzVIbEczd0hvc2cyaEdraW1nQmtnWUxF?=
 =?utf-8?B?Nk9EQXB2dmZvcmRuaS9ieWs5RnJtZnNMUXhibzVvdnk1SEJYNmZSMzVSbUJY?=
 =?utf-8?B?bzlFL3ZjR2hWRGdOMUZ6cEppZVMyVE5EaVdycm96aHNuTkYrREE5L0Y0MGEr?=
 =?utf-8?B?WnJNNE56ZUlxY2xnM2tHSWFOUXdheWNJYVpHVGRrRUlOV3ZTQWJ2VGhibVhw?=
 =?utf-8?B?M1RDWkphY3RIek5PMDNUY1FPNG1WSEJGdWtMM3pBOG5nOVV6aFdkc0c1dGhk?=
 =?utf-8?B?TDJmSEp6bDlna2E3MXZBVmw0N2FQS2M2WkVXSzhwV2VPaTk5OVl5OVQ3VWtR?=
 =?utf-8?B?Q21WcUVuek94WUdLZS9yMzZwQk8rMzg3cFUzMEIzNjQrd2NFZ1hnMUxhK2lS?=
 =?utf-8?B?ek9OSUNjMW5uWkc5UnBJU2FQY3pzQ2dtb3lQQWNpcitsdGt5V1FGTFl0dUc5?=
 =?utf-8?B?dE5tTHdxRGdNVEROcE1aV2pFa2d5aEFzMXJzK05NYmhNQjBEN204a0ZydENx?=
 =?utf-8?B?RmdRcFpXOG5LQytNOEJrZDBIays3NTNXSnlUa1lTV3Y0bExiN2l6ZVo4MmNN?=
 =?utf-8?Q?C7CklKPDlnFrTgCmrDbvKREqs?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pkJu7cbf8UyuaQeFjCqGe323jkz/dF7tPA483h4kPfoJ4PjVM4YlHL/QgKzF2Mnf05y2WGaQzlY4idDJ3KxRP+ZHkYbB9tHDAi6m+Nb1PMIpJHWH7WG351/L84juttHvVZZlVnXg627b4sxQ5mG6G+d2mkaSyR+VO9iLqJZL39HUcWOVrKGnv8qGI7rBLG9w8BioP+9FnIp95WMN5L97H3lizZsh4XjoDdrRVCEQI0bshXrUOXhIb03gMGBPMXbTd/MVRNXFM1Rb/E/EdfQqtb3ZeXd42JCrvWW6uy6j/DB4EiUEroi3fi3URasM5F0xeZqGzJQ9FiL3X3NstDGhCp4whu2nhO+1fAVuIa90bCiceOarDTLXhBzY57ulBqQI2isT578N63ZAvpMw7fh7Ddyoe8ZLhqREZVFWsmKqGg3RRZAoCuMBj7iX8+htuDqpkKi5WnIteMKjH3DFz0O1mh4RFK0WxyoyiYQPQXFAeHwldyGIZk0nvhSlddTG3Ta8tnvt7kaMJ8RHBPF+CJqVhDe/KopKfgyaAfy/iIUZxg61AfEQY3yfmHsi+KUnLSkPwJoP4FyJ/XOxRmRRT9prPMBo5Mq2wxlIz/ohLDigsyg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c88885-8b0d-41b1-44bb-08ddc4989696
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 18:42:59.9073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8e3VUGdSklY1MH8VxxKbPck+IDftmr8nZ88EFd6S50i93zJhV903My8SwrSU1QfoO/4IkB4XwGIjhqxxUAUmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4888
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_03,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507160168
X-Proofpoint-ORIG-GUID: ubvqwGPe5ITxsIbu7RyPnqqi7KDXGQSd
X-Authority-Analysis: v=2.4 cv=AZGxH2XG c=1 sm=1 tr=0 ts=6877f2b8 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=RUMAg_Caj_8Su8Ws5nYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13600
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDE2OCBTYWx0ZWRfXweVT/63WRphH SfoJuXVW//R3nrWbCCBHEfto/5T2WdDtZCo1WKyKPfTJ1sEI53+bbuf252hb6o5UjxPSs9T360n ojJmF8G0tbbTEuvnlqLwGAcI+bMaaxXY50NV10ZuMyz6xRayRfa9+0HhKqlFri8UQYK54PPLM+N
 kE2bTSE2puKVUGb7ONHCwQc2EkziUC1rzC3Bp2/irHAoGvmI3etoJfM6skYhioMBExa4vVn3p73 7OFy1an1MeW69uLQ7IalUU06YvybQiWLnSPfbBCbPiysSYZThNa7Hbjph0C2tFWARHH0qhA4q3l D1lWocWA33NwiHvgYBUACavMvSjdA4Tc89qrk/4RETyoJimBUJ+HCQA1pR+Dqy7Z3dxIKXg5YXB
 /ejmoTKhP3QIxiF0yXy3hpnFFjH9df/zO4RaoGChXbmqQbVVgVw2jkDAuuUsGqefcCMcAH+J
X-Proofpoint-GUID: ubvqwGPe5ITxsIbu7RyPnqqi7KDXGQSd

On 7/16/25 09:20, Nick Alcock wrote:

> On 1 May 2025, eugene loh outgrape:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> The dt_bpf_map_lookup_fd(dtp->dt_aggmap_fd, &cpu) call that is used to
>> snap or truncate aggregations takes a few milliseconds, which seems all
>> right.  For large systems (e.g., 100 CPUs) and many truncations (e.g.,
>> tst.trunc.d, etc.), however, a trunc() might end up costing a minute on
>> the consumer side, which is unreasonable and causes such tests to time
>> out.  The run time is due almost exclusively to looking up the per-CPU
>> agg map ID.
> ... how on earth did you figure this out? Some sort of profiler,
> presumably...

I wish I could say "gprofng" but the first thing is figuring out under 
what conditions what was happening.  Once I knew where to look for what, 
I just happened to stick in some timing calls to nail down the culprit.  
Could have been gprofng, I suppose.
