Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2672581
	for <dtrace@lists.linux.dev>; Tue,  3 Feb 2026 18:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770143930; cv=fail; b=PIreaY272jX9hBC4REXp4nfdAaUx4ToIeSt6RfIuip+9z6eNDXZ5pEUHbIN39hkJmcm+BA5NiribZJ+iAmh133e8+o0SUaXND8hm6XlDiDe7AReYUzOdhuoUdQehQEu4ZSq/EaBUeG9x+HY4GXlcU8WHusC+JbisoNvrk1u9WUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770143930; c=relaxed/simple;
	bh=fZdbdZbrjBzXpbW9w3DIyHfhyE2zqYAiszHAvbA2wdM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ifBlUSIu23NelYrhEtYEnDzYX6cgzXpCnIyXAIPfw5X+ghPjQpNAtbUrEk+72rDIxyPi4fGWIDRRhpB8q+1m5UdePiZsfL8gR0EVP7CONZciu0h4SjM5QTuutwelgmHvTDATolvsV86iSVlgfEUJ/kCbcq/jnM6tJhsGNx69RIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iQdOTcrf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TmvPl71Y; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iQdOTcrf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TmvPl71Y"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613E918o3593879
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 18:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=+uFGJXZcetA9bzvbIgzHl/RkW9RrKIkf8+djCgV1Sz0=; b=
	iQdOTcrfRIWgqJ1rGWr3x8CiH8Au7x72M4tew6Rduase8B7F+bPTkQ48IJXMSGs2
	BBfMyzZOU7HYEGBdOPO0DsHexfciD6RLeYUinOlRZBIJuoqA8zR0ycHMmRIl53JC
	u3trvISgqKR2/3UspuIiQb+RabY3COzWk2jWjQJABRopHNXr5t7CnQg7CuhLLoQ7
	nIjjLZbtKMTC6gpuJ6WeNDV4kRiRgZkF8DO9Y4+NNwLc6/xT3uYfh+Ez876suf6p
	nrm/pKDL7f/xdxMzPGtmvDg87a/dK2pq3q8UvLbs0XzdGV7RFZyOzQokgji/DNXv
	UnwfRS8VlM48V+7JfGY58g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3jhb0hay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 18:38:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 613H15Im002080
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 18:38:47 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010045.outbound.protection.outlook.com [52.101.61.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c186mrbed-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 18:38:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+YcD3V6r3pscpV25wSyPAkbGFhnEpE1EBNep6duychzt5cAKG6b8g8tANw5PG6ePAQbVL1eyECz7BkMtUQGm7juYcDvk2B6uzzDKrATphcxTGhIakZ+AkvMhI/25EbmBHdxDCB4NzYXenlhBmA7Hb4OQ9Ur9HhdfzzWmAK2qeVw4VED7rT4GRQyE7JWCGtcUPczUSG8UJKsIlMZOr9/c6jQlg2XYo+kyKkDoc1GIjUjNzdIC6bUvqN2pho0AyG6wOM1sKBhsiPd1gnm8riRKX/hQ3CheKJQSKpxsSh1eBgwMcvnNH0M8zcSnkrYbi58LWuCViiiAt3IT0OqMbdD+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uFGJXZcetA9bzvbIgzHl/RkW9RrKIkf8+djCgV1Sz0=;
 b=HSCwoLEhyFd6ZpboqCJ88Qv5omrtVDKBgTzbcRsJqwOP+9xiAOVHYqjlhY8JxNe6DMJUFucrzzuQ7GvTlvvUz5KvkD8wFXvrfOidA75+kR8ysxcmd8g/6HmWAskVX8CzVWnErFpA91dQvdy8m2gaRURHrm7zVW+81F060vdKXg/Cmii7Wvt6kYrb+Q0mzH+beCx1/msdFR61imCnLHcBDTeC8fFnPKgJ8CBeafr9z9m5QofWCb4rSuB2FxgFyTQByc03fuNy/dQXc8H1jDrlxf3Cu3socJZe9MEYHiKI+Rr+N2lLX4yXaJW1v30Qn9/thjMI1NCmMsj/V0mR0vwTQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uFGJXZcetA9bzvbIgzHl/RkW9RrKIkf8+djCgV1Sz0=;
 b=TmvPl71Y2pu824UHTfNRlDTfl1i4aGukQOz7y2rENSNVMMncKRL+3BF4TJIJ1lfw3PNLVJMKlP1C84862irv+mkHpOXg6e1IcKcK29npl04aLBmW3srEWQJ1qFceBElIOlgA9i+mRDAp94mJyIpEQkgjBjZcZS09+CJwkgHA+QM=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by BLAPR10MB5012.namprd10.prod.outlook.com (2603:10b6:208:334::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Tue, 3 Feb
 2026 18:38:39 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::62bc:4b80:54ab:ff97]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::62bc:4b80:54ab:ff97%5]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 18:38:39 +0000
Message-ID: <5f445b9c-ffe9-37df-9e86-a6df962c00a3@oracle.com>
Date: Tue, 3 Feb 2026 13:38:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] spec: fix missing attribution of patches
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB75227F1175EC886B4603D47FC29BA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB75227F1175EC886B4603D47FC29BA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:254::20) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|BLAPR10MB5012:EE_
X-MS-Office365-Filtering-Correlation-Id: 16f2be6a-cae6-401d-6712-08de6353729b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2ZWem84SUtsakZPZ1VqM1c5YzNFZmQ4M3Z6NldQejAzcjNkVnlEVUkrSUJ5?=
 =?utf-8?B?YXVYc01zbjhTWTE1ck41am1iZ2ZJcWNrR3pHaGE2RDVnc0E1a0wzVFNFMkRv?=
 =?utf-8?B?NUQxQk1YTFcwbDN6SGJteThzN1BrNndMTENHMGNPQmt5dVpkVmR3QUJieWU1?=
 =?utf-8?B?TXNmOWUwMjMxTmR6RWM5allVWUc4SkVaaDdnTkFqNEtlcnZJMllyM01lZTVt?=
 =?utf-8?B?dU5TTzdmM01xajZoRnAvck8vUWNuMUJSd2daSUx3K2dNTTFWQVR1UCt0ZldQ?=
 =?utf-8?B?cysydlhoQW5kdktRK09OdlZtOHJTYkpVZ3JnQm8yTWxhUDdFQXNaQ1JPRmRM?=
 =?utf-8?B?MG5KcjA5eG8wekp1akovQVlwVkdBVUNLWDJOdjhmdnRJUGIyNFNFSmx2TCto?=
 =?utf-8?B?RnpOMXl6c2E2N1VzZzZkM2NvRDVRRVlsZ2hGOEIrdWpTWFdZaHJraVpJL09L?=
 =?utf-8?B?M0R4aUpNdTVFeXhiOG9PUWFDM1BPbGQrTnlKT2p4QXc1em5QcHFGNzhMQkZG?=
 =?utf-8?B?bmUyWS9DMU9obUw3ZGRGZVpVUW1oRDJxN0pTNGpDZExucVF3cVkvNkR0UmJM?=
 =?utf-8?B?dDAyUFRackNFRFdCbzVPZitTbHI0Um0yaks1WG1URTVvb2NBM1JjUStLSEZu?=
 =?utf-8?B?NlNBcVpZYzcvKzByUlh3OGJpNUJMMmJXeVFRS2VRaThJa3B5NnRyNU5ZWlhL?=
 =?utf-8?B?a2kxditRUUJ1cU16b2IzQlpRU2YrUkdDZ1FKNE10V0ZHSGZiWlFEZ3UyenlJ?=
 =?utf-8?B?ajNDSjNtNTBZeTF1UC9MQVFkdDVjcWRUM0t6d25EWUVFMGo3Ny82RVFWeUcr?=
 =?utf-8?B?NHJmdENYT21vL3lwc1Y4d2xKa09BQUovcDJNRDllLytoTis1VWlxZU1vU3I1?=
 =?utf-8?B?a2I5dWpSYTRCSkxJZGxVU1IvTlFodWZEbFNvL1dTTGJWL1N4QUI4L1VWaVRB?=
 =?utf-8?B?d3dTdkZ0VWxoMThydmtKalphZ1ZmckRDYXhPK0JCQXhyWTNDTkJuUWNMOUZT?=
 =?utf-8?B?VTg4eFlleTkvdUZoKzFCcnJXZ0xtWTVPZUFRSWMvN2FQNXZzcW0rNUtINXRn?=
 =?utf-8?B?K0EvUUhwaGJmTXVUOEN2WE9TWkxIeHNYM3pVV2JkRjZ2VzZ6VFI5aTZLVUF2?=
 =?utf-8?B?bmhKMmt2ZmtXYnV0c0kyVzdNZWZFcVlvdTlnWElYRDFzQlpTMHplR0Y0N0xQ?=
 =?utf-8?B?dGpDUTZodDA2RVM2bkhUaHpRK3FOSzl2dXI1aHFQV2Izd2R1S0IrYytNc3FB?=
 =?utf-8?B?NlhpYjc5STVCV1NuQmM5UWNEZEJRaWxSLzBrTFN5WkJyaDNVV2l6dDVsNUhI?=
 =?utf-8?B?akZTRmJhUTBMNFJxVGRCWHNOZHkzTWpyc1pwYmNWdU9kU2JLYlduenBoT3VV?=
 =?utf-8?B?U1NCY0N3c0RFTU42NDNJWjkyUnp0TVFTWGFIa1pOUXVGRDZDaU1vaUFxdTJx?=
 =?utf-8?B?WDJSVUx0L3hwSTArWVpwYWR0MjRhbTFJSXN3RTl1OTdlQmZvMXVtdFdYR0Zv?=
 =?utf-8?B?cU56b1AvUlhHbFI4R2IzRzN1MjVXRk5PT0JmSWRCdjFIWW1oWGxCSDd4Y0cx?=
 =?utf-8?B?VnZTd252R2R4QVJYcEN6aVczNUFQNDUxS3lEQ3E2WlZuTkE4UXJ0VXFGaU5O?=
 =?utf-8?B?NEZNTEo3T3BUb0wzazFyMXZtMmxTR3VYUXdPQk9HVlQ5OGdEUXExZmc1cVJE?=
 =?utf-8?B?UlVhUlVhZ0oxZWdBK1ppazJVM3pCZzM0UjhMNzNMNVpWOCtPSkxHSDlCdU5m?=
 =?utf-8?B?OVh4eXhqTURiOFVzSU12YnhEMityaUZjVFJwdnJWMG9MR0thVTEvckNUYVAr?=
 =?utf-8?B?MUlCajJvUG15aTJDM2IrZ2tqQ1VIOTlmbVJPVlFmNVh4bzBNSENjM3FXVU9q?=
 =?utf-8?B?YjJFaU02QldpdnllK29KM2VMUWg2SEF1VXNxTmFkRkk0RFU4aXR3dU16Nk11?=
 =?utf-8?B?YVRsMFJJZkMzbWlBa1M3OGplVDRZeVl2cTgzYzBWcGUyNGZVcEhiLzE3QWNx?=
 =?utf-8?B?NGdxVmkxUFZUVTI5aExyV1NFckRUeW0yTHhRdXNvZVl6eFU3T3crVnNHTlps?=
 =?utf-8?B?Q1kzdWl4SVZ6NlJpWGJ2QkNIbzVwZk5vNHlRVGFWS1B6MTRVeGhaZmhaUmhi?=
 =?utf-8?Q?Lsrk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TW5EWmZDSjlpdFl2cmZBY0lQRGtySlV6ZGFjWkl4ZHRFNCsyZytEcmk4R3V5?=
 =?utf-8?B?NDFJcVZyNWVmRUluZXZsc0xPSDFRV0hlaXpLT0tKelIyYXBRN1FxVDNZT1o1?=
 =?utf-8?B?eEhQbEhnay9jOUFWcXB1Y2gwOUJzZk9TbU5RMU5MdWhTaEhrRkhVNmc2RU43?=
 =?utf-8?B?ZFBwY1ZwSUtVMThDelFMY3RmY2NES2VHZXFlV2VnckdXaW5qWXRScE90U1FG?=
 =?utf-8?B?RFNNWUZrQ01xVzlvU0RaR2NyNVBJazhNL3g3T3FDMG1qVXhnLzdON3EwWjRp?=
 =?utf-8?B?Q1Z4Z3NSNEhMWkd1cExXL0lJZ2FpZ1I5a2lIaGkzbEhoeUdzMkRhU21QMlVR?=
 =?utf-8?B?Zkp4cVR6aks2YjJxSkRIQk50WEpXd0haMGdTajhtVjhTNkxLbnVRUlRtRjc0?=
 =?utf-8?B?K1FHRzNVR2phMmpyL3piaC9MQWVGR3ZoRE5TdzJ0WElQK1JDY1NxMmhPR2Vk?=
 =?utf-8?B?YnJINllKM1hJZDlVYnRUNDVYNTBSTUVReEY3MTdTbjFqRWlxaGpUQ3lkMUhz?=
 =?utf-8?B?N2cwUkVNUUhVc2RsRHhkZHNjY3U1VEdTZnIxdUw4QlErVHBsTzRhMUswaVJV?=
 =?utf-8?B?NlVVU0piWnRGTENGY1dRbVRKYjMxK21IYlRGdUkyemlvaE8yeXEzVEdhdCtQ?=
 =?utf-8?B?Z0taTXRNTDdYM2pUMHgrMWo1ZzN4UGxoY3A0b2VBUVpGc05GYVFyVGV0YTA0?=
 =?utf-8?B?YWlOTmRkanNYMldxSDcwZ1JhdTFCcnQrOXp2dXA5aXJadEVhV0ZHK0g0akdz?=
 =?utf-8?B?dy9pa0tTUjFwU0hwcmVpL3RPeGh5VlQ4MXNNMTZqRWVwcXE2RHNTT2thYlNM?=
 =?utf-8?B?RnluMEVQSkJhVkZaYnAvL0hacGRTZmxrZGR0MThmN1N3Rm5jbjVBTTN1eGZD?=
 =?utf-8?B?SUZBdEVFSFZVRUVkLzd2UndpRGhrbEFUSlVHcWhCd21ZaVgvN0lNSFBVMXRO?=
 =?utf-8?B?WmxnRjQzWHB3KzhCSHhPUE1JblA2SnRBdHE2QUVETlpHVkQxdVc4aWVVaHox?=
 =?utf-8?B?NnJYKzIzR2FtaHc1QytVbGF5TktQd2lGL2NvRmdQZG1UOE9zZ2ZtVXJ0bm11?=
 =?utf-8?B?YXJCV0JrM0czSytZanYyYUJYK3VwQWZDMDF2eEtNVVVrRnB2WXdabmt0OXBH?=
 =?utf-8?B?K1YrN3JZakFUaVROZ1BKTkxpb3JQMnRMa1JFVHBxU2ZaMVlDTVI3VzZxbXFl?=
 =?utf-8?B?N3B3U1ByTWZQWVpuNlNlaVNuYk84WnpUcFg3aEFTcFE2VEFCS0E2ekpzNkl3?=
 =?utf-8?B?RUhnNjVtY2VSRi9OUG1ONDdNUURVTzAyZlBrVHF0cXBpMHFzNDFIcDA3RXNW?=
 =?utf-8?B?YVRSK0gxVmhXNmtqQm1mZUZaai8vMFVLSnJ6RitwMnBNRnJNWC9VdjFkL052?=
 =?utf-8?B?MFAvTUxnWEpPVm5kMW54aWk4UmZFQWpHc3RRcnptUjRxVGIxZ0l1aFIybEpC?=
 =?utf-8?B?UmUwcUdxbUdMSTQ0UVEvV0d3TUlWSDl3emhRSElIalEwSzc2OGRYREE4TW1l?=
 =?utf-8?B?UVNaUWx1SW02am5ucmVQMFdRUzFlSithV0xIMUNCcXl0S091YW1ueitOTGRK?=
 =?utf-8?B?cTJ1blRKbm9tMTlEY3p2TUZCU3lrY3lMQys0UmNRVi9QRzRpZ2dnU2NDd3hD?=
 =?utf-8?B?VVlldG9MRXV5TWllVEs4WWNKTnRTOEkzb1pIdzFNK0pzRjJoQXY0TjJUQSs2?=
 =?utf-8?B?L1VDY3NyczJCbkxlTkhOT0lJNkRwV3F4di9VWUs2UWU0L2FvWG1tMmhpa0RG?=
 =?utf-8?B?WjFtTzV0WEU4R3VNUzE2M1l2OGhlZk40d0VManFKVE9zNnU5Y1VCSk5SUE8v?=
 =?utf-8?B?RXBYVW15ck80Z0FoVGV1YXBzQXIxcE9oZTEvbXkwSUhScFgvMXRhOFN2b1d4?=
 =?utf-8?B?bjcyZnZ4OXE2cWhrVWloK3JONlZOdW8zTVR1UjdCTEQ4TmRZNlFjSEM5M2Vy?=
 =?utf-8?B?ZSswMnVsZm1EdUMzSGxvcWZGNDU2dnMyN2JDRHdpdW5SRi9qNnkvSEg3SkFS?=
 =?utf-8?B?K3BadlBWaVhhTmk4VDE4a1dYcm5RZWVEQnRGOXdXdEsvYlpWSy8zZFQ1T0NX?=
 =?utf-8?B?OVpCWnMwcFpJVmg2NE5nMUJxQmVEMHVlUlVhT2RvRndTVVM1YnNwalIvMlpU?=
 =?utf-8?B?MUxyMFNWL0YzV01SZURmbUlUMzVhYWxYUXAwYVpFRW9ObU4zeFBDOFlBWXUv?=
 =?utf-8?B?UmpVRXNsMVBjNEg1THFCVWhMRUdBNHo1SkVLbkJBOFVROEV6VnA2Z0g2bytC?=
 =?utf-8?B?dDRXZXdOMG9HV0hncmszd2Fxdk5sTlZ6WUVUSExOWXNBS2NtM3NMSHkyU0pa?=
 =?utf-8?B?bktUVGRqdm4rR21KN1hienVGKy9OYVVSeENuSGVkS1QyOWZXOHVXZz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pvCZ49zrUBN6oioEFKFq0Y+wtsLPjJVZEa8UJi4C7ijgqrcn6uqZmp909YRFrB43CHdzt+H2WGDhKpjPm3Hjlw7Nixo7cYnt+k+rG7qo/sVMWPTl4h0P8ZR7Qe/yOa7+8TlAj0YGlFIEombS5rD1q904SNJFnbWVC1JcwLcv8Pz/2gNobTpdR2BJKuDayh8nnH8D5V402hgM6b1mvvzhAvwvhSJYw1I8CR6KUIw5bsS+45PXuIvx1aSVFip8rS6mvzYxTa3iPAMlwsLpbilSy1BvX7FnW1VKRTLk0KNKfScyP8QB41LNjW35qyEuCR1ypg8LhtUnAK/CuqgPOW+O9rUF+Zl5rWXKedCYiF/EEyVzSyZNKLogYn8hSCDMEK/C7Gy02DcY+Efvz85FnkThCAh5Jp6OlKgJ6VLtZ36oxdcDzOZBKn1F+tzqSzO+GJNmPg61eNli3QlWDO22diS0YBIS1K285Zonz2+G75KuwyE+82161TIxhvGvZkinCkXU79ql/FN4ptCKM0c2o4y2rZgTAAbf0P58QB7Y+7Iqy5rqt7ekIQl5p8tTA/99FYl0nOvpy+g+p+TvF+/fjW6MEMUuESrAtrKt/xEnDIUPJC8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f2be6a-cae6-401d-6712-08de6353729b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 18:38:39.4099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mim22QwnJ9ew4UKD6cVQ0sA6id9lPkPdB1GD/UjcHdqhQY7+2vgBxhjRZ0GyH2FOTwZN3ZrpRuDiYklztdx7Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5012
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602030148
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE0OCBTYWx0ZWRfX2v5tUVBKHW2/
 d5gsj+wxcEel4R0JEejexAxI+YlomMwMR2WtbDjcC+34n6ATvaOhaOCoxxM2jYSZvIjh0rvI+9V
 jBYwR4mMM/KEObgmGQFv10JRujEPHerRU7MkakDuj7UorQ/LQy8VYzi8D+ygp41v/ySDiIGA01i
 g7sE+9iBa/SXHDuNIRTGlfKOV3kaw2PIj1KIxNUlJT9EUL9cK7zZuUd8QEsyri1suvb0DBXa1kq
 /ntiwfn5FAA32KhsBAaUpvTChtL+i81pFoBvzVIIjAOSrQPWuvxyv3DFxEnO37CEwepypK3xBDX
 Sisxn9YRtTc/2R2SBEGA/qHuXsXp5oHbYN3H2Ccb8yDrAiBp0ibssGox74XduTVunMw1OSo8Q+y
 p8nTsM71Y8dFI9le6TKJJWmL6qnDZEs5Ibx8wB4LnqEvlRy4lCzkkdsJCH3ge4eQYXhirbdNmc/
 MbaOOozWr1oUAor0zKD8SASt4wR6b5p1zRt+uloM=
X-Proofpoint-ORIG-GUID: A8fHm_XQ8MAGqon4KZln3a2Qcm0QV9hO
X-Proofpoint-GUID: A8fHm_XQ8MAGqon4KZln3a2Qcm0QV9hO
X-Authority-Analysis: v=2.4 cv=CaYFJbrl c=1 sm=1 tr=0 ts=698240b8 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=InlQuHrGrpKkHGVERN4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12104

Oops, my fault.  Thanks (and sorry).

But why are only three items fixed?  Presumably, the other items should be:

- Change the "stack skip" to 3 for fbt (fprobe) and rawtp providers.
   (Eugene Loh) [Orabug: 38776929]
- Fix prvname so that both rawfbt and fbt probes are seen.
   (Eugene Loh) [Orabug: 38842114]
- Do not convert "__" to "-" for stapsdt provider names. (Eugene Loh)
- Fix printf formatting with non-monetary grouping chars.
   (Eugene Loh) [Orabug: 30430270]
- Add the DTrace Tutorial to the git repo and install package. (Eugene Loh)
- Add missing documentation:  trunc(), stapsdt, usdt.h include path.
   (Eugene Loh)
- Update LLM context files to forbid "if" statements. (Eugene Loh)
- Test suite weakly pulls in kernel-uek-tools to get perf.
   (Nick Alcock) [Orabug: 38064413]

On 2/3/26 11:23, Kris Van Hees via DTrace-devel wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   dtrace.spec | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/dtrace.spec b/dtrace.spec
> index 6f0b0135..4d470cf9 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -231,8 +231,8 @@ systemctl start dtprobed || :
>   
>   %changelog
>   * Tue Jan 27 2026 Eugene Loh <eugene.loh@oracle.com> - 2.0.5-1
> -- Implement PID-specific uprobes.
> -- Allocate the buffers BPF map to fit highest CPU id.
> +- Implement PID-specific uprobes.  (Kris Van Hees)
> +- Allocate the buffers BPF map to fit highest CPU id.  (Kris Van Hees)
>   - Change the "stack skip" to 3 for fbt (fprobe) and rawtp providers.
>     [Orabug: 38776929]
>   - Fix prvname so that both rawfbt and fbt probes are seen.
> @@ -240,7 +240,7 @@ systemctl start dtprobed || :
>   - Do not convert "__" to "-" for stapsdt provider names.
>   - Fix printf formatting with non-monetary grouping chars.
>     [Orabug: 30430270]
> -- Discontinue -xversion=V as an option.  [Orabug: 38615307]
> +- Discontinue -xversion=V as an option.  (Kris Van Hees) [Orabug: 38615307]
>   - Add the DTrace Tutorial to the git repo and install package.
>   - Add missing documentation:  trunc(), stapsdt, usdt.h include path.
>   - Update LLM context files to forbid "if" statements.
