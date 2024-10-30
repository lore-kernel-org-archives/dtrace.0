Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4441D0B98
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 20:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730319306; cv=fail; b=GA4wJk2LWe7E2mVSDxnMbPrtD6LvIRQfXZa7v0+VlTth0hBk+521AGeQhmylcodUuKMEUa8GQH84EaW/Nvr232eK55ckeoXtKXdMQAWLaioMOnW+t8/ni2/pOf5rpNqSLWWfHnf3Te+kCNfTuHT+3ZZ2NJZRTYJLOmmudC0QAeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730319306; c=relaxed/simple;
	bh=F8jwCJ2MPhyUS3vWKzFC6Juhmq33gLdqwTUT54MbjOU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qMNxCcw/s2TdMCwusxL+U8fxQij1g6qGVSFs5KMCINLDcyy9/oBtaylehvtDjjvsEEDTuY7Mqo8MiNzb4jqk+au72haTVIogZ9y/e9AeduGkZHdNasriBJzVKYLL8aENS/fes6P0DwlNXJJ8bMVxP9klkFqzbWK1ZJUxhheznII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=h8ZBOCkI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rSN/Dj9n; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="h8ZBOCkI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rSN/Dj9n"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UJBaHw013007
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 20:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Tl34u6j3fMezI4bwTxnhMap/czTZuw5O5OYTT442OxE=; b=
	h8ZBOCkIYkw7EHvwEVWjHWMsDopke4Hnp+bix6yQCs27VN1PngJvFCGd7YvL5aLq
	a12uuDo01SzLOCBkoISjKEK6qj/wpCd8wZyH2Hzw6ASw1eYbfeNtyBrr2kRUC+9a
	cWBRb2ijRKTUNCDtDxCjQ8K/o67dg+u09kjUtRpEVSXnvJRsaiMj4Umk6sJkjDQn
	1/hQhCWTo0K45/u4/bKVhKWjLUs7pglE48QcN8ZKI4Zojh5yf5EEyMHhkVju8eaN
	V3yv3AsO9A90G6cuRAkgBqR6Nlioj3+zjC0cfLHK4CSwCmKS97h4aDRz9Erl/SWP
	+ABrYqCNJn1vWiSUX+w9FA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp8xkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 20:15:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UK4EG7034894
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 20:15:01 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnd9mcb2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 20:15:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcGYSzOCuzpcmLjh6T/Aw+3TDsWtTao1DEjC4vMYq6+C41RwoT1z/Xn4gMDJHWnfd5IJ76JspzSYP0KdBRqPQ638EuVfv2A2cqHDp5Wi/TZlOSLDPM2MiLCgwRSb0WDGYsvWkbO/gvZGRKpO+obnTDusLeZNPSm0JJpC0+vJOm39PZ9wZ4R2dIaL3Id/UOAtRi4F+PXNFBxDlcHCzBDotoJXZ0nZH8qx77R8isX0Q9M+LaNhbGQPGbuuP8nZg9Pl20GYOm3Jf4Pzq+9wqCoMAIFdhBXokE2AWaN06ExHoRI3Qdq5efUyF3utE/N63xLvKUf+4ET5kER6ohaQAGDYWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tl34u6j3fMezI4bwTxnhMap/czTZuw5O5OYTT442OxE=;
 b=TIGGpeawuXeauxPHYRy0o2MRbWDnErbE6iSIMP3JgGokF0sANMmQp4G6ardsEwW1eeZwxlT0jpZPZ7sfT5SqlBdxfKbYeRHd8SSfC1E0JCo/enVkQxhmCkuSK6hVs6/4jvzG3i67YZ82GHUrp3RecsRRbentngrLpzY7j5/mBg0q65jsklaNUoqIW/DJP63SkvzNYaq44Hhxa7DsHzlCiIBG0bC6LNL5xmx/KZuE3Ti73tbIHlWUcmAxnhq3bCxVnFRBeAZghZ/ht11wspVtATV4hJN9xFLoZTU8GZaiKgPBsk19aIEmKITro+snsTHZBVHy21yVdLZ5jijA+H3tOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl34u6j3fMezI4bwTxnhMap/czTZuw5O5OYTT442OxE=;
 b=rSN/Dj9nLeRR6GZF3V2QbslrG9obEV8SQfTi+nNzYAfh5Od+cyBjeyv+HIbCdsgmjsDNgkYy9wfUBO0QkmuE34ioWnpISt4d5dKmsWWiH1sEbBBTtox0g2qMPEc2mdwhniAQiBUmC4PjQ3gVwGqSq8VrONT+zKuKSMHs8Dy4MLk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BN0PR10MB4949.namprd10.prod.outlook.com (2603:10b6:408:12b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Wed, 30 Oct
 2024 20:14:57 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 20:14:57 +0000
Message-ID: <9c8bfb58-6d34-07d8-243b-691fc62df38f@oracle.com>
Date: Wed, 30 Oct 2024 16:14:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/4] test: Do not depend on ext4
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241004044355.25870-1-eugene.loh@oracle.com>
 <20241004044355.25870-4-eugene.loh@oracle.com>
 <ZxwKuCIs1atplKFL@kvh-deb-bpf.us.oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZxwKuCIs1atplKFL@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0089.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BN0PR10MB4949:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd229fd-5beb-4d43-a226-08dcf91f8662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHpid2VBUTJGRnJCVG5MVncwRWpWNmxhYS9icFk5UlZzVFV3aXJld0hLcklN?=
 =?utf-8?B?V0NKdncyUnl4WGd0MHJOUHB4SEFUMTBrRWxQYWx3TXhZTG9sK0hpYmEwS2xP?=
 =?utf-8?B?WldHemhzZldFR3FWbjcrSU1mNzFJeVJIL1o5WWl4Tm5ITTRzWC9BQjg3ZzIr?=
 =?utf-8?B?bVpJRmZmSzcyalE3NnZSZXBHbUdDaWMyZGpEcWNqTzBlMk52QnkyY1pFTWxl?=
 =?utf-8?B?Ykw4Y1hVb1VrQTlQSjQwbWhUaGttbEJveU0wT0ErSFhpQW0ycDgwd3lFUXFw?=
 =?utf-8?B?bndMT0trSmZZNU1CSXIvSHFVamZxSkw4bkNFdE5wbGpncUE4TWVBV0s1TzRi?=
 =?utf-8?B?bEJwaTNPV1E0UlA5MkNnNWpnL0FncTBzU1lUVERmWjdFMzhKcjdia05MVTF2?=
 =?utf-8?B?TzdBYXUvbVFkdytyL3JicWREbEdCbi8vanhjQ2l0VmFuWjRka1FLVDNUM3A4?=
 =?utf-8?B?SGF6d0l2cTl2Ym5CT05SM3ZDUXRpRzJld0Zna3lJNUk2d3ZlaEhlaDZ2bnlB?=
 =?utf-8?B?blI4ZExKMnU2YlFDKzVhL1JzUENYb2hlQlc0WU4zbVNMbGEvMnEwMlg1ZG5Y?=
 =?utf-8?B?T05ZaWZPaXdwK0NLcDhkQ2FyZFo5Y24vdi9lMU5aZldxY3RsR241ZUl2YzFC?=
 =?utf-8?B?TU9JT0pPcllnY2VJTnlkOC9Fd0pQbjBGUitNelNPNDBUSUFmZ3ozQXhiSGpq?=
 =?utf-8?B?YVBlM0NwWkp0ZnBOV3FwdC8zSzdsT2lzNUNBRUVVN01jQUw2R25lNXJKS1VY?=
 =?utf-8?B?WlFEU3RxY0JGcUdSbDNwVy82aVFCdGRKODM0K3RhdnZGYXdnTHYxVUxoNzFH?=
 =?utf-8?B?OHM5MWxSOGZ0YlNIdTU4eGlRYlVhVktxU01WejJkZmVUMFVlaU5hYlZ6RjFY?=
 =?utf-8?B?S0M4SGF4ZjdMMGQrYTdNSXYrKy8xbkxSOUZUU01tTjg3RGYrcGpBZVhIM0wy?=
 =?utf-8?B?N2ZLVFlIZ0dCWi9xbWd6QnZUOGxocUhCSE9odHROQmZYSytrSG1nSUE5MGlN?=
 =?utf-8?B?TkFvQktvOTYxN2MxNG1yYUpqbjI2Q1JiN3l4YUZGSHd3WDFEUFl4azVoMllR?=
 =?utf-8?B?QTBQWkFITkVBellTS3c3NjNxK2hIWEp5N2hRY3dOMS9hOFZwT25BNGxkOEl6?=
 =?utf-8?B?MzZtR1BzL1dtbWdTMHI3WHVDZGhuNXFQNFhiTHI1d0ZuSWVYTCt3aUZ3L3h3?=
 =?utf-8?B?dFNpSUh1aVhTYzVibU8xeWtTOGlyeEc0ckthdUFjMW5qbkl3RFJIS2FqWHJP?=
 =?utf-8?B?cHpXY254ak9XRXVLdklGRThQaHlTakU2bW1SaUl3MDBZVXhlNVlSZFN1V0dB?=
 =?utf-8?B?dkdsT2c1cGk3NVNObXd5YUNicUVWbGJHUkdBVTZMbEdqbXp4OVJEYUExOVl0?=
 =?utf-8?B?dXdkOUpkWkRiRHJnMGNHeEZISDhhZlJWbzFsVVM0YXR6OWxCZW9QaUx6SFkx?=
 =?utf-8?B?akpTWTVORDZudTlWZ3hCTjVsOXIyN3J1MUVZUE9yYXR4V0JiWW56azlSRXV0?=
 =?utf-8?B?dEZkTkp6N0R1MUpNU0ExcTlLVzA4ODZTbXg1Z1J3ZjV2cGdDSTQ0dGNUaGU1?=
 =?utf-8?B?R1Z0ZzRyMXhBRk90ZkRFbEFEZTJucHNKcDlCbHpxMDBXL29DSFdqRUtPOVNv?=
 =?utf-8?B?cVQ2Si9ESVA0RXU2RldZbDdVeTdzL2x6ZWJiZ3hZd1IrbTAxd2Q1emZoUVdS?=
 =?utf-8?B?czY3Y2tUakZ3T2wySHVHZGpSS3hERSs4emZKbmxDUUVJU2JmSWVhdXRVNEtz?=
 =?utf-8?Q?vZuLV4RgH4gdaNgvzq5YZv2SokWeujNa35BnJcb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk01RmN4VUt4aW1HRHY3M2tUbjN3WjNoVEo5VVRtcm0rSlVOVlNQZTNjRFJs?=
 =?utf-8?B?ZzhNQzB0emU4c0I3bk5BRFc4RzhuQjNQWXdSeWZJSkhSL0dnYndRRXpZM1g1?=
 =?utf-8?B?KzI1dWVSWHZ6V21iOThqSndrVEFGaUNzeldqZTYvOFkzamtmNE9BcWxEQWZL?=
 =?utf-8?B?bFhpOGJJalkyQVc3SWkvZVBrVUZyODFsb0VhSWhnR05xMGVuSXhjV29uQzdy?=
 =?utf-8?B?T1E3eGF2MFV6cmdQSmtSZVg5eXdFdUFTRmVzb09iLzUzR1lOQVRLZlFjT2pX?=
 =?utf-8?B?WlJtcmg4NGlJMmtxbUhHK3FYM1JnU0JPdytYVmJyZUgxU21xSGxzM1IyWlRD?=
 =?utf-8?B?b2I1VEVabFEzS0oySnk0L1NHSHNBRTg1cDRaRTlvZTVXUDVqY0xuVEw5Wlgz?=
 =?utf-8?B?RDFNUVJxeHNzeDc0T1dYTVdZZHhjY1hmUHF3K0N3N0RHSDR2ZC9DVURFSHAw?=
 =?utf-8?B?OVdBSFhBV3FkYlphVXlkSmxlUlRzVFpoRjJtQnBUZ0JxNElOd2RaalIzUHRp?=
 =?utf-8?B?MXNncDVveW1qQjhVWC9IcG5oN0lLb0p4OXNNbzZTM2orelRQRG1HNktCMzdL?=
 =?utf-8?B?b2k5NGphR2M3Wk1seDJHOEZSUzM5eURaSmNUblNxUmNFUGhtUy96ZlJ4Tk5l?=
 =?utf-8?B?VWdiajJIcE5BK2Z2ZVRXd0VqcTl0Mzh6VHhsZWs4UkZYQ2JuRmpseWJBL0Vt?=
 =?utf-8?B?VHJsdHczNDlRUGNjQktodkp6a2EwcWlnZzVVcjJtS0R1SWVVVkpVQ1o2MENR?=
 =?utf-8?B?Vk1FbkJNc0JMWDg5enRtRUM3cFBiUGxVVXlGTDQyTHQxOFNaWUJWK0xUaHBL?=
 =?utf-8?B?Zy9KZjl4TWJBWnY3QmUrZml2YjFWSHlHZUhkWnFVWjQ3WDhZUTNLaDR1b2ZO?=
 =?utf-8?B?OFAwaUtzZ2pWU1JrZGFKWjdYa3FIdVhEZS9VUkFUZnVxQjUzK20rbGNqR0M5?=
 =?utf-8?B?Rk9IYkVxY3BYMk1aNHF1Zm9ZYjJSOVFCUTduRS9ud2VRUy9qcEhMTUR5UE95?=
 =?utf-8?B?ZkZWR2cyZFk4OEFiNGlQc3UxYS9MVjBwV0VheFF2YXkrZmZDTGtJS0hCdDMy?=
 =?utf-8?B?SHJOQnBXLzh3YkREMGE4MUl1RG9YU1pvUFpacnk1WmRVZlNQeTRNLzllaGFv?=
 =?utf-8?B?MVV1MGhsUHpDVURWUCtNTi8vN1loQXVqZVNSbFdSdmtKRWdXZllrYnVKL0Nv?=
 =?utf-8?B?SE16MWp4UkwxYWpic2o0elg1Tlc2U3g0NGNwSXliRWNnRVVXUklKcEZ1azRu?=
 =?utf-8?B?V1MyR1lBNVpiS1lVY2xlMEE2cXZMMGNhS2NHWSs1aGF6c014akhuRkgvVEFk?=
 =?utf-8?B?U0pielZ5Y2NJcnpDOTdreHZlU3VrejF3dXdnRC9pVG00QllSTVNjTGtIWjJq?=
 =?utf-8?B?eEFDMmlTNCtJU2xWbUZLelRJTjREV1kvTUdWVlpPWEdQbmk5eC9CS3NqMFFU?=
 =?utf-8?B?RkErUktaR0FST3NCSCtOYUY0eWJ2eUlmZ2E0bi9kQXBlcTRuNVA0djRQdmp2?=
 =?utf-8?B?SGdXd1RwTDhlU2IxQWJMQkliMVhZNlRWTGJrOGFMQWdMd2Q3MklvVmRiTkhY?=
 =?utf-8?B?ZDdSSjVLZWtxZnZmQW5YbXU5RGVtanFYRmtkOWNvM0RuVTRoL3lONHZKVFdv?=
 =?utf-8?B?clNBOEwxaXc0ZGVvMThSUWFHaXF0OHpIRndmT0pFRndiR0g1ZGFzS0d5cDdF?=
 =?utf-8?B?K2Y4aEtBd0pWVE1JcHpKNDNUdHFPYXFCTkFDQzd4eWRiTmdRWXlhK0RDdjlP?=
 =?utf-8?B?Nk9kS2kwM080bFhaRU12djBKSTlZMTNEb0hQSGdQL0V6SXZmNEpxS0lldVIv?=
 =?utf-8?B?cVdmaEdtaWFYK2tQZGttTXB3MUUya1pCWDh1Z2JXZU5zODhwVWJVbkVYckpO?=
 =?utf-8?B?ZTQrdjAvK1h1YkorcjM2SFZlMzdIamI3ejVtNGpXZmVsbi9RVzk4YUlaZkNa?=
 =?utf-8?B?MDFHeENnUnhIdXYyZ0wzejBwMmc4T2VYci9FdkdrSUVZTUIyQ3pnanNYMktS?=
 =?utf-8?B?NjZUdnFsT045T0tWYUdhSCtDMWo1YmZaSzlDSWhYNEI5RmlaQVE1WjVqWUFi?=
 =?utf-8?B?VTQvV3FaZ0Y1dFpzWFI4VjlHSGJydFdYSlM3NCtCRTJBQWNoekRRT0MyZnlZ?=
 =?utf-8?Q?+kS691in6uSf9eImbGT696oFu?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1mscEss4Gm4TiZGL++5BzZVdJ3/QKCBcx711qA5B1I1xImRtfQWDj1O7hVSPmixeDko+7eoS4MLLFlj7yNz1vogNb26ue34baaKSXrRcL5IwzeaB4cC/tGYkwy1zBJhD2rHfcCVFlnfbgMtsF5WqsYtRem7ejP06H5djgrypErvmJKN7N8coo4kRLhsDbfSp0mMDZtQW8ye2tAEBB/fw9AirL4gB/iv7OuErsUbdQYRZv2KoFOgMQYtckDaD7wIFfQcMSJXultw6nIuSwT64YsDQGBi5w9O8TXXmW/RiRVv0OO/8qK9rPbDphcKt/IlmxiKoZxGvZV5jv2dwOsGpJK/W7Ox3CKELLuhywEVtzUoDmqLKngzCBMu7jqNQphaPlQHAzrDCLGlch40eoxB/xqvUFJs8Toi6Q+XonkO0rlXCOgP4kBsoPsAQcZl15KoHtuFCoEjsXFIHX0l2oPDpqPZcDhjOnBNHOAdkn9oQFgFJERXnkb8bsB/r08wGuaYDH8JqF7IB53kvD5XHVzEi+PMmChrAaiHJeJyOYafRzGqQKSNfi+KdCPNfq5B/YjDIXUGHN3THy7/60X1Y3Hmq1Eq5xBloX7pwLcSObDPNWyU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd229fd-5beb-4d43-a226-08dcf91f8662
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 20:14:57.5556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5B2dC9CNmZ/G4GlwigKKf3RunHq94B4QzmQ86sdNeza9OKtv01+pOFQdSPt3V2Udq8Q44k5dTu6EpylNkgstgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4949
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_14,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300159
X-Proofpoint-ORIG-GUID: yWrWZm1XUlhpUrkjBzc_eNBtFHhB3_YE
X-Proofpoint-GUID: yWrWZm1XUlhpUrkjBzc_eNBtFHhB3_YE

E.g.,
     $ uname -r
     5.15.0-205.149.5.1.el9uek.aarch64
     $ sudo grep ext4_dir_operations /proc/kallmodsyms
      ffffc45a59d9ee88 100 D ext4_dir_operations
      $ sudo awk '/ext4/ { print NF }' /proc/kallmodsyms | uniq -c
        2342 4
     $ sudo grep -w ext4 /proc/kallmodsyms

So, lots of ext4 symbols (including ext4_dir_operations) but none of 
them are [ext4].  Bug in... kallmodsyms?

On 10/25/24 17:16, Kris Van Hees wrote:
> I am not too sure about this patch...  We are not using kallmodsyms anymore
> for newer kernels, and on older kernels that symbol certainly be listed as
> [ext4].  So, if ext4_dir_operations *is* in the ext4 module code (compiled in
> or loadable), then the proper ref to it would be ext4`ext4_dir_operations.
> So the test should be able to use that - if not, that seems like a bug rather
> than something to change in the test?
>
> On Fri, Oct 04, 2024 at 12:43:55AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> It is possible that there is no ext4 module, whether built-in or otherwise,
>> even if its symbols are present.  E.g.,
>>      # grep ext4_dir_operations /proc/kallmodsyms
>>      ffffc45a59d9ee88 100 D ext4_dir_operations
>>      # grep -w ext4 /proc/kallmodsyms
>>      #
>>
>> Meanwhile, in
>>      ab883bae "tests, io, scalars: use kallsyms instead of kallmodsyms where possible"
>> we read:
>>      scalars/tst.misc.x needs adjusting to check for the presence of the actual
>>      symbols we are looking up, since the modules might well be built-in, and
>>      thus not show up in /proc/kallsyms.
>>
>> With that patch, in test/unittest/scalars/tst.misc.x, we check:
>>     -if ! $(grep -qw ext4 /proc/kallmodsyms); then
>>     +if ! grep -qw ext4_dir_operations /proc/kallsyms; then
>>          exit 1
>>      fi
>>
>> So it is possible for us to find
>>          `ext4_dir_operations
>> but not
>>      ext4`ext4_dir_operations
>>
>> Change the .d script to look simply for `ext4_dir_operations.
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   test/unittest/scalars/tst.misc.d | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/test/unittest/scalars/tst.misc.d b/test/unittest/scalars/tst.misc.d
>> index 60edab45e..6a5f4ae2e 100644
>> --- a/test/unittest/scalars/tst.misc.d
>> +++ b/test/unittest/scalars/tst.misc.d
>> @@ -20,7 +20,7 @@
>>   BEGIN
>>   {
>>   	printf("\nr_cpu_ids = 0x%x\n", `nr_cpu_ids);
>> -	printf("ext4`ext4_dir_operations = %p\n", &ext4`ext4_dir_operations);
>> +	printf("ext4`ext4_dir_operations = %p\n", &`ext4_dir_operations);
>>   	printf("isofs`isofs_dir_operations = %p\n", &isofs`isofs_dir_operations);
>>   	printf("vmlinux`major_names = %p\n", &vmlinux`major_names);
>>   	x = 123;
>> -- 
>> 2.43.5
>>
