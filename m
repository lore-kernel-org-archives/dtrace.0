Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9D032AABD
	for <dtrace@lists.linux.dev>; Mon,  8 Jun 2026 10:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780915453; cv=fail; b=KCD2zchC+EoLuH+ykpRgjKn9yXJYxGx9de2W8nQ/zki4+1EwjOpimkb3o3Yue7xFDlhULmkOXkObOsMYNPEOX4/M8hj6SnIC3dG1jAmeLuYxH5jFuMwpn2TI6Sc+omsEartj/GNA1ASPSh02hBjgydM60Q8FFXFdAAeOB56esEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780915453; c=relaxed/simple;
	bh=gR6zxux5igvd3juQD9JAfnolklzv8v8T01FDYCi5aik=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=btcKJA0ax9W9CER6ecK+UDP6PH1LBM+EbUccJwKDiT1/PRvsZX/0qaP88VPQMws3ZmVO27q/SmKJmXd64ZbrDEJR7ChjUG/gUupSUWvFFywbcnkoonVxU9Xk9rpXsCwaB1PFQ2t6dSIo7440MucBvnuCNpICQwJkWwsu06SMXy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BpOugyko; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SsE42vdF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BpOugyko";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SsE42vdF"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6588NHM2589163;
	Mon, 8 Jun 2026 10:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=/0uUWbSbVsQCFTv9C7xw2K8tMMDVRwglYe921ZZrgD4=; b=
	BpOugyko9r6pA6nITemfaAahGe5uDeOVF9haw37lx/urH0QFcG96BrUr5KjHfR7y
	RX8ibICVGRIuWosbI2hq0sGTZWy1rabUOxrmdNEjb4ieTyPsFV6cNxWtgUyHoZu8
	CL11go31Ukq4hpsdAWplsnCDy8GrQyspOtLiLXODx0vzTPYMFo3xcXbvd0vxiBaV
	RMmPFHZFkwmbE6xuwR4A57XFZZpylQhnXoUYnglFGTLmLckK4Ez+6KajSVh/GJNK
	T4O0egolOVK3rdSgUMINRTBMcOXfiahBpelktA63wTLF9hB4oH/Kj4THg66M6UXc
	+GqwmUhc9PZ0653L16tB8A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4emb5st7c2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jun 2026 10:44:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 658AcYht004119;
	Mon, 8 Jun 2026 10:44:03 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010067.outbound.protection.outlook.com [52.101.85.67])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ema0nn8qh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jun 2026 10:44:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KghBtZgaGLiQhaTLu0yORlELfJjjDVeLajsnL230h7CvnuNrWjRjyg+2py0Zfxvj7LzsIsjs8KrcEbx6opWV+7ro58pSSn8zlAEOKQ8kFhWSW5Ezj7+lfJjz1pS/fw/1OqQ9bVTp/uiiDwsF8ebRqtybw3Ka3Dn4kd5hF9mrWOTSqjdhl9zZoxRG/DNEFt4Fzn1SKMNwKJCCAzqgMOcPgboe5Iz17TDf7WB1hFwE7BjyuhwwZTjp+M0NTzspVS1m94m5V5pP1zHAWhXoB6yP2inaxS8e4QcUVYennLO1AgXs8i0r1TgR9a58cGKnJ6Twgmb9mbKLMT+WBRfR+BNXwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0uUWbSbVsQCFTv9C7xw2K8tMMDVRwglYe921ZZrgD4=;
 b=gVpznU5MwsQpnuGoaklKEDUPQO1zQXMXHbmvIrOYSkASQx+aDhWyxZmQjA6cKnFHCwNVn4EZBEV0QOSZVUubZEes+stRZwfYg4fW2kWPOGjpjZ2radqrJ+4v7Ts8yhc0KqYLv0SsMa9Omc5FZlqJu5D3BnuYN1t+imRlhrJ062r9jI5U54TLk6zyIDWqeorgDGJCXYjQu/qGhd1Yw95U0tpU6A83bVl+/Nr7VWOj15TDVkbo5oy6gKEkez9ph+sG5tzOmCTqerCd7C/dFC60oz+W1NLJjLzMPLq3Zvvff2NgTrjLZKLY0DZzj6CiruWuKl1Vspr2MenNKT0dmYyYsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0uUWbSbVsQCFTv9C7xw2K8tMMDVRwglYe921ZZrgD4=;
 b=SsE42vdFRTNarK36mlxb6hmWjwnAuDSIMW5KM/+4udxhqUb+IUYsjkZA49mF9RvND0cmZgqZ5VrRRbpk92QBCsx3SZTKUfpLxuh0DqUdh8lagvX6VAgf2KYIKY4VGdyzUdUaokgtId5LO7iYNQaY0RJTaW4tdNENriDspgK52gc=
Received: from BN0PR10MB4901.namprd10.prod.outlook.com (2603:10b6:408:126::19)
 by CY5PR10MB5985.namprd10.prod.outlook.com (2603:10b6:930:2b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 10:43:58 +0000
Received: from BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79]) by BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79%3]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 10:43:58 +0000
Message-ID: <e5411146-fb52-4ff1-8660-3ed5ae561149@oracle.com>
Date: Mon, 8 Jun 2026 11:43:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 4/6] dtrace: Add uresolve(symbol_name[,
 optional_fallback]) for symbol lookup
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, OpenAI Codex <codex@openai.com>,
        dtrace-devel@oss.oracle.com
References: <20260605221217.1211791-1-alan.maguire@oracle.com>
 <20260605221217.1211791-5-alan.maguire@oracle.com>
 <aiNzBHzLAk45BqeS@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <aiNzBHzLAk45BqeS@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX1P273CA0015.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:21::20) To BN0PR10MB4901.namprd10.prod.outlook.com
 (2603:10b6:408:126::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB4901:EE_|CY5PR10MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: a59bec23-d488-4acb-1d8b-08dec54ad81c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|6133799003|18002099003|22082099003|4143699003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	UWjXyOcSwubvrUmyTapiIVMFSjzueQPfo/Zqx1jSN++mdqIcjTCS7QE7tHaavcZNlJ1jSu/H4oQY299cM7i1rdpJy9QpmIAUr25bQd/q6ZaiJOxGCS5RDJT/l4Bf2XKBmUnoRp0WG5r58tk4NkK29e6ctJLpM7sAAMrmfcrxXmRDHg4n4JkhysH2e/8K9KX4u+IMR/Z0s5VlI2Wp4XoH2jR4ChN56oVzc6gj3yP9evJztwG0L3WV7Az+82JwAZqVexIlJY3iHGcwhohiDdNkh13rVV8myG+NqINLYGXmNSsmTifD3HJEgoAbvcv3h3cGsU0XLRvnB0dut6PBP9W1Lnwq7GbMFetsAu9xkwdXEvYFz+xDGcPdEndlFQeTAtghDLC8MyKrgm2ved+M6Ib9MoHPnjy3qE42zFmbhQTZBjo2Dba1da7nArOVJG1lJ9Et0bQrLHKHTPJiZ9siE2yrI/v0xUKKKABF2IdYxcBmi8tmz9uJygYfzcdlGfb2FyCwS/Ncla4Xp4+5aD5/dfHcPziuWy7ABVlRJ7X2bHB55cZWRqW89Opt+qhMVlaBeVNKq8YNJIyY0Rzec166BKxJgrMqUEtHpSGzpbQbHlh9A7t8jr30IIuz80MhJ06RDMGHFvP/99kYR5IywoCq7MDR+hsPDMuV9QY+7YmmpZgd2I+NanO43ULFgH1pPo/BvnJk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB4901.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzVZd3ZseTZ3L2J2ZUVzUnNGdkNzM2IybTEwSTBVSmVxc1NGd1NKQWpRSUtW?=
 =?utf-8?B?SUZlOVZvQlQwVFBKNXNmeDNsbU16aGZHUzh3VnBidnV6UUhocVRtSXo2bEEv?=
 =?utf-8?B?RzZTTW41WHlNZHp2OVRDbzBXWGpFeC93U2dYWEREdDN1bXRzZTFmV3MwS0oz?=
 =?utf-8?B?UHdOMWFkYk5DRFkzSUxRMlpROG4rMTFxeXdtWVpGMXhLaC9Sbmx0WGlxdkVr?=
 =?utf-8?B?ZzBtQ3NaK0hwdWxXQmNralR4dUhUanJGQnlCNWFZbVBybDNqYnRXblhvOW1N?=
 =?utf-8?B?Uy96b1pYTFY0TFlUTFhWSHhjcGZKcHd4cCtnWFc2VkRFaFlzOVN2bnZ4UHE0?=
 =?utf-8?B?U01ZcE03bnptTGZhMHlPWjlhSlJYaGVmQXl6d29LMkV0eC9PVk9nT0VQemNZ?=
 =?utf-8?B?MjJsUW1HTmtpTTgwRWFzeTU2S3A5YUFkV0Y2a2F6bUFadTRSK3NiczU3eDdU?=
 =?utf-8?B?Q3JBdUFXb0JvVzRzbVdkOFA3WjkyZlVJdWRvODVjcW01UUxzeUhJYlU3Mitq?=
 =?utf-8?B?amd6a3JXWng4MTFYUnRiM0NkOGg5RWtCQ2l1N0o0WUx3aUc4a0FoSER5Wncx?=
 =?utf-8?B?c0VyMWpicDhXRFdoUzRIK2h6dVNlL0hoZ1lVNGxtM0Q1TURZbmRmSHFnQjM2?=
 =?utf-8?B?b2ZDVDZ6RGthaVA0eWRvQ0c2NTd6SEhOcWw3N0hUNXlDOVlHSEM4ejhaWXNQ?=
 =?utf-8?B?QXQ4bTF3dW0xdXhzdEF1SjMrOUtZV0ptVkZJV0xrU3cxQmtwVU5aMU9NTWxN?=
 =?utf-8?B?b282U0pUYmpNWjZIMTV5Q3RQcEl6a0xhOFJ5T29oNnYxd2JDTno2UXlRQW9v?=
 =?utf-8?B?QVo0OWg5UTBDWTQvNmllYUo5WTVOQlhWVDJEcnpaS0lJbkV6MHpRcnFIQzVI?=
 =?utf-8?B?MmVHVHhnTXdoeGY3d25zalJ4V3llbXlWaW5yTmVKMnltM3lCUzUzNTM3R2Nr?=
 =?utf-8?B?SUYwenVPTzBYNStPZUUyVnBjOGR2WnZ2bzNCSU5BVnlxM1JzT2RkdDZOdVY1?=
 =?utf-8?B?dlFPWDdYcEFRSVEvSmdTS3VpNlJBRHp1K0RPUkVFNllkdEh2WlZWWGVFQmpv?=
 =?utf-8?B?V2s0TWNUR2h4MUlBczFJWURNY2hudXNnSVlWY2FHRTdXNDErN3YrQkI4NUNq?=
 =?utf-8?B?TkZGN1BDRVhBWkQ0TXBIWkpMSm8ySVViZWNaV01PTVJSb05zOVlEQU15NGsy?=
 =?utf-8?B?SSsreVVIK3cySmQwT1NJb012OFhYMkt0eityQ2t2Z3FkMUF4aFo5QzlOclVJ?=
 =?utf-8?B?QmJpdnBtdGVUdy9PUmlad3J1QVZZNjRGUUVQdFNIREVncFJNUVlWWGdkMGRk?=
 =?utf-8?B?ait5TnU0LzdCUlpFSkc5OEJFZWZ0UXVqY1JZNys0VjFncXZreVh3TncxcTM2?=
 =?utf-8?B?dDJ5Skc1aVdpUURBMXBxSGJqUVpDZEk4ZDM0RjlFWDF1d1VwRDFhaThGbmRC?=
 =?utf-8?B?YVVMYlpqcFhRQlAyS1pqaHN0MFdlbTZwRmhsQkRUNzBneXdxUXpkbDJ1cmZ2?=
 =?utf-8?B?ZXpkcEh5U3F6MzBZdXBxOWxreG9Ka1BiSm9RdTBMMUZIVHdrSmh1LzYzdGFl?=
 =?utf-8?B?T29FM0hOT0lKWlVLZTUrMHAzQ3J2NU9FZDRwNUMvZ2x0SjF5RzVqeGZoTXJD?=
 =?utf-8?B?eTczTHJqOGNjdTQ3djBISHBBNVRJOFRYdkEvTTJFMGh1d3BWR0hPd2pRVTdp?=
 =?utf-8?B?QzRhVXdVNDZ4TzU4c1RXNktSaC8rb0NzaCt1TjE5ZlFwa3lYeXloNzRKTk13?=
 =?utf-8?B?OU45YTNraGVDY0pLU1hSemFrQnAxZWFWdVNXVjJwbVB3d3g2RUtYRERNRlEy?=
 =?utf-8?B?NTVQSndsMnJueHZzaFkra2ZBTXhFUGFyaklWRW1ZRWFkcU9vRFpUc25zZnRN?=
 =?utf-8?B?WjBOZW13NFljZWdvdlhYWk45cHU5L2YrQUh1V2RMYUFvNTVmN0x4ZEVhNDZl?=
 =?utf-8?B?MUpVdlpMKzhzcmdaLzQwT2ZaMGtLTXFyakJ1V3RSUkV1b1Bxem94cXB5UWdW?=
 =?utf-8?B?MjE4TkNyalBlOVZyMTNOMVMzZ0tvUDhwbmRuMWZiSWtWS01EUDc3M3VsWmlR?=
 =?utf-8?B?SU5OTGlXeW01K1J1UnF6c0Y4NSthWlZEMStLcnVUUWZHcmxzU2dtRUpWMUx6?=
 =?utf-8?B?QTl0cG5iV0pIV3pFY2hHNjlaQnVHVklSSldpN0g1eXQxdFBLNlpvcVJFKzFN?=
 =?utf-8?B?OVBXTVMvaTg5UHZ1MVlEUERCVFl0dElIaGYzaWxDL1NLOTd0M1RQZUFKd1hQ?=
 =?utf-8?B?dnZzRUtxR2NKRG82ZlZKQ2Q0bWxGcTk0Kythc1J4bmlsSjJVQi9DS1NQV3Jk?=
 =?utf-8?B?aE80ZWx1M0lUNFNXUi9KdHhCRWd0STRDTDUxVnF4djVSVEZUNVVJQT09?=
X-Exchange-RoutingPolicyChecked:
	JRxmOnL1yCKHfNFFz9+EsePMP0u+GBlkl/4cdNLdLrxNN6NO1TMDhZsPfjvlsMF5w1dFSZtfKmgnpPx5pixIRzOPihoPD902xIQ1GNqi4dsQBSwLhWHT7FmGZns/+UcBp86kZEv+6M9z0v2DEiCSIQ8nxLyM1fLkdtBNbImg5Oz5HrLV3ufMHHpK02F41yHTOMFy5+g2/FThDzyvWVzbixQ4/x5bvW8CN42JpH8wNyQ7bWAJ/K1x58U52SURWd+bS5d5v97VgmsbGrp0QVd9WtX4FUmkHCnNgL4stJ99wodhRORZHzmVyBfHI8Rb2R2sR82+/S/otRKAFHSGYRRRmg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EIVEcSjdLbZySAMa1qglRlcYB1vR/7BaNcJRiNU4DiQUzQ3Z6XCGQkfLnkT2DPXMqa1ceQQLjg0141JSRnc6etWpQnH6v4OEPswRn0G2lKPftpWoE0SM7SFeAP+vHM/DJp6Kv0KfVDD4CYLcxQIKrsw4GdgcfqD/Pff/96ccF8HBo9eyyzTspXyZqOJiEfqvhHwoiZzFJQ1EssqXMrjEs8lgn//zgGFcwRVm3TTaJRQVdrjJia/5d9cciItvt3aoMyik4M+a1zBORcUdycUBn0hzGVMyg0+1SuJDkOCTQH3Ajp/ILTNslfZ5yntsmKxPrvemmU7x8rEsQVeGpE8WILCKgGTOjqzuuQPCTJrh89wvDpwAFsvA5dxlseceLoSy5jPJj2YCNrpmdJFOqZwFUIBKpxuRyqQKrKp6b60R1MuEBAVRFs8BQo3rBnJF598Kl6X9mtEGy0bmGdoyz2oulE7YsubFzKGrefTGsTLMMxTrRq3E2HybOPtv+OvbKml9HFNtejVWIn2fL4pc5BwPIGbVuy0e68pN1yh36fzmKdhuz0iWjiosIxe6lIv9G1Q2Y1F3kOm0hgT1WywmJKP4sn4R+IW8/qOIOVpu3XYmw8Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a59bec23-d488-4acb-1d8b-08dec54ad81c
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB4901.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:43:58.1785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bIU0Q1bisHV7jYuE+mpsGYLmCQOxv6+X0FGHyw0Cu16yAJVOZ+kIFmFydHlY6c52LK58Fd4KUXTefik7ZTj3Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5985
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2606080100
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwMSBTYWx0ZWRfXwVgyVUCRBDku
 GM6ZrMUQ//OD5GwGiRiYAwj/Yr51ruwHOF2sObugRaZFHsJjK/2GDrVjQHpBqW6PI8p4+b3xdhe
 3Q5oAgFb/jsPzelyj44yRyYJGdX/vtXf7DsCCtqygMnRsRBYMwgzdqX/rAWBguucjN46N1gRXHD
 IYKzqRwolxTgyWzglfic6Bnn7WWq8wGE/2CV6zB6HNN5Hm2PjDZ25hVTCsoiePGSqGwsaecpo2q
 xGLMA9sPc39+cm1lrCGZHMAXDwrdudTexH2TFnuVR51bFl8pADBA6EzLisTLa2x1yjDQv4L3hQI
 RTlfPTxhfwjTDl8pV/hCAgKsJIvhDAeripkYEIYqiEVDhLYgIzDujSeRHsFvrsirkWoQEezSi2B
 MbGhBvUWdt0Ed6+S/Dr9mobShbeodwqU9aYtI212e4GY1Q5HvW6bdPtC2JM7w+CiNZFAo1jaABO
 yHtpmVL2rVx9gcUqzjL72lRLVD/7ejOwi6wuU8mo=
X-Authority-Analysis: v=2.4 cv=XeC5Co55 c=1 sm=1 tr=0 ts=6a269cf3 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8
 a=LG5T7v2SAAAA:8 a=nU5iH2RAbmNYwRvahasA:9 a=DKilYceBH3asBdpy:21
 a=QEXdDO2ut3YA:10 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf
 awl=host:12313
X-Proofpoint-ORIG-GUID: ANvg--UrI3bDZS-AlELDcSRoNRfFmU5R
X-Proofpoint-GUID: ANvg--UrI3bDZS-AlELDcSRoNRfFmU5R

On 06/06/2026 02:08, Kris Van Hees wrote:
> A few initial comments:
> 
> - How is this different from what ``symbol or object``symbol would provide?
>   (Yes, as far as I know it never got fully implemented but I think this might
>    be similar to what you are doing, and perhaps it would be better to use the
>    already documented syntax, and actually implement it more fully.)
>

this is a good idea; I've rebuilt using the existing `` syntax, and it works
well.  My only reservation was losing the fallback behaviour that uresolve() provided;
however I've implemented that with an option -xuresolvefail=zero which zeros out the 
results of address resolution to allow scripts to handle missing symbols.

One other change below relating to your next question..
 
> - I think it is problematic that the cg code is making calls to a function in
>   a particular provider.  THe architecture has been quite careful at avoiding
>   breaking through that boundary.  I'm still digging a bit more through the
>   code to determine exactly why that call is truly needed - it should not be
>   necessary as far as I can see.
> 

We can fix that as well; it is reasonable to expect in systemwide probe context
that a user qualify their symbol with the object (with the proviso that we
support path expansion as we do for the probemod). This requires a few minor
lexical changes to support filenames with "." in them, but it makes sense and
avoids us having to make inferences from the probe context. So in other words
to retrieve a global variable from libpython during systemwide probing we'd have

python*:libpython3.6m.so::function-entry
{
	this->cur = copyin((uintptr_t)&libpython3.6m.so``_PyThreadState_Current, sizeof(void *));
	..
}

> Resolution of a userspace symbol should essentially be a simple matter of:
> 
> 	object-base-addr + symbol-offset
> 
> where the object is a particular mapping within the address space of the
> current user process.
> 
> On Fri, Jun 05, 2026 at 11:12:15PM +0100, Alan Maguire via DTrace-devel wrote:
>> Add uresolve(symbol[, fallback]) to resolve user-space symbols from D
>> scripts.  uresolve() resolves a symbol to an object-relative offset at
>> compile time, then computes the process-specific runtime address at probe
>> fire time as:
>>
>>     current uprobe IP - probe offset + symbol offset
>>
>> For pid$target probes, use the target process and its /proc/<pid>/maps state
>> to find the symbol and translate it to the same object-relative coordinate
>> used by uprobes.  For system-wide uprobes, resolve the offset from the probed
>> object file.  In both cases, address generation is shared and remains dynamic;
>> the presence of a target process does not bake in an absolute address.
>>
>> Use bpf_get_func_ip() when available so system-wide uprobes use the actual
>> probed instruction address rather than a saved pt_regs IP that may contain
>> the resume address.  Retain the saved-IP path as a fallback.
>>
>> This allows scripts to locate process-local data such as
>> _PyThreadState_Current across ASLR and across system-wide probes firing in
>> different processes.  The optional fallback argument is returned when the
>> symbol cannot be resolved; without it, resolution failure remains a
>> compile-time error.
>>
>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>> Assisted-by: OpenAI Codex (GPT-5) <codex@openai.com>
>> ---
>>  include/dtrace/dif_defines.h |   3 +-
>>  libdtrace/dt_bpf.c           |   1 +
>>  libdtrace/dt_cg.c            | 456 +++++++++++++++++++++++++++++++++++
>>  libdtrace/dt_open.c          |   2 +
>>  libdtrace/dt_probe.h         |   1 +
>>  libdtrace/dt_prov_uprobe.c   |  58 ++++-
>>  6 files changed, 516 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
>> index edb98f06..63b8c293 100644
>> --- a/include/dtrace/dif_defines.h
>> +++ b/include/dtrace/dif_defines.h
>> @@ -213,8 +213,9 @@
>>  #define DIF_SUBR_LINK_NTOP		45
>>  #define DIF_SUBR_STACK			46
>>  #define DIF_SUBR_USTACK			47
>> +#define DIF_SUBR_URESOLVE		48
>>  
>> -#define DIF_SUBR_MAX			47
>> +#define DIF_SUBR_MAX			48
>>  
>>  typedef uint32_t	dif_instr_t;
>>  
>> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
>> index 146a66e3..aecd71d9 100644
>> --- a/libdtrace/dt_bpf.c
>> +++ b/libdtrace/dt_bpf.c
>> @@ -470,6 +470,7 @@ dt_bpf_init_helpers(dtrace_hdl_t *dtp)
>>  	BPF_HELPER_MAP(probe_read_user_str, probe_read_str);
>>  	BPF_HELPER_MAP(probe_read_kernel, probe_read);
>>  	BPF_HELPER_MAP(probe_read_kernel_str, probe_read_str);
>> +	BPF_HELPER_MAP(get_func_ip, unspec);
>>  	BPF_HELPER_MAP(get_current_task_btf, unspec);
>>  	BPF_HELPER_MAP(task_pt_regs, unspec);
>>  #undef BPF_HELPER_MAP
>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>> index 1bd73e11..16c58e35 100644
>> --- a/libdtrace/dt_cg.c
>> +++ b/libdtrace/dt_cg.c
>> @@ -11,6 +11,9 @@
>>  #include <setjmp.h>
>>  #include <assert.h>
>>  #include <errno.h>
>> +#include <ctype.h>
>> +#include <fcntl.h>
>> +#include <unistd.h>
>>  
>>  #include <sys/socket.h>			/* needed for if_arp.h on OL7/x86 */
>>  #include <linux/if_arp.h>		/* ARPHRD_ETHER ARPHRD_INFINIBAND */
>> @@ -6988,6 +6991,458 @@ dt_cg_subr_link_ntop(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>>  	dt_regset_free(drp, type->dn_reg);
>>  }
>>  
>> +static const char *
>> +dt_cg_basename(const char *path)
>> +{
>> +	const char	*p;
>> +
>> +	p = strrchr(path, '/');
>> +	return p != NULL ? p + 1 : path;
>> +}
>> +
>> +static int
>> +dt_cg_parse_objname(const char *mod, Lmid_t *lmidp, const char **objp)
>> +{
>> +	char	*end;
>> +
>> +	if (mod == NULL || mod[0] == '\0' || strisglob(mod))
>> +		return -1;
>> +
>> +	if (strncmp(mod, "LM", 2) == 0 && isdigit((unsigned char)mod[2])) {
>> +		*lmidp = strtoul(mod + 2, &end, 16);
>> +		if (*end != '`' || end[1] == '\0' || strchr(end + 1, '`'))
>> +			return -1;
>> +
>> +		*objp = end + 1;
>> +		return 0;
>> +	}
>> +
>> +	*lmidp = PR_LMID_EVERY;
>> +	*objp = mod;
>> +	return 0;
>> +}
>> +
>> +static int
>> +dt_cg_probe_objname(const dt_probe_t *prp, Lmid_t *lmidp, const char **objp)
>> +{
>> +	if (prp == NULL || prp->desc == NULL)
>> +		return -1;
>> +
>> +	return dt_cg_parse_objname(prp->desc->mod, lmidp, objp);
>> +}
>> +
>> +static int
>> +dt_cg_obj_matches_path(const char *obj, const char *path)
>> +{
>> +	const char	*base;
>> +	Lmid_t		lmid;
>> +
>> +	if (obj == NULL || path == NULL)
>> +		return 0;
>> +
>> +	if (dt_cg_parse_objname(obj, &lmid, &obj) == -1)
>> +		return 0;
>> +
>> +	base = dt_cg_basename(path);
>> +	return strcmp(obj, path) == 0 || strcmp(obj, base) == 0;
>> +}
>> +
>> +static int
>> +dt_cg_elf_sym_to_offset(Elf *elf, const GElf_Sym *sym, uint64_t *offp)
>> +{
>> +	GElf_Ehdr	ehdr;
>> +	size_t		i, phnum;
>> +	uint64_t	base = 0;
>> +
>> +	if (sym->st_shndx == SHN_UNDEF ||
>> +	    gelf_getehdr(elf, &ehdr) == NULL ||
>> +	    elf_getphdrnum(elf, &phnum) != 0)
>> +		return -1;
>> +
>> +	/*
>> +	 * Match the object-relative coordinate used by uprobe offsets.  For
>> +	 * ET_DYN, libproc computes file_dyn_base from the first PT_LOAD
>> +	 * segment's page offset.  For ET_EXEC, the load bias is zero and the
>> +	 * first segment's vaddr remains part of the object-relative offset.
>> +	 */
>> +	for (i = 0; i < phnum; i++) {
>> +		GElf_Phdr	phdr;
>> +
>> +		if (gelf_getphdr(elf, i, &phdr) == NULL ||
>> +		    phdr.p_type != PT_LOAD)
>> +			continue;
>> +
>> +		if (ehdr.e_type == ET_EXEC)
>> +			base = phdr.p_vaddr;
>> +		else if (ehdr.e_type == ET_DYN && phdr.p_align != 0)
>> +			base = phdr.p_vaddr & (phdr.p_align - 1);
>> +
>> +		break;
>> +	}
>> +
>> +	if (i == phnum || sym->st_value < base)
>> +		return -1;
>> +
>> +	*offp = sym->st_value - base;
>> +	return 0;
>> +}
>> +
>> +static int
>> +dt_cg_elf_lookup_symtab(Elf *elf, int type, const char *name, GElf_Sym *symp)
>> +{
>> +	Elf_Scn		*scn = NULL;
>> +
>> +	while ((scn = elf_nextscn(elf, scn)) != NULL) {
>> +		GElf_Shdr	shdr;
>> +		Elf_Data	*data;
>> +		size_t		i, nsyms;
>> +
>> +		if (gelf_getshdr(scn, &shdr) == NULL ||
>> +		    shdr.sh_type != type ||
>> +		    shdr.sh_entsize == 0)
>> +			continue;
>> +
>> +		data = elf_getdata(scn, NULL);
>> +		if (data == NULL)
>> +			continue;
>> +
>> +		nsyms = shdr.sh_size / shdr.sh_entsize;
>> +		for (i = 0; i < nsyms; i++) {
>> +			GElf_Sym	sym;
>> +			const char	*s;
>> +			uchar_t		stype;
>> +
>> +			if (gelf_getsym(data, i, &sym) == NULL ||
>> +			    sym.st_name == 0 ||
>> +			    sym.st_shndx == SHN_UNDEF)
>> +				continue;
>> +
>> +			stype = GELF_ST_TYPE(sym.st_info);
>> +			if (stype == STT_FILE || stype == STT_SECTION)
>> +				continue;
>> +
>> +			s = elf_strptr(elf, shdr.sh_link, sym.st_name);
>> +			if (s != NULL && strcmp(s, name) == 0) {
>> +				*symp = sym;
>> +				return 0;
>> +			}
>> +		}
>> +	}
>> +
>> +	return -1;
>> +}
>> +
>> +static int
>> +dt_cg_elf_lookup_offset(const char *path, const char *name, uint64_t *offp)
>> +{
>> +	GElf_Sym	sym;
>> +	Elf		*elf = NULL;
>> +	int		fd, rc = -1;
>> +
>> +	fd = open(path, O_RDONLY);
>> +	if (fd < 0)
>> +		return -1;
>> +
>> +	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);
>> +	if (elf == NULL || elf_kind(elf) != ELF_K_ELF)
>> +		goto out;
>> +
>> +	if (dt_cg_elf_lookup_symtab(elf, SHT_SYMTAB, name, &sym) == -1 &&
>> +	    dt_cg_elf_lookup_symtab(elf, SHT_DYNSYM, name, &sym) == -1)
>> +		goto out;
>> +
>> +	rc = dt_cg_elf_sym_to_offset(elf, &sym, offp);
>> +
>> +out:
>> +	if (elf != NULL)
>> +		elf_end(elf);
>> +	close(fd);
>> +	return rc;
>> +}
>> +
>> +typedef struct dt_cg_uresolve_arg {
>> +	const char	*name;
>> +	const char	*obj;
>> +	int		explicit_obj;
>> +	int		nmatches;
>> +	int		no_path;
>> +	int		no_symbol;
>> +	int		bad_object;
>> +	int		different_offset;
>> +	uint64_t	off;
>> +} dt_cg_uresolve_arg_t;
>> +
>> +static int
>> +dt_cg_uresolve_probe(dtrace_hdl_t *dtp, dt_probe_t *prp, void *arg)
>> +{
>> +	dt_cg_uresolve_arg_t	*uap = arg;
>> +	const char		*path;
>> +	uint64_t		off;
>> +
>> +	path = dt_probe_uprobe_path(prp);
>> +	if (path == NULL) {
>> +		uap->no_path = 1;
>> +		return 1;
>> +	}
>> +
>> +	if (uap->explicit_obj && !dt_cg_obj_matches_path(uap->obj, path)) {
>> +		uap->bad_object = 1;
>> +		return 1;
>> +	}
>> +
>> +	if (dt_cg_elf_lookup_offset(path, uap->name, &off) != 0) {
>> +		uap->no_symbol = 1;
>> +		return 1;
>> +	}
>> +
>> +	if (uap->nmatches++ == 0) {
>> +		uap->off = off;
>> +		return 0;
>> +	}
>> +
>> +	if (uap->off != off) {
>> +		uap->different_offset = 1;
>> +		return 1;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int
>> +dt_cg_uresolve_from_probe_file(dt_node_t *dnp, dt_node_t *arg,
>> +			       const char *name, const char *obj,
>> +			       int explicit_obj, int allow_fallback,
>> +			       uint64_t *offp)
>> +{
>> +	dt_cg_uresolve_arg_t	uarg = { 0 };
>> +	dtrace_hdl_t		*dtp = yypcb->pcb_hdl;
>> +
>> +	uarg.name = name;
>> +	uarg.obj = obj;
>> +	uarg.explicit_obj = explicit_obj;
>> +
>> +	if (yypcb->pcb_pdesc != NULL)
>> +		dt_probe_iter(dtp, yypcb->pcb_pdesc, dt_cg_uresolve_probe,
>> +			      NULL, &uarg);
>> +	else if (yypcb->pcb_probe != NULL)
>> +		dt_cg_uresolve_probe(dtp, yypcb->pcb_probe, &uarg);
>> +
>> +	if (uarg.bad_object)
>> +		dnerror(arg, D_PROC_NAME, "uresolve( ) object %s does not "
>> +			"match the current uprobe object\n", obj);
>> +	if (uarg.no_path)
>> +		dnerror(dnp, D_PROC_NAME, "uresolve( ) requires a unique "
>> +			"uprobe object path for this probe\n");
>> +	if (uarg.no_symbol) {
>> +		if (allow_fallback)
>> +			return -1;
>> +
>> +		dnerror(arg, D_PROC_FUNC, "failed to resolve user symbol %s "
>> +			"in the current uprobe object\n", arg->dn_string);
>> +	}
>> +
>> +	if (uarg.nmatches == 0) {
>> +		dnerror(dnp, D_PROC_NAME, "uresolve( ) cannot determine the "
>> +			"current uprobe object\n");
>> +	}
>> +
>> +	if (uarg.different_offset)
>> +		dnerror(arg, D_PROC_FUNC, "uresolve( ) matched multiple "
>> +			"uprobe objects with different offsets for symbol %s\n",
>> +			arg->dn_string);
>> +
>> +	*offp = uarg.off;
>> +	return 0;
>> +}
>> +
>> +static int
>> +dt_cg_uresolve_from_target(dt_node_t *dnp, dt_node_t *arg, pid_t pid,
>> +			   Lmid_t lmid, const char *obj, const char *name,
>> +			   int allow_fallback, uint64_t *offp)
>> +{
>> +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
>> +	const prmap_t	*mapp, *first;
>> +	GElf_Sym	sym;
>> +	pid_t		gpid;
>> +	int		err = 0;
>> +
>> +	gpid = dt_proc_grab_lock(dtp, pid,
>> +	    DTRACE_PROC_WAITING | DTRACE_PROC_SHORTLIVED);
>> +	if (gpid <= 0)
>> +		dnerror(dnp, D_PROC_GRAB, "failed to grab target process %d "
>> +			"for uresolve( )\n", pid);
>> +
>> +	if (dt_Pxlookup_by_name(dtp, gpid, lmid, obj, name,
>> +	    &sym, NULL) != 0) {
>> +		err = 1;
>> +	} else if ((mapp = dt_Paddr_to_map(dtp, gpid, sym.st_value)) == NULL ||
>> +	    mapp->pr_file == NULL ||
>> +	    (first = mapp->pr_file->first_segment) == NULL ||
>> +	    sym.st_value < first->pr_vaddr) {
>> +		err = 1;
>> +	} else {
>> +		*offp = sym.st_value - first->pr_vaddr;
>> +	}
>> +
>> +	dt_proc_release_unlock(dtp, gpid);
>> +
>> +	if (err == 0)
>> +		return 0;
>> +
>> +	if (allow_fallback)
>> +		return -1;
>> +
>> +	dnerror(arg, D_PROC_FUNC, "failed to resolve target user symbol %s\n",
>> +		arg->dn_string);
>> +}
>> +
>> +static void
>> +dt_cg_uresolve_emit_offset_addr(dt_node_t *dnp, dt_irlist_t *dlp,
>> +				dt_regset_t *drp, uint64_t symoff)
>> +{
>> +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
>> +	int	treg;
>> +
>> +	/*
>> +	 * Compute the current object base from the saved user PC and the
>> +	 * uprobe offset, then add the compile-time-resolved symbol offset.
>> +	 * When available, use the kernel's current uprobe IP directly because
>> +	 * the saved register block may not reliably carry the breakpoint
>> +	 * address for system-wide uprobes across different processes.
>> +	 */
>> +	if (dtp->dt_bpfhelper[BPF_FUNC_get_func_ip] != BPF_FUNC_unspec) {
>> +		if (dt_regset_xalloc_args(drp) == -1)
>> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>> +		if (dt_regset_xalloc(drp, BPF_REG_0) == -1)
>> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>> +
>> +		dt_cg_access_dctx(BPF_REG_1, dlp, drp, DCTX_CTX);
>> +		emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_get_func_ip]));
>> +		dt_regset_free_args(drp);
>> +
>> +		if ((dnp->dn_reg = dt_regset_alloc(drp)) == -1)
>> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>> +
>> +		emit(dlp, BPF_MOV_REG(dnp->dn_reg, BPF_REG_0));
>> +		dt_regset_free(drp, BPF_REG_0);
>> +	} else {
>> +		if ((dnp->dn_reg = dt_regset_alloc(drp)) == -1)
>> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>> +
>> +		if ((treg = dt_regset_alloc(drp)) == -1)
>> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>> +
>> +		dt_cg_access_dctx(treg, dlp, drp, DCTX_MST);
>> +		emit(dlp, BPF_LOAD(BPF_DW, dnp->dn_reg, treg,
>> +				   DMST_REGS + PT_REGS_IP));
>> +		dt_regset_free(drp, treg);
>> +	}
>> +
>> +	if ((treg = dt_regset_alloc(drp)) == -1)
>> +		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>> +
>> +	dt_cg_access_dctx(treg, dlp, drp, DCTX_MST);
>> +	emit(dlp, BPF_LOAD(BPF_DW, treg, treg, DMST_PROFF));
>> +	emit(dlp, BPF_ALU64_REG(BPF_SUB, dnp->dn_reg, treg));
>> +	dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, treg, symoff);
>> +	emit(dlp, BPF_ALU64_REG(BPF_ADD, dnp->dn_reg, treg));
>> +
>> +	dt_regset_free(drp, treg);
>> +}
>> +
>> +static void
>> +dt_cg_subr_uresolve(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>> +{
>> +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
>> +	dt_node_t	*arg = dnp->dn_args;
>> +	dt_node_t	*fallback;
>> +	dt_ident_t	*tidp;
>> +	pid_t		pid = 0;
>> +	char		*spec, *tick;
>> +	const char	*obj = NULL;
>> +	const char	*name;
>> +	Lmid_t		lmid = PR_LMID_EVERY;
>> +	uint64_t	off = 0;
>> +	int		err = 0, explicit_obj = 0;
>> +	int		use_fallback = 0;
>> +
>> +	if (arg == NULL || (arg->dn_list != NULL &&
>> +	    arg->dn_list->dn_list != NULL))
>> +		dnerror(dnp, D_PROTO_LEN, "uresolve( ) prototype mismatch: "
>> +			"expected 1 or 2 arguments\n");
>> +
>> +	if (arg->dn_kind != DT_NODE_STRING)
>> +		dnerror(arg, D_PROTO_ARG, "uresolve( ) argument #1 must be "
>> +			"a string constant\n");
>> +
>> +	fallback = arg->dn_list;
>> +	tidp = dt_idhash_lookup(dtp->dt_macros, "target");
>> +	if (tidp != NULL)
>> +		pid = tidp->di_id;
>> +
>> +	spec = strdup(arg->dn_string);
>> +	if (spec == NULL)
>> +		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
>> +
>> +	tick = strrchr(spec, '`');
>> +	if (tick != NULL) {
>> +		*tick = '\0';
>> +		obj = spec;
>> +		name = tick + 1;
>> +		explicit_obj = 1;
>> +
>> +		if (*obj == '\0' || *name == '\0')
>> +			err = 1;
>> +	} else {
>> +		name = spec;
>> +	}
>> +
>> +	if (err != 0) {
>> +		free(spec);
>> +		dnerror(arg, D_PROC_NAME, "uresolve( ) argument must be "
>> +			"\"symbol\" or \"object`symbol\"\n");
>> +	}
>> +
>> +	if (pid == 0) {
>> +		if (dt_cg_uresolve_from_probe_file(dnp, arg, name, obj,
>> +		    explicit_obj, fallback != NULL, &off) != 0)
>> +			use_fallback = 1;
>> +		goto done;
>> +	}
>> +
>> +	if (explicit_obj) {
>> +		if (dt_cg_parse_objname(obj, &lmid, &obj) != 0) {
>> +			free(spec);
>> +			dnerror(arg, D_PROC_NAME, "uresolve( ) object %s is "
>> +				"not a valid user object name\n", arg->dn_string);
>> +		}
>> +	} else if (dt_cg_probe_objname(yypcb->pcb_probe, &lmid, &obj) != 0) {
>> +		const char	*path = dt_probe_uprobe_path(yypcb->pcb_probe);
>> +
>> +		if (path != NULL) {
>> +			obj = path;
>> +			lmid = PR_LMID_EVERY;
>> +		} else {
>> +			free(spec);
>> +			dnerror(arg, D_PROC_NAME, "unqualified uresolve( ) "
>> +				"requires a concrete probe module\n");
>> +		}
>> +	}
>> +
>> +	if (dt_cg_uresolve_from_target(dnp, arg, pid, lmid, obj, name,
>> +	    fallback != NULL, &off) != 0)
>> +		use_fallback = 1;
>> +
>> +done:
>> +	free(spec);
>> +
>> +	if (use_fallback) {
>> +		dt_cg_node(fallback, dlp, drp);
>> +		dnp->dn_reg = fallback->dn_reg;
>> +	} else
>> +		dt_cg_uresolve_emit_offset_addr(dnp, dlp, drp, off);
>> +}
>> +
>>  typedef void dt_cg_subr_f(dt_node_t *, dt_irlist_t *, dt_regset_t *);
>>  
>>  static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
>> @@ -7039,6 +7494,7 @@ static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
>>  	[DIF_SUBR_LINK_NTOP]		= &dt_cg_subr_link_ntop,
>>  	[DIF_SUBR_STACK]		= &dt_cg_subr_stack,
>>  	[DIF_SUBR_USTACK]		= &dt_cg_subr_ustack,
>> +	[DIF_SUBR_URESOLVE]		= &dt_cg_subr_uresolve,
>>  };
>>  
>>  static void
>> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
>> index ca00788a..0505e2ff 100644
>> --- a/libdtrace/dt_open.c
>> +++ b/libdtrace/dt_open.c
>> @@ -330,6 +330,8 @@ static const dt_ident_t _dtrace_globals[] = {
>>  	DT_VERS_1_2, &dt_idops_func, "_usymaddr(uintptr_t)" },
>>  { "uregs", DT_IDENT_ARRAY, 0, DIF_VAR_UREGS, DT_ATTR_STABCMN, DT_VERS_1_0,
>>  	&dt_idops_regs, NULL },
>> +{ "uresolve", DT_IDENT_FUNC, 0, DIF_SUBR_URESOLVE, DT_ATTR_STABCMN,
>> +	DT_VERS_2_0, &dt_idops_func, "uintptr_t(string, [uintptr_t])" },
>>  { "ustack", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_USTACK, DT_ATTR_STABCMN,
>>  	DT_VERS_1_0, &dt_idops_func, "dt_stack_t([uint32_t], [uint32_t])" },
>>  { "ustackdepth", DT_IDENT_SCALAR, 0, DIF_VAR_USTACKDEPTH,
>> diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
>> index 54053cd3..bff47055 100644
>> --- a/libdtrace/dt_probe.h
>> +++ b/libdtrace/dt_probe.h
>> @@ -102,6 +102,7 @@ typedef int dt_dependent_f(dtrace_hdl_t *dtp, dt_probe_t *prp, void *arg);
>>  extern int dt_probe_dependent_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>>  				   dt_dependent_f *func, void *arg);
>>  
>> +extern const char *dt_probe_uprobe_path(const dt_probe_t *prp);
>>  
>>  extern void dt_probe_init(dtrace_hdl_t *dtp);
>>  extern void dt_probe_detach_all(dtrace_hdl_t *dtp);
>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>> index d53b1e43..9a481f59 100644
>> --- a/libdtrace/dt_prov_uprobe.c
>> +++ b/libdtrace/dt_prov_uprobe.c
>> @@ -307,6 +307,47 @@ typedef struct uprobe_data {
>>  	int	ref_shift;
>>  } uprobe_data_t;
>>  
>> +dt_provimpl_t	dt_pid;
>> +dt_provimpl_t	dt_usdt;
>> +dt_provimpl_t	dt_stapsdt;
>> +
>> +const char *
>> +dt_probe_uprobe_path(const dt_probe_t *prp)
>> +{
>> +	const dt_uprobe_t	*upp;
>> +	const list_probe_t	*pup;
>> +	const char		*path = NULL;
>> +
>> +	if (prp == NULL || prp->prov == NULL)
>> +		return NULL;
>> +
>> +	if (prp->prov->impl == &dt_uprobe) {
>> +		upp = prp->prv_data;
>> +		return upp != NULL ? upp->fn : NULL;
>> +	}
>> +
>> +	if (prp->prov->impl != &dt_pid &&
>> +	    prp->prov->impl != &dt_usdt &&
>> +	    prp->prov->impl != &dt_stapsdt)
>> +		return NULL;
>> +
>> +	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
>> +		if (pup->probe == NULL || pup->probe->prv_data == NULL)
>> +			return NULL;
>> +
>> +		upp = pup->probe->prv_data;
>> +		if (upp->fn == NULL)
>> +			return NULL;
>> +
>> +		if (path == NULL)
>> +			path = upp->fn;
>> +		else if (strcmp(path, upp->fn) != 0)
>> +			return NULL;
>> +	}
>> +
>> +	return path;
>> +}
>> +
>>  static const dtrace_pattr_t	pattr = {
>>  { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
>>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
>> @@ -315,10 +356,6 @@ static const dtrace_pattr_t	pattr = {
>>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
>>  };
>>  
>> -dt_provimpl_t	dt_pid;
>> -dt_provimpl_t	dt_usdt;
>> -dt_provimpl_t	dt_stapsdt;
>> -
>>  #define UPROBE_CONFIG	"/sys/bus/event_source/devices/uprobe/"
>>  #define PERF_TYPE_FILE	(UPROBE_CONFIG "type")
>>  #define RET_FLAG_FILE	(UPROBE_CONFIG "format/retprobe")
>> @@ -1392,6 +1429,19 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>  	 */
>>  	dt_cg_tramp_copy_regs(pcb);
>>  
>> +	/*
>> +	 * On some architectures the saved user IP in the uprobe pt_regs is the
>> +	 * resume address rather than the probed instruction address.  Normalize
>> +	 * the saved IP to the actual uprobe address when the kernel can provide
>> +	 * it so consumers such as uresolve() can derive the correct object base.
>> +	 */
>> +	if (dtp->dt_bpfhelper[BPF_FUNC_get_func_ip] != BPF_FUNC_unspec) {
>> +		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_8));
>> +		emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_get_func_ip]));
>> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7,
>> +				    DMST_REGS + PT_REGS_IP, BPF_REG_0));
>> +	}
>> +
>>  	/*
>>  	 * Record the uprobe instrumentation offset in the probe context.
>>  	 * This is the same object-relative offset passed to perf_event_open()
>> -- 
>> 2.43.5
>>
>>
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel

