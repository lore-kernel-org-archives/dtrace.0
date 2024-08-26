Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E2D193408
	for <dtrace@lists.linux.dev>; Mon, 26 Aug 2024 15:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724686957; cv=fail; b=dQ91P6jjemV/o+XG9SMy8YwtdG0e5uDXlgwfbBaFrdFUJOqJ362v6/l+3LKA6OuD6Y+HlL4/r8r0lryByjK1dl0OoJPUd/FPGKoJov84qnzOVe0Z3voZX46FmDMznyyCSI65etIt+YUZAyldm4/POKCHFsA9dwEtgsdlGrxTVe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724686957; c=relaxed/simple;
	bh=AnM5MSE4USRrD93paAakysOwjHKq9jXqeU8j1/PlD4A=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LnwQ+wiC/wciLf4xyvVRkUbLGNq7cfV3sRDlXsY8249HGcQC22MxTbP15fZFnaXwXwpvV8TOlFqT92XLbUDjClu3VAt5OuukOY3l7iEB4iRhJIA81FV2o78R/WKovuWB2mk6802KaCpYrw6VUIsUs8A12g46vle+KA53ve4BTLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ek3TZ2VO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v0avYU7I; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ek3TZ2VO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v0avYU7I"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47QEfUlW011046
	for <dtrace@lists.linux.dev>; Mon, 26 Aug 2024 15:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=YRZbXnk0FPQC9TbbO0IYDCW8TuTd3q3r2qiY+Q2SgzM=; b=
	ek3TZ2VO1vfqS+cte8Ac8DqcDSRaafCJBamrejWHXf7or7SVBxFAX53TPax7kLRh
	xXAHzHptiwFnFHgJK2zcXWOtl0ELIkpyukPSxajzj/SBlDoDYc//ViZQWswoAHgM
	gGzx9KjY6xtQ+Bi00ozhatZWLClFVX4g1WmwNNnFi54gYXqDSiR74mnV8KZCVxLf
	0RuOYPjGlb75m3x2OuxGqM+sj25HDZ/XgJBno/5X+BxlPWNvBMQl+6UGEYigu0FN
	loFVcQvjJFO4x4YJFI1qxU7x3NSRGg2pMuI6Z7qcwIXqZuIZvf+DoWYkaEz+aDrP
	xl3nztX8WhtHsh1qi3OgbQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4177n43emt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Aug 2024 15:42:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47QEdBg8020430
	for <dtrace@lists.linux.dev>; Mon, 26 Aug 2024 15:42:32 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 418j8kdsgk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Aug 2024 15:42:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OX32Rj5ICt0HUj85Haj1on6rzKYoc5Gy6SdhkSrrsVLfiX7a/2sasjxCKGcguRsaTQ+/ZoPfwHVDg1i2pWOtRKOHcP3+kaKYG0bmvpQZ96idGSpb+IkVQFZ/AoWUguPeo23y2RCK39+f7Nmm25QdL5v/MGQEFMx/KL5B+Xd1ucbcMDvNcEV2d2UFDdVno4E8nTC2tipUO+kAkfKawDYkP3r2QrIf+g/1AsaCDEiO3hPGFHl0aqEt8HDtiLdrn0hZOUAO/WRpLgR6lWjuV5/Hp2cbVyvihMyZvIshNYKKgtRKAf7gY4pK0H3zZrvG56ctXo3GdiR4eXCvxgpjHRzqqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRZbXnk0FPQC9TbbO0IYDCW8TuTd3q3r2qiY+Q2SgzM=;
 b=Wrtt/h2Cxv9MLxucem+RHgjRJa6l+GNgArLHLaBB6b+gisxZ9epma3zphNaZfQ+PiX5mN/heKRSSSYsKgEEubCwjlwFdhHp0Yi/55BY//NiPYT8WZNwCQhCst8r4IUVfss5rzuXl65ifYdCI+EuErqmR85PLnYeodlWuJ/DbnCgwKe52xe2TDeP62wm80nCJh/e8aODxsRuvPf59aGU4TYLl9J9dtz5JPYYZ6LvczpzH948rhqEhQtDYyHIohofi5s2bzUXu7/a5zLXlWEHM30jxJL0sxro8UHZyXJ1UJs9cBkW9vPnn4+OY02+rZcVQ05zLyhknLGH9x41Kci+RWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRZbXnk0FPQC9TbbO0IYDCW8TuTd3q3r2qiY+Q2SgzM=;
 b=v0avYU7I1C6/ROLkPBySCCTpUeBRrD0kvrym1daY+rW+uUuWdRc+ySJxN85E8j2KlH7GFEl4pIvYeXB4zbHhQxmXfYpF4oS6nW7KUZIswKFvsIWcoOBiKj1r0GJ6bLdy3Gh8/gz3vuPsgPM/g/8Q/2bNSzr2e8c+2mhMS9mJ0r4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6401.namprd10.prod.outlook.com (2603:10b6:510:1ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Mon, 26 Aug
 2024 15:42:28 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.012; Mon, 26 Aug 2024
 15:42:28 +0000
Message-ID: <9ddcccb0-6ab3-c1ec-5394-4793ac187273@oracle.com>
Date: Mon, 26 Aug 2024 11:42:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 31/38] Fix dt_pebs_init() call
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-12-eugene.loh@oracle.com> <ZsyRbgnYtFelMhM8@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZsyRbgnYtFelMhM8@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN8PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:408:ac::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6401:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a51365-1638-4fca-12ef-08dcc5e5b0c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHRBRXFXNU1zS1VCNG0yWndIb1R2K3V4RldJVlZVZ0NaK0hMaDdRcWx2ODIy?=
 =?utf-8?B?N2VsRHFzUFNlbnNwNERGT1pVb2YwbXlyaTBMNHJJdFYvZFhSaDZxcnJFU25M?=
 =?utf-8?B?SzFGaVluZkFaMFRTVEhUaXpJWitSM1h2cUtldGJFNkRrNEIyVW5GZlFyMUh0?=
 =?utf-8?B?aXNXUldXUXJTa3NzNGtUc1ZJUkM4QUpmN2g4NGIzWGROY0Vhdkd1NHlhVVBP?=
 =?utf-8?B?SmsrdFRWK0taOWZIc3NXcXhjVHJuZHhYQzJxa0xzOGtUUVhnUmh4aVMwYmtu?=
 =?utf-8?B?U0lnVW9KZ0g4dEFaMm85U3FZbU9VcDU5UWI4RlpIdm9pOVRmNEl5OFhOcWw3?=
 =?utf-8?B?RmFvQk9pQklvbXArWUtNVnhHNkE0bk5WVnc5K2hLSnZXY3gwQmErSHZ2QVdB?=
 =?utf-8?B?SHBVcWVSanJlWnBjVXY0MkZJS1dCYUc4UWlyb01hckFRTUtIWGJCUit5YlRH?=
 =?utf-8?B?ZFpQNXd3S1lRYTMwSXNUdzAweGUvQTNtSkhhMnFUTGZaTlFoNitWNG9KYm1v?=
 =?utf-8?B?TTdvUzc4T01UYnRXWHBkUWJYWkNLcElPaFZ0RXVCWVZhcGVQb1RlNU9UY2d6?=
 =?utf-8?B?TkxncS92QnRoRFRabEl1cEhIUXhzMHE5WVJ6bnpRVzIyZ0w3OFBkd0xSeTFl?=
 =?utf-8?B?TTJEY0xIYUxzUGNua2JnaWgzZVBwMTJIKzVzMk5DcWVsUEI4VHQydWEvMGoz?=
 =?utf-8?B?MUtVaVJaanNUOVhEZkQzN3dIWGh0eCtJZW9oREM2aDM1VzZPZnJDVFZLdWNT?=
 =?utf-8?B?SE5jSmMrNyt1eFd6aEtyWmJXZm1DbkxKNlIwbUF2blJUQmRBTmxZczBvZ0RH?=
 =?utf-8?B?SnJnQi9qN2Y3VWlJUTNuYmU0UHIyd1A3aXB4VzEyR0NLZnBWNFliUmpFNlJi?=
 =?utf-8?B?UTUrVGFuOWlNRTRCZW9FNVg3UlZEMlBIaEZ0dFhvZ0RIZzNCZVBOMDBUd2Ja?=
 =?utf-8?B?NmphdEMvdGFKWllUeXhwVTlKMHdiL1gwQUE2RlBQbDF3eW1oUkNQQXlJNStD?=
 =?utf-8?B?UXg4WmRvSDQxZFQ2SWx0b1lwWlZGYnVOZ2dwbXJjQldSd3Uxa3lWMklhQlM2?=
 =?utf-8?B?d1o4bWlneGl5cmNENG0wVmRoYnJvTW0zd01jc0hTdWh3TXU0M1dicDh1cHVQ?=
 =?utf-8?B?YXFBNWVpcVRkVU03elJlMlJmeE4vUmxWd29xNGp3aU1nN1AyUjBHMWdwVUwz?=
 =?utf-8?B?cDNPdFdOQzlOMllnTGRtdjN1NHFXcXkwYk1ybXlYRExQdmZZY1dZQkZUbDVy?=
 =?utf-8?B?VVFuQTlOTWpsZ1BjSW9vcGltdkt0KzJkQ0NmQlRLYW1mQ0F3K05jV1dCZ2kw?=
 =?utf-8?B?eEhtTlF0clFzVURiT1AyVEZ1TkN2TnZ4d3pYMGlZclZLTk1CdVVGbzVweDlh?=
 =?utf-8?B?eExVS2pEU1llUS9Ja0JsdEQ5eGFOb1BRREhuK3ZvS21yampQaE5QZXMwMmds?=
 =?utf-8?B?UkRVRXhKZTFxVTdHTDQzUmQwWDlndk1LcUU1RGJvdUc0MzhLUUdoSjBFcDI4?=
 =?utf-8?B?M3FOdldvditEVEFQMldYK0k4UTViTElOVnoxcHhXN3VjNTdiQjhDaC9BT0Jn?=
 =?utf-8?B?dU1yZlNYUGRpZmhvY08zUHV6WVRpWWpKQnB3NWFzYTNJaXRBUWs4OC9BQUZZ?=
 =?utf-8?B?OWlMRDJNK0kvVitJWStLcEFoKzVxekRmcnJzZVlxU28zcG9xYTNRTUtNTHBj?=
 =?utf-8?B?bHN0ZXhZZTZVZUI2S1BNUnpPVGY3ZTZRUVp6UVFCeXpIaHYycGxrNnB6R2s1?=
 =?utf-8?Q?zOqIIMhwWoNE7TrKJc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bklVWWVyLytSUVlXQTV0aHJ4OFF6TDg4TnhNQVc1ZkRiQkVDVEZzWTZpYjNl?=
 =?utf-8?B?YkpCUHBaUkJuL3lXZ1NYTGpJTFRuZDRoUkpneEoxdTFYWURpR1dkVFNSVUh4?=
 =?utf-8?B?VTlwRUQ0QXFuSkpzY2NqS28vaE1DYysrenJZbEVQQUFhRnBFMEpZSVMyL0Z4?=
 =?utf-8?B?dmtsVm4wS3QrMGhRb1pLb2JPdk04RVNvUDRlQnF3QjFmN2g5QTAyazB3ZG9W?=
 =?utf-8?B?YWpDYWhLVURjMXZ3cXhkR1dYeWppa3l4a0EwdTNCazZEMmhpOWpOOXYxajln?=
 =?utf-8?B?YjJSRDc5Z2tiT1ZPcTJITFRrd3h5ZmZHZVJtZnNiZHh2NVZmdElTY2x1RUVG?=
 =?utf-8?B?MW5uMDBLMjBuTVVDRnFONjdORjlCa25HU1hoNEJ6L3dCcHNnVlF3OExrS09V?=
 =?utf-8?B?NkNzaTF0WkJ5eGJVckxWOGRONm4xV0xxVjdZamgzNFc3V2ltcUlMZm9QV3VS?=
 =?utf-8?B?VStDcndxYWVIWXlxczBlMGUvVlRVZlJheTJSQjk5M3p4SDlwMCtpVlkxMlpM?=
 =?utf-8?B?NmhRUU5GVzMwRVI2VkVHSDlmZi9xaXFxSm1NUXBWQzVMcG9wbXVYV0RGeWJk?=
 =?utf-8?B?V1R5OTJoTWxDRGJ2bUZFZnZwSTdGeXcyUjRyRHl2cFFHZHdFUmpiRGUrV25J?=
 =?utf-8?B?VzFqS3Q4RFlUT0ZjTzJ5RHBiT3V1b2NFMUtOUEk0YVpUSmNtQ0ptYUp4OEZT?=
 =?utf-8?B?T1N2a0xoVGRRaFdoN1ZQTjRuanJONFdJVThhVGlpZUFkcUFBOHlSMy9XVGxB?=
 =?utf-8?B?WkNFM2hLNXFJelk2akdOZkxQaFFpOG5qM3NBa09yd0wrT2RYc1JhNWxUYlZh?=
 =?utf-8?B?RnZjaWZsRmxNVGJ0MHhCQnE0VW81eVVkYWZ3MHJRT1U2RnhDUEtLMk5uRUdq?=
 =?utf-8?B?VVJlVkptNXJSZDBQUXRxNkRDVEVrSTdLTUhPV0VMa2N4YlNsdE1QT2toTDh5?=
 =?utf-8?B?M1B3SzJ3ZlRpZHYxK2FFYWJQWHFvblhnczhUOXdWcjN4bDJnV1ZTemhMM3dP?=
 =?utf-8?B?UEpScVRlU1lneXJlRGNhdlpKczRONWJ1ZXhWbFdaRXN3UW1mNGZLV1VScXRV?=
 =?utf-8?B?SUNkcXBWU25OMVdLazBIS1paZDdRMmFJMy9LQ0xBc0dzZGRrQzNGWmhQKzMy?=
 =?utf-8?B?OXlKaHAvbGFVTGh2dzhxNnJxOTVGRUFhRC9vVThmNmtvd0I1WmluYXMwYWJ1?=
 =?utf-8?B?M1ZXNEpab2lnK3gxWU5GMmx4RjdWYTFtbnllZzl3YlNPeFNLTENseDFOMHJu?=
 =?utf-8?B?QmhtOEg2TjVTUTlleCtJekNrSVluWkV0c3J2M2MySHlFalloZUc3QnB6S2dY?=
 =?utf-8?B?ZXdHMVpwRDNHbElBaTJJTnJlbUc1UDBTd0hZNElJb093bWxaak9ackJJbE1n?=
 =?utf-8?B?UDhXdFVPUXVsdVVFZDlML1RVYW1Qek9PMFBtRWdpeS9kWER1cnoyaGI1Q2Zi?=
 =?utf-8?B?OFRCb0lCMjUzZ1RaUmJtTWlmZUhhcnhPYVNYR3RUa0lMT2p4cm52SlRyT3ZX?=
 =?utf-8?B?Q2poSUhVQU1wa3ZyRmdmMVB5c2kxV3p0dUlXdVBBSE1Bd0Fxd2QvVnhyaTBX?=
 =?utf-8?B?aGtiTXJESnFaSmRrY3MxWnh2U2U2b0kxRXZGUEljNzJjTlBLQ0xEVlYwRTI5?=
 =?utf-8?B?Z0JxeFNiQmZlNzhrWkNuc0srRjRjbVZUMUFKN1kzZDl5T3JBeDdqSlFNM1JJ?=
 =?utf-8?B?V2kzcGJZZ240QVdPUFVxaWk2UDJPdThyVmsyR0lvU2l2V0ovKzNIMlZ0WVFE?=
 =?utf-8?B?R1lIMGhYT3F6ZVh4Uk9SdHZpSXNPakU2RlBrQ0pZcXFmUGIySS82V2FtNFJ4?=
 =?utf-8?B?Y0NFZThYZjVtR2Rqb0FrUXhQNXVFV3ZjWGZvbVV6WVdKU1AvenRaeDNZZGJl?=
 =?utf-8?B?Y3RUaXR1cmdoaGh5L096ZHB1N2dNbVBxKzhqT1hTNUFVbDVJMjRWbDA5OVdr?=
 =?utf-8?B?VWhMOEpRbjViV1A5a2NzTkpVSlM5UHI5aTI1V3ZCeXg4a3huUmF5eWNPSzhU?=
 =?utf-8?B?RTljVWo0Y0RFRURCN2hZWVpWNHFkWFFrMHNSYk11Zkd2SjJCb2hGbFNha0tn?=
 =?utf-8?B?K0ZYanFzSlBlbjZjaERqcWo3SGZPdlJwdkVpWGtvT1BCUjU1ZDBaVklmemg2?=
 =?utf-8?Q?hGH7/2XaAtrTxCwjv0ozy322P?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8J6ncsO3pLbfP98WPoqq69TV7Pz+8VoG4INaZ9p7qtYawStOzVzXh/0WLbuSHRnBhH4D9PxztHB4NsoIPdEk6pG33hWaUiK+1H71wpWSY2DCRsAODSctDlsUAIWA7ikenv2gmKEBRcmqoDGVIrTWpKVFm+jGVZD4L+fO6QWxaJaCShkRxkJDjzFsh1MoFkyAmcjeDg/7HRSsLE5A77x/DNaOhXbw6YXU6TSXeNZv9qC1Gp0RmXRIrXyaRCtaMlLDbq0zcJj16hAtPQ2G3oIvN805ahmLMXXBoSgvJMnBzzFgYqR1grrFzrpSyxHHWTyxmhQ6tc64cnl0JbHNuHgWyRt1XZX0FoFTcgeMJpVcl3dexAYlPWBpNd0WAzTwMEXhsQC0CxM/8igkk4slY1O3boym2hjxsXggh00olPq77j1+uLeG0LlZkWflhPaourNi/pMXmp8+7+F4b2SMmqoulgl4xh8lvQCvRgP+1O89W083RWQb/pz1dnIbNkCaE5strPoygLhgp1FsE0bwhqKyXSvkyuqDrklrPZQ5d6muvwHa8GCNXS/9AaHj8RJhSnkOcbQECyGlp0RKRXhjIggKBTfTg7UxxM9ykDZ4tsMdh+Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a51365-1638-4fca-12ef-08dcc5e5b0c2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 15:42:28.4662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5WBdc90UDbicOu/6Aak4C08kYTaGhwngw8biyZUqznMfgCPkwnTiBSpoN98WNGRViyqtFJU2x1zHbd9+4g9Ymw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6401
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_12,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408260120
X-Proofpoint-GUID: zsEyP07i5U0fouxrpkEbKNiWwSH13tbU
X-Proofpoint-ORIG-GUID: zsEyP07i5U0fouxrpkEbKNiWwSH13tbU

On 8/26/24 10:30, Kris Van Hees wrote:

> This patch goes against the intent of the code, as far as I can see.  The
> point of performing the size check prior to increasing the buffer size was
> to enforce the limit on the size that was explicit set by the user.  Then,
> if that size was sufficient, then DTrace is at liberty to increase that
> size to a whole multiple of the page size.
>
> But if I were to insist that a buffer can only be 24 bytes, and 24 bytes are
> not enough to store a single trace record, DTrace should report an error
> rather than increasing my bufsize setting on its own.


The point is that DTrace *does* increase my bufsize setting on its own.  
Why should DTrace complain about my setting when it's going to ignore my 
setting anyhow?  What value does the pre-existing behavior offer to 
DTrace users?  Are you saying that DTrace should not resize?  That it 
should honor the user's bufsize?  No more resizing (to page size or 
whatever it wants)?

> On Thu, Jun 27, 2024 at 01:38:57AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> The function had a few issues, mainly with its comments,
>> ranging from typos to incorrect descriptions of behavior.
>>
>> The function has only one caller.  The enforcement of a
>> size minimum was problematic in a number of respects:
>> - it was missing 4 bytes
>> - it was enforcing the minimum before the size was
>>      increased by the caller
>> - it was checking dt_pebs_init()==-1,
>>      missing errors with other negative return values
>>
>> So change the function to accept a minimum and change its
>> return values.
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libdtrace/dt_peb.c                          | 27 ++++++++++-----------
>>   libdtrace/dt_peb.h                          |  2 +-
>>   libdtrace/dt_work.c                         | 15 +++++++-----
>>   test/unittest/options/err.b-too-low.d       | 22 +++++++++--------
>>   test/unittest/options/err.bufsize-too-low.d | 22 +++++++++--------
>>   test/unittest/options/tst.b.d               | 22 +++++++++--------
>>   test/unittest/options/tst.bufsize.d         | 22 +++++++++--------
>>   7 files changed, 71 insertions(+), 61 deletions(-)
>>
>> diff --git a/libdtrace/dt_peb.c b/libdtrace/dt_peb.c
>> index 5268f089..4983ba91 100644
>> --- a/libdtrace/dt_peb.c
>> +++ b/libdtrace/dt_peb.c
>> @@ -136,18 +136,14 @@ dt_pebs_exit(dtrace_hdl_t *dtp)
>>   }
>>   
>>   /*
>> - * Initialize the perf event buffers (one per online CPU).  Each buffer will
>> - * the given number of pages (i.e. the total size of each buffer will be
>> - * num_pages * getpagesize()).  The  allocated memory for each buffer is mmap'd
>> - * so the kernel can write to it, and its representative file descriptor is
>> - * recorded in the 'buffers' BPF map so that BPF code knows where to write
>> - * trace data for a specific CPU.
>> + * Initialize the perf event buffers, one per online CPU.  Each buffer will
>> + * have num_pages * getpagesize()).  The dt_peb_open() call mmaps the allocated
>> + * memory so the kernel can write to it.  The file descriptor is recorded in
>> + * the 'buffers' BPF map and added to the event polling file descriptor.
>>    *
>> - * An event polling file descriptor is created as well, and it is configured to
>> - * monitor all perf event buffers at once.  This file descriptor is returned
>> - * upon success..  Failure is indicated with a -1 return value.
>> + * The return value indicates success (0) or failure (-1).
>>    */
>> -int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
>> +int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize, size_t bufsizemin)
>>   {
>>   	int		i;
>>   	int		mapfd;
>> @@ -166,12 +162,15 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
>>   		fprintf(stderr, "bufsize increased to %lu\n",
>>   			num_pages * getpagesize());
>>   
>> +	if (num_pages * getpagesize() < bufsizemin)
>> +		return dt_set_errno(dtp, EDT_BUFTOOSMALL);
>> +
>>   	/*
>>   	 * Determine the fd for the 'buffers' BPF map.
>>   	 */
>>   	idp = dt_dlib_get_map(dtp, "buffers");
>>   	if (idp == NULL || idp->di_id == DT_IDENT_UNDEF)
>> -		return -ENOENT;
>> +		return dt_set_errno(dtp, EDT_NOMEM);    // FIXME we used to do something more akin to ENOENT
>>   
>>   	mapfd = idp->di_id;
>>   
>> @@ -180,7 +179,7 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
>>   	 */
>>   	dtp->dt_pebset = dt_zalloc(dtp, sizeof(dt_pebset_t));
>>   	if (dtp->dt_pebset == NULL)
>> -		return -ENOMEM;
>> +		return dt_set_errno(dtp, EDT_NOMEM);
>>   
>>   	/*
>>   	 * Allocate the per-CPU perf event buffers.
>> @@ -189,7 +188,7 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
>>   			 sizeof(struct dt_peb));
>>   	if (pebs == NULL) {
>>   		dt_free(dtp, dtp->dt_pebset);
>> -		return -ENOMEM;
>> +		return dt_set_errno(dtp, EDT_NOMEM);
>>   	}
>>   
>>   	dtp->dt_pebset->pebs = pebs;
>> @@ -241,5 +240,5 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
>>   fail:
>>   	dt_pebs_exit(dtp);
>>   
>> -	return -1;
>> +	return dt_set_errno(dtp, EDT_NOMEM);  // FIXME need something better
>>   }
>> diff --git a/libdtrace/dt_peb.h b/libdtrace/dt_peb.h
>> index e0f408f2..9ad23252 100644
>> --- a/libdtrace/dt_peb.h
>> +++ b/libdtrace/dt_peb.h
>> @@ -43,7 +43,7 @@ typedef struct dt_pebset {
>>   } dt_pebset_t;
>>   
>>   extern void dt_pebs_exit(dtrace_hdl_t *);
>> -extern int dt_pebs_init(dtrace_hdl_t *, size_t);
>> +extern int dt_pebs_init(dtrace_hdl_t *, size_t, size_t);
>>   
>>   #ifdef	__cplusplus
>>   }
>> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
>> index 69a86358..7a0eb1da 100644
>> --- a/libdtrace/dt_work.c
>> +++ b/libdtrace/dt_work.c
>> @@ -267,18 +267,21 @@ dtrace_go(dtrace_hdl_t *dtp, uint_t cflags)
>>   		return dt_set_errno(dtp, errno);
>>   
>>   	/*
>> -	 * We need enough space for the pref_event_header, a 32-bit size, a
>> +	 * We need enough space for the perf_event_header, a 32-bit size, a
>>   	 * 4-byte gap, and the largest trace data record we may be writing to
>>   	 * the buffer.  In other words, the buffer needs to be large enough to
>>   	 * hold at least one perf-encapsulated trace data record.
>> +	 *
>> +	 * While dt_pebs_init() rounds the requested size up, size==0 is a
>> +	 * special case.
>>   	 */
>>   	dtrace_getopt(dtp, "bufsize", &size);
>> -	if (size == 0 ||
>> -	    size < sizeof(struct perf_event_header) + sizeof(uint32_t) +
>> -		   dtp->dt_maxreclen)
>> +	if (size == 0)
>>   		return dt_set_errno(dtp, EDT_BUFTOOSMALL);
>> -	if (dt_pebs_init(dtp, size) == -1)
>> -		return dt_set_errno(dtp, EDT_NOMEM);
>> +	if (dt_pebs_init(dtp, size,
>> +			 sizeof(struct perf_event_header) + sizeof(uint32_t)
>> +			 + 4 + dtp->dt_maxreclen) == -1)
>> +		return -1;
>>   
>>   	/*
>>   	 * We must initialize the aggregation consumer handling before we
>> diff --git a/test/unittest/options/err.b-too-low.d b/test/unittest/options/err.b-too-low.d
>> index bb77e37c..f62155dd 100644
>> --- a/test/unittest/options/err.b-too-low.d
>> +++ b/test/unittest/options/err.b-too-low.d
>> @@ -1,6 +1,6 @@
>>   /*
>>    * Oracle Linux DTrace.
>> - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
>> + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
>>    * Licensed under the Universal Permissive License v 1.0 as shown at
>>    * http://oss.oracle.com/licenses/upl.
>>    */
>> @@ -12,19 +12,21 @@
>>    */
>>   
>>   /*
>> - * We use a buffer size of 59 because that should be just too small to hold the
>> - * trace records generated in this script:
>> - *	- perf_event_header (40 bytes)
>> - *	- size (4 bytes)
>> - *	- gap (4 bytes)
>> - *	- EPID (4 bytes)
>> - *	- tag (4 bytes)
>> - *	- exit value (4 bytes)
>> + * We need over 4k bytes for the 4 string trace records generated in this script
>> + * plus some meta data.
>> + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
>> + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
>>    */
>> -/* @@runtest-opts: -b59 */
>> +/* @@runtest-opts: -b4096 */
>> +
>> +#pragma D option strsize=1024
>>   
>>   BEGIN
>>   {
>> +	trace("abc");
>> +	trace("def");
>> +	trace("ghi");
>> +	trace("jkl");
>>   	exit(0);
>>   }
>>   
>> diff --git a/test/unittest/options/err.bufsize-too-low.d b/test/unittest/options/err.bufsize-too-low.d
>> index bbbdb5c5..25efdf72 100644
>> --- a/test/unittest/options/err.bufsize-too-low.d
>> +++ b/test/unittest/options/err.bufsize-too-low.d
>> @@ -1,6 +1,6 @@
>>   /*
>>    * Oracle Linux DTrace.
>> - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
>> + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
>>    * Licensed under the Universal Permissive License v 1.0 as shown at
>>    * http://oss.oracle.com/licenses/upl.
>>    */
>> @@ -12,19 +12,21 @@
>>    */
>>   
>>   /*
>> - * We use a buffer size of 59 because that should be just too small to hold the
>> - * trace records generated in this script:
>> - *	- perf_event_header (40 bytes)
>> - *	- size (4 bytes)
>> - *	- gap (4 bytes)
>> - *	- EPID (4 bytes)
>> - *	- tag (4 bytes)
>> - *	- exit value (4 bytes)
>> + * We need over 4k bytes for the 4 string trace records generated in this script
>> + * plus some meta data.
>> + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
>> + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
>>    */
>> -/* @@runtest-opts: -xbufsize=59 */
>> +/* @@runtest-opts: -xbufsize=4096 */
>> +
>> +#pragma D option strsize=1024
>>   
>>   BEGIN
>>   {
>> +	trace("abc");
>> +	trace("def");
>> +	trace("ghi");
>> +	trace("jkl");
>>   	exit(0);
>>   }
>>   
>> diff --git a/test/unittest/options/tst.b.d b/test/unittest/options/tst.b.d
>> index 57fa030d..3bf08edc 100644
>> --- a/test/unittest/options/tst.b.d
>> +++ b/test/unittest/options/tst.b.d
>> @@ -1,6 +1,6 @@
>>   /*
>>    * Oracle Linux DTrace.
>> - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
>> + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
>>    * Licensed under the Universal Permissive License v 1.0 as shown at
>>    * http://oss.oracle.com/licenses/upl.
>>    */
>> @@ -12,19 +12,21 @@
>>    */
>>   
>>   /*
>> - * We use a buffer size of 60 because that should be the exact size necessary
>> - * to hold the trace records generated in this script:
>> - *	- perf_event_header (40 bytes)
>> - *	- size (4 bytes)
>> - *	- gap (4 bytes)
>> - *	- EPID (4 bytes)
>> - *	- tag (4 bytes)
>> - *	- exit value (4 bytes)
>> + * We need over 4k bytes for the 4 string trace records generated in this script
>> + * plus some meta data.
>> + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
>> + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
>>    */
>> -/* @@runtest-opts: -b60 */
>> +/* @@runtest-opts: -b4097 */
>> +
>> +#pragma D option strsize=1024
>>   
>>   BEGIN
>>   {
>> +	trace("abc");
>> +	trace("def");
>> +	trace("ghi");
>> +	trace("jkl");
>>   	exit(0);
>>   }
>>   
>> diff --git a/test/unittest/options/tst.bufsize.d b/test/unittest/options/tst.bufsize.d
>> index 96b0f1b8..23af81aa 100644
>> --- a/test/unittest/options/tst.bufsize.d
>> +++ b/test/unittest/options/tst.bufsize.d
>> @@ -1,6 +1,6 @@
>>   /*
>>    * Oracle Linux DTrace.
>> - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
>> + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
>>    * Licensed under the Universal Permissive License v 1.0 as shown at
>>    * http://oss.oracle.com/licenses/upl.
>>    */
>> @@ -12,19 +12,21 @@
>>    */
>>   
>>   /*
>> - * We use a buffer size of 60 because that should be the exact size necessary
>> - * to hold the trace records generated in this script:
>> - *	- perf_event_header (40 bytes)
>> - *	- size (4 bytes)
>> - *	- gap (4 bytes)
>> - *	- EPID (4 bytes)
>> - *	- tag (4 bytes)
>> - *	- exit value (4 bytes)
>> + * We need over 4k bytes for the 4 string trace records generated in this script
>> + * plus some meta data.
>> + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
>> + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
>>    */
>> -/* @@runtest-opts: -xbufsize=60 */
>> +/* @@runtest-opts: -xbufsize=4097 */
>> +
>> +#pragma D option strsize=1024
>>   
>>   BEGIN
>>   {
>> +	trace("abc");
>> +	trace("def");
>> +	trace("ghi");
>> +	trace("jkl");
>>   	exit(0);
>>   }
>>   
>> -- 
>> 2.18.4
>>
