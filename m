Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26FD14A8B
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 20:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742242573; cv=fail; b=DoD0J9hDZj+o3tu2kuIiOXMYzoA2OXk7hSTYMfhEMfanQjlZ3nV1U8+X0gZg4WKduTRt6wxucdleYqS9IWoAEBorIPIQPsErO0D2rfXftSgKv1uEZXB/D9CKvdinX7MZcDgwXHHDyVDSDF12EfGmtC8cxV4Kvt21OKD1t7EM5DM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742242573; c=relaxed/simple;
	bh=/GuS9pbTOI4AkYrIffwIyKGQ+JcM+ZNNd7xj0K8QJbo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kEwZpk96AwFUHIImHTjW141EzYdfGJh5hbIwd+e4cV10a3br9KmLeWf2AvFQgwZvsbBhgn74tfuIrEmL8xPNUDyVoGOhPpoqNGDiS2kks0nfg89/0BlCvSQ8f/xVU4+XR+F5CLK7mWev0Lv093g+2pFae9cejRsa6Vo92zV95W8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YQueV9Yz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pGJEOHLn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YQueV9Yz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pGJEOHLn"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HJfu5F019201
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 20:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=ZcdKZnjGjdOX1bVnaFAG8lIticbHbYJDVyJft4MUX+s=; b=
	YQueV9YzkeP0zAfMcx56Xmbu8201GhCn0J6LjjT+STHIbBQIKZfMpHNKBLJzdFX7
	6+oAG7z5vE3euaKt0WN1zxz18bklA8R92K7nLmyooOmt2BSgNRThFYty/Sq7SshE
	hFTS8gN8xgUZMDJ1x8C6OhjLktzLkzlDo9Krm6kYDoKCRH+8XhMJZZBSg2ezWq14
	0PvfW0s7H2OkL8RW60EBve2c8FQKSGc+QPyOTjUV46saYV8OUoP8A75uYPa7+Z9X
	MVeRxfNeFWj6v838/PSjWKCZzL3VnApI8oQpBex63uJGdu7jnNNWsHf+GGhWhBnS
	rbiCWVnhzYpVqkuKaIlTaw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1m3ktd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 20:16:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52HJ4I2T027987
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 20:16:09 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxdcem65-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 20:16:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqOjTrXqgsivbYhvqdRywFQXx0tklmHaW6WdE7eJp2fge30eXs7teswEEUBd7Av6OX4/Atg6lJ0JgD7Hwvpu0wsR0tFkWmE4/gRHPZeupEYALAWyKqNN2+IJL3E9Z5Z8gpqzzf+nPCpCUuXsJQXNtmWiiXpxAGP6aTjsPLTGSa2aQN1i4Sofq2xVAmDDT57Drqqnk9xGJGhKVw/pvecMriG01hC93l/9EYq3oRK6koKCvESLcCV1lGCroz0rp6KLYqtGrPcO5iuk0jmBW/A+wK9iTWAUdla7B86RQgpAoPYl64f+IGzvT2HySIyaROMvTAufWk+FygZnw4mCqbuLwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcdKZnjGjdOX1bVnaFAG8lIticbHbYJDVyJft4MUX+s=;
 b=fi4nmpjkNOpNThLufOwFKfTxyLDb+MRKryJxBu2q/Seqt59MIOGURHObUes0D2BgX/MepcKiQK4PYod3MXceMeEy/WpNphuODWXfebdo+J+AKGnFMYPXcKB8i/zhH0LoFvyQuL3UTK7wpjw6oU2sBKtpGYRwFgkNwLLHbxLmOAg8IUoi0JQMUl8CsklOnZ3JJ/t6OOztDqxOxwZfYSjVQh8rN1DDpWLKBaqTHhpquEsS0qaHltIOV2VmeerEHTKRURGDIkIiLbygZ95q/pRnqXVkf03gNjtXh+oazIs2cEHi9zJy+EhXOkKbWSyDdGRHzYhodbLy7DN7cNFoBh3YOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcdKZnjGjdOX1bVnaFAG8lIticbHbYJDVyJft4MUX+s=;
 b=pGJEOHLn9iZPwhXkxwN6jgTkLoaBWdwb2VSKLRxgT5WC3rYkViLxAo0X+xD8nwQbRbyZst+l5VaTuPN4TEVEhpI7/bzhmw2+mKZSf/tzq74T2dvFVjYW6DVJgiGrWqV0K1fgmsjgG0DbMSjf89I516WgtGnPwu71UEqE9csG7NE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 20:16:06 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 20:16:06 +0000
Message-ID: <e0f0aafb-d76a-56ee-2e12-36f19da409d1@oracle.com>
Date: Mon, 17 Mar 2025 16:16:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] bpf: fix have_attach_type() detection
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <34f1beb7ed7b330dcc9031f23483f546.kris.van.hees@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <34f1beb7ed7b330dcc9031f23483f546.kris.van.hees@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:408:143::30) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6271:EE_
X-MS-Office365-Filtering-Correlation-Id: c23ff66b-a8c9-4819-103f-08dd65908c8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUMxanZNV0lLU0FOMzJoMzJZSkZlaVhWS0ttWFBLbCttRDE1U2c4ZzJDdEQw?=
 =?utf-8?B?MzZBeWl5cmpkQzM1RzBaR0dXNnhTTTJTR1NZSDA3bnFiUC9qdzkyNGhYVTBt?=
 =?utf-8?B?bnN4QUY3dHl0N3NCYlRQWUdILy9CeWd5NnVBajBiZXR6OHpmczByaEU4ZUVh?=
 =?utf-8?B?a1A2Yzcvb01KM0Zmbi9iU0FqWmF2azIvR1hrRmxPWGNUSllobVJrRlFUVGdO?=
 =?utf-8?B?cFJJTlV6NE84NGxaempLVTZOZ1hwb3ZLendwY1N6R0g1aU5ZZkh4QjNiRVZs?=
 =?utf-8?B?b0tlNXl3bytaWStZMXYyVzVGT1pWL1JvYXBvbzBDcVk5cllFbU53T2tWeFVv?=
 =?utf-8?B?MnBoaXlLQVRaSlFLc0pka1UyTjRNWTBVNGhKWGxWUmRydXY0VW1EQUcxenB6?=
 =?utf-8?B?aUdGWmhYbmlHYWp6Umpsb2ppQ0FjRERtRklzNzVFYm5yMVlqVTg2SWJCMzdi?=
 =?utf-8?B?Y1IwWGk3bndIY3A1OVlzb1krQTFJSUpuNHFvNVkxaG1lWVhSZmhENzhXMWN0?=
 =?utf-8?B?UVZBazZvdkg5WGIwajlDcXA5TTN6NTV0MUhLMkVESkVSYWxzdFVsVXAyOG54?=
 =?utf-8?B?ai8vS3plWmpEVW12YWVTTzJEUWVDYitwOFMxN3JyamhvWmlaNjJNc2hQMHIx?=
 =?utf-8?B?Yk8vSC9rblZRNGNya0VoR2tUakF5YWt6YXZEeTRLZ0ttdk1JcSs1VDhjQm5I?=
 =?utf-8?B?dG5tUTFMSjVqcm1CZ1lFaFRzNG1nT3pURVVQSkJIeElwWHBzVE9qTzlEd2Ja?=
 =?utf-8?B?WmM4bVZvT0VmdHo4OUwzMU5VcXFiNXczNnFnUFhiVzA2dmhmZ3NkV3d5KzlI?=
 =?utf-8?B?OFVsZUZVclZPVVVqSThvZy9uMk5xZ3hsRCt2aXdta3dnSE9leUh4RmdFc1d6?=
 =?utf-8?B?bE42eXVZdUtKYUZLaEZtdSs2dGRITmhEUzU2MjgycUUwa3BiOWNWcjFRWGZx?=
 =?utf-8?B?a1N5MytCQUVnZTdNbVNpMmd3UGJXNkFlV1ZRM2lRMzJndnJ6MmxObXAyTzJq?=
 =?utf-8?B?NUhNeDlHbWlubnNQWEwrdTlXaWkvZWxZUzNCaWhpY280TmsxT2FVajlKcWNw?=
 =?utf-8?B?WWhFZFBQVzhFd3IyREgrNkdKQW9ZeWVIcFVyOCtGaVo4YWpHYWZkTkFwaWJn?=
 =?utf-8?B?Lzh1cWJmQ0JVTWNNNWVWbnlQaVIrSHRJdTl1TXJJQ09qelFUNURvaERqSTRT?=
 =?utf-8?B?ei9aRGw2OGZiajM2NW4xNC9zck9iTnhXV1lZSXhSTXJvckFZaVBRc3pwOHdM?=
 =?utf-8?B?SzBuWnB6VXZlZER2TDM2RGJ2ZFREaDJPR1lBaFB2dGVhMUM3RjVyNkd5M3Fs?=
 =?utf-8?B?ZGxGd3BYdTV1bE9GVU8yc2ZURG9pYW1EMmNyOWlCQmxoWUxFVExvSmw3NjhM?=
 =?utf-8?B?NU92YUFLZWxUMzFtQVRIeDZReE9Hd3pOb0NLcFlSSXNqcWpLSGZOSnBlZnN4?=
 =?utf-8?B?QkNNU1h0Y1JocHVYTVpFc2h1OFIxdHRPTmlVZGNvZC9KaGlTbG13a2dNN1Br?=
 =?utf-8?B?cHIvT0JvUndqVUlJTmhXdmpmNHQvUG5tVUVHTDA3ZXVtaEF4dGd3TlQyU3Zp?=
 =?utf-8?B?TmN3eUtRdE1NNGJ4VGVLRnZKTCsxckkvU0JxTlpFejRSa290aTFjcFNYVE0r?=
 =?utf-8?B?RmxKZE95VXBGTnNjRlgrNmZiYUJ5Y29yZUVyT2pPZ1gxNXBKV1dLRWVyK3Bi?=
 =?utf-8?B?UVdaVGN4Qzl3V1JPNzFOZldRSlRta3VKQ2VtV2pTZmgrdm9JQXdTemN3dWVL?=
 =?utf-8?B?M3dsQ0x3NHV2TXFUSVZVVWJDTWtpWGtKYm1Tc2FKazJHbmpnMEFPN2RtY0FM?=
 =?utf-8?B?WHhBYmV4TkJNNitEaFgranE3U2NJOFpzaC9BWlh2SFg0aThxN2dVdXRQR3g1?=
 =?utf-8?Q?Byxj0dENAS5rH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RG1FNUpvY2N1Y3J2ak1ldDdOMFE0OG5uWnhiTHdjeHdkQTJVUCtybGEwK2pi?=
 =?utf-8?B?TnpxZktnZXRoMjZ5V2wrRzZrZlFPc3huYTEzS2xVRkNObmovSlhuOEhPTzVN?=
 =?utf-8?B?ZE5LQTU1MS85NXp6UDV1RmtodjlucE5HN0V5aEExMURGdVhONzBsdlV5NGV4?=
 =?utf-8?B?OFVhRzZuZDFwRTNUU3AwYkQrczVhZitHejJiL3JkUnN6WTVCVlVwOSs3eUly?=
 =?utf-8?B?a1dOR3RkR25IOThvUDlRVjhFbXIwbVlzbVNGRnRDanpDakg5eVI0cVlwWGli?=
 =?utf-8?B?bW9PVkR4Zm16QzR3dFg4cmRtbWIzRnFEV1V6VUNlaU5YMEg4d1V1NHFZTU9r?=
 =?utf-8?B?Qy9oNVQrd3hSdThaRnRTQ1g2Y0dHazU5dHZqb2NUV0hsMFRhVHFFb1VpUFFK?=
 =?utf-8?B?anpES0ZQSlBYTUZwVVpwcnV1ZWt4MGNuNTU0Z3l1NHN4WVBPVDhNZ2IvR0tU?=
 =?utf-8?B?VTdxVVZzUmpvNW5kYmVxbzVTQVhQNTlMbjZiYU5rNm0vR0NpMWpKcU1pb2RX?=
 =?utf-8?B?RmNLbm54cTB3d29waWliQkpqa2JtN3M3MkRNaEJFcjIyai9wUkQxTXZSelc1?=
 =?utf-8?B?NHNoQzJyY2NiMzVOaWdpei9vY0lHRHpqTElnWFI1TmNxeXVya0dOTFg3K3By?=
 =?utf-8?B?KytHWEpwbm5DUjZackl1Zi9URThuR05aNVpjaDd3c0pFN3lQQTlpQnJKeEdJ?=
 =?utf-8?B?K3FsaHJqMTVkbzlIRmJiMzFiVGI2QmdpQjliKzVieGlUY0xWUkwxVEc1ZjR5?=
 =?utf-8?B?anJkLzdRK2RRZU1GSGxjNGlBWFozV3BlNm1WQ21kaWV6ZXVKeDBpMnlCQkFi?=
 =?utf-8?B?WmhPMi9DRmE1eTUrZ1dlbW9KWDNqeGFqWjhqa3JmV29YSnV5MWFzbW9Rd2pm?=
 =?utf-8?B?T2hVTUUzL1AwbytwK2tnYjVYZTEvNnNGTHdTZUNka0R6Q0xOL2R1azhIKzVP?=
 =?utf-8?B?c2dTK203TWdMRE9RQjMrRkFaUnlmazg4MGc5cFlzbWdsWjdwZXB4VFhtZmQ1?=
 =?utf-8?B?eGpsT3ExV3ZtN2RoeGlrS3VheXVFdDNjUC9UTll3QmJMb0J0a3UyNWJONDB5?=
 =?utf-8?B?aFMwZzJhc2xSYVA5RkpnUld1bFFpUHNUZjFKT0lycnovZTFkaDhsRzZJUmV0?=
 =?utf-8?B?SDdJeEsvK3Q3eUVDaHVMaE9wcTBPL1ExNHdtZFRjL1A1QWdZbitiRGh1SlpP?=
 =?utf-8?B?bmlZZXZRQk9PSXFNcW9jSEZ6dTFMazZ0WGU0dk5xK0N0TFdZbFp6NmJXQitP?=
 =?utf-8?B?dnRiclJ0VUphSHN5WjRSaEJUSWpDa1pITGl4Yi94UkMvdFZUd2FHYW15Nlgx?=
 =?utf-8?B?RlE2b3hiNTFSbGpjZmEvdDJzam5UM2tLVGdnbVhoWDNnOWRuYi82RDVuOG9Z?=
 =?utf-8?B?VFNqUi9QYjAvNVhvbUtPaWRYT3gyb3poTDlBRHE5NENObExnelNWejNKcTlW?=
 =?utf-8?B?RzUyQnBVbkVvQmg0RlNhTGdoWWJheEU1bDFsRjVyVTYyZkVwTFV1S2VidFBL?=
 =?utf-8?B?VVVncC85TFdMSVlZT05CMzg5T2NmSDlDR1lYNzhlckNxWHRBcnNXbnpxM01T?=
 =?utf-8?B?NU11aGFzK1JlcHhJYUMxWUZ4cEpsTi92RjhFcWFyZkx1QjZOWUxjT2ZNVWdy?=
 =?utf-8?B?R21xUTYvV0w2RzlSNGhXVkRYK0FFUWVVRFRUbmRIYjI2ZWJUaDNST1RmZWhi?=
 =?utf-8?B?T0VNZHBYQlZrRGVpRmhKL0I0c1BtcDQyOXpYUG1lOTFndmEvbDl3Q3Roelo0?=
 =?utf-8?B?c2ZjREY4eTVSeXltTk1YMUhBdTRpTDM3OS9jMEwvbC9mQS90a2xsbzFtOURE?=
 =?utf-8?B?UGE5UWhUeUpmSDVrT0lRcVQwNkRacCs5VWl1eFpCTXZRckJRZk5ic2NJb05N?=
 =?utf-8?B?bk5iUkhuVHpiSEZ4cVdrallBZTdnUlJKZ3RoY3ZhbUVVU2FvRkN0aUR2UC9L?=
 =?utf-8?B?NDVySENhM1pGU1NyNHNKUVV3NzNONkVieC9kYmF4ZDBISHUrK1BGSFNZTWp1?=
 =?utf-8?B?VTZzUE5FRjB6bkV2d3llVUtHK3ZUblZycm1iVnQzaDNZUjJZRjZseUtWcUhv?=
 =?utf-8?B?UC9DSU9LTWJXbm11MjAxWlNmdlNmcWRQR2JhV2RxZXE3WDVDZVNWQUVkVUhC?=
 =?utf-8?Q?QXkaHs9mUWPl3rn+v371TwWzP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TFfL2oPYXbX9lFUthJQEKzGio5i+2UYhgAjgdclB0vkNBdpJ6CC2AadDRIawj+JhgkkgR6vnw74CXqNNyhJkeIkKB/RUtU185Lme1h75WX1Hq78LWHjGvEH738OUBJAtJJvafyi09zLEEBNlvJXlAeZbuJM6bS4V+quQX+4Bvg34ofI0fNAuEOVmirCcfLC4zhxdDpbCJCze79V3ixgZG270Z7Hors3laJ4uSLVgy+jmorrzk9w+nKBmvugmiEoGlkK3wuJywa+eJuWmIGvNAP2LuQJ4AZu1ML7xXPSzh7h8+OuTkXKtn3ZDUfqfFKcNep1HShntjrE7hWfRYmWzvTZXu/AGMALwr+1ncOd4zF59WRXSH7+3cPWvoaWFJdCkph90I5Dc4ZU0r41Cs9BWpHNvm+WWl+mbzd1IcRn/HqvkCEQIdrruuOP/aQm7u9H9zvk+w0jJzKy2wdxVf0Hl5trvwBev3Y1qrnwBV2i3XUqnwKqXzSNkgPL8Do0UR+UwiXb/GMqZACTgDC1bzTTYyBnM//QkoI55eWXQI+lLw3JXbGr7Z5M2DSx382A9vxlfg3CU3fuN5IIJy8hTrAA8PnLh+8ej2npgSvm+Y5WrHZA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c23ff66b-a8c9-4819-103f-08dd65908c8e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 20:16:06.6189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lz970mxFcJSxTDU2FsSfbDtIFp32AqmC3SHl1FGCsTYDpoUOHs3Ps6dCa8a4PwC9wTRwxQ+jT87Y4xv4uysuBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6271
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503170146
X-Proofpoint-ORIG-GUID: lNYwEWHZ_grfAOGB5BsJGB2eSyWV9By9
X-Proofpoint-GUID: lNYwEWHZ_grfAOGB5BsJGB2eSyWV9By9

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

I'll try to run tests tonight.

In what order will patches be applied?  I vote for these two ahead of 
the 8-patch perf series.

dt_prov_fbt.c needs updated copyright year

Would it be possible/practical in the commit message to mention kernel 
commits or version numbers perhaps?  Not a big deal, perhaps.

On 3/17/25 14:41, Kris Van Hees wrote:
> There are kernel versions that support the BPF_TRACE_FENTRY attach type
> at program load, but do not support opening the attachment point (a
> kernel symbol by BTF id) as a raw tracepoint.  The cause is that the
> support for fentry as a raw tracepoint was initially only implemented
> on x86_64.
>
> We now test both program load *and* opening the raw tracepoint to know
> if BPF_TRACE_FENTRY as attach type is supported.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_bpf.c      | 29 ++++++++++++++++++++++-------
>   libdtrace/dt_prov_fbt.c |  2 ++
>   2 files changed, 24 insertions(+), 7 deletions(-)
>
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index e50bb536..9ee32e8b 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -486,19 +486,34 @@ have_attach_type(enum bpf_prog_type ptype, enum bpf_attach_type atype,
>   				BPF_RETURN()
>   			};
>   	dtrace_difo_t	dp;
> -	int		fd;
> +	int		pfd, tfd = -1;
>   
>   	dp.dtdo_buf = insns;
>   	dp.dtdo_len = ARRAY_SIZE(insns);
>   
> -	fd = dt_bpf_prog_attach(ptype, atype, 0, btf_id, &dp, 0, NULL, 0);
> -	/* If the program loads, we can use the attach type. */
> -	if (fd > 0) {
> -		close(fd);
> -		return 1;
> -	}
> +	pfd = dt_bpf_prog_attach(ptype, atype, 0, btf_id, &dp, 0, NULL, 0);
> +	/* If the program load fails, we cannot iuse the attach type. */
> +	if (pfd < 0)
> +		goto fail;
>   
> +	/*
> +	 * If the program loads, we still need to verify that probe can be
> +	 * opened as a raw tracepoint.  Some kernels allow the program load
> +	 * but return -ENOTSUPP when you try to open the raw tracepoint.
> +	 */
> +	tfd = dt_bpf_raw_tracepoint_open(NULL, pfd);
> +	if (tfd < 0)
> +		goto fail;
> +
> +	close(tfd);
> +	close(pfd);
> +	return 1;
> +
> +fail:
>   	/* Failed -> attach type not available to us */
> +	if (pfd >= 0)
> +		close(pfd);
> +
>   	return 0;
>   }
>   
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index 1489275a..00f9174c 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -74,6 +74,8 @@ dt_provimpl_t			dt_rawfbt;
>   static int populate(dtrace_hdl_t *dtp)
>   {
>   	dt_fbt = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? dt_fbt_fprobe : dt_fbt_kprobe;
> +	dt_dprintf("fbt: Using %s implementation\n",
> +		   BPF_HAS(dtp, BPF_FEAT_FENTRY) ? "fentry/fexit" : "kprobe");
>   
>   	if (dt_provider_create(dtp, dt_fbt.name, &dt_fbt, &pattr,
>   			       NULL) == NULL ||
