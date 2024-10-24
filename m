Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6F122B661
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 19:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729798223; cv=fail; b=drWut4qnJNwDBlg3dBHsvYSqo7tqaf2BE7KCjO2970Mr/1LV4xcfO4XVCKOhZ0vlxTMW9GwJEavQL78QVRuyn3Wrp6n5u0c4/eiy9/94P7l4mtnfqlagkQ0JbJJS8+RDjmpb8MRaVlV+jTBu3w2xZWpLhRjQuJVXqvv/FWCc5ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729798223; c=relaxed/simple;
	bh=dPD//ILdnrZMeg/37EjOy0VX1aiX0xxs6m/amaYMAO8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UEz/7MV0//efvbOt0TLA9JP+wiFEjWDyGGBhgG8UyzhIevicUbEnVpfJs9Hnn2hpaz3Sj7p7mryI1iXwg4/G8o6kkgnouzjZgM/lSa4Kpzd5UBbf2+Lwqes1URPhLwL5aRKs1t2ZtE2Byxos363rNytEJiXXx+YX8gWePYBo+o0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VUFQe8Vb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=seH3RR3b; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VUFQe8Vb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="seH3RR3b"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OHmaYC014338
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 19:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=1kHNmdup2WwwUrXAVmx4F1MvEmn7g47ldM0Nx7IUzRw=; b=
	VUFQe8VbVLd7+bT1FT2xeIFbIScSJ8lir411n4BEksiapBpmYxfsAcvbDLJjIl5k
	L1OqIynX/s+/TNxzqlnSWK4qvlrUm9kiKeDNeVCqRvJJA5BDhHovfv+CxtKvHQZI
	1PcrOiXyRRp8JKGPYP4tbii1IizzNRVq4yiS7N33Narbk5r0Tl1X2KxeX8q6MECj
	fQfiAo8KHqIKTyuahEQKAR/4JkWYqkSsfzfQBvZxOHEsNO0/axMbK2gk0Qjr9uS0
	+0vKp8U9dGQyvQun/noMVjtalZy6lwnwJ8MltG3GXQ3+OXvIA1UvuQSDxeJz0CAK
	BIZNHaU0j0rOxt8VorPR1A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c545bm08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 19:30:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OJC7XA018428
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 19:30:18 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2045.outbound.protection.outlook.com [104.47.51.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhmfn1b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 19:30:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7rI4NsfImLrtXXTW01XxLBUB3VCDp47esZAdQBEdwHNrWbEp368DvnKS7Dc6pwMiW3DpT9Y8E3tw0reab5eTzg9dIr+McT0qAk8ZvJmXoAq/nyB8xOWLgP4KoNmF/eNjDUY9AH3gnGLBX3jGn4dbfwEii6uDWvlcVDN2qMRxUCBpGB/57lqwWiSdnLspECFZsBNPbkNK1mbp1OZuuNe3o/n0KDr/HOMD/iEbhsHAerCqx+QyOcsVCFEgQnlg2AdWXE79z+FLpIYGnWcWbzPUNFHdFdphIsP2UqiumuRrfhb/f7SeLfT2bjTc09fOiB97s4imd2NxtD0mXHEJ0Q2sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kHNmdup2WwwUrXAVmx4F1MvEmn7g47ldM0Nx7IUzRw=;
 b=A0WlbcDXvY5sZWJ871mBm2ydgtP4LfjxW4KZodYuPlL3PECSw9UUxb5guewYeYwE/Y83hB0WtkjSyVhUjTvHlch6KDMedm3NOb5mBOgtHzLtJaripfoparElSr04BRtuSGcsRxdvsV7yjlduotYscoqEUCCa9bttj/a7oeQ6K0qbDuD4eh3+0DyXjO7X4pXvZhKmLZKUnUV6GoA2PSF36WP+ypACzy8HtBUElAAfplREUg0PaB29oiDFltYXzkSfGam+SDGD4ONB+gf3DdFSlDth5FexGmJg+EKCsCsjHLRs2PYt+T9qNLml+A4kYi+F3ZKyhO0ln3c7a8BMFt8/BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kHNmdup2WwwUrXAVmx4F1MvEmn7g47ldM0Nx7IUzRw=;
 b=seH3RR3bBF1+kS96INXsTGeflCb7LZne17THaJwWZlLi6wWiDp2ZcRUM53ffHMMCxiVr1qfOYVyGgEHNIIkPaIUFqRmErRuVi0YrKZNNJgLuqV8cabfX1AhwyNESJr1Hs2lZGaoTMq92MiSqHfXp/20S1ymrAFrQSLRL2zR+kjs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB7262.namprd10.prod.outlook.com (2603:10b6:208:3f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 19:30:15 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 19:30:15 +0000
Message-ID: <0ac389c5-769f-b86d-ae9f-c9102e774c2f@oracle.com>
Date: Thu, 24 Oct 2024 15:30:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 15/19] Ignore clauses: some clauses are impossible
 regardless of uprp
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240924202554.7011-1-eugene.loh@oracle.com>
 <20240924202554.7011-7-eugene.loh@oracle.com> <Zxlcbjd4QSoU8H+T@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zxlcbjd4QSoU8H+T@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: d8024f6f-27fd-444c-fb38-08dcf462492d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0E4TGJiTHlmdWdOa1Z4TmZUaG9SVzFKZkVzL0ltWUNSWWtwQUErOUQxbW1G?=
 =?utf-8?B?ZDU2YkJpZjJrc051MzAraW1jSk9tZkkxa2Fid0JZdXBMSE1FbUgxdGd4OHJM?=
 =?utf-8?B?WWZDWjUycm53QWk4eFBPbDludDVUdWt4U3RTRVlJbHpCVksweEJRdWFrU012?=
 =?utf-8?B?L3k4WjRRQXAyRUVDb0Z4ZnozZnVkSXlkYVkrdzROa213bmFFdDBBbERDY0RJ?=
 =?utf-8?B?bWRKQklMbGZjbStTOWJkVWQvZ2tkYUFKVWdBaDdpVXFVditGNlc3MVhFbXBS?=
 =?utf-8?B?VnQvNWwvWTZUVklDUmNXdDd5MFpBSnBwLy9MZStLT2FVTVdpbnVYdFFKSURv?=
 =?utf-8?B?WE9CMCtaRW5Bc3NyUjUzOWdvL2FhLzhWdHllSlJxYmF3cUcwS1BIenp0NG1Q?=
 =?utf-8?B?S2JJdU5GeDR0UjdiOVVZa0diRVFGSHZMRzJMN281YU1JMTVvaHNsUnAvdmdl?=
 =?utf-8?B?VWZlS1dDN043MlQwTHB4UVQ4dnFpNE9sb2l2T0lHeWRWbk03cHZuUUNqU29L?=
 =?utf-8?B?S05QckQ2ZE5acnNGQlgzS0V2SG5tOU02dG13eDNrQzVIQjd5bHZtM1orSTNN?=
 =?utf-8?B?bVBkd09FUGhRVU4wU1hYTFJFQ3JPR1FNT2hLc0pYcXpLWkc5ZDZqdEtmUkps?=
 =?utf-8?B?L0N0c0Y3aWpHU1hPblBxOEQweFdqb0QzZnZMenhFeEx0K2hzM08wWmxkT25J?=
 =?utf-8?B?Y2UrSTVNa0ErU3ZKMUF5bExaK0w2RmRVbkVGYmN5b0pSWjRCV0RzeUhOeXFC?=
 =?utf-8?B?L0pPd2xnOVlueTNLdmJGTTdub3N5SmlWelRJUjRwbkFtL3B6ajloNWlmVTVC?=
 =?utf-8?B?REphaHkyWkgreGJIUVBvNit5SXAyUndSdHo4cXM4akFUUGJNMldkbXpIMkdG?=
 =?utf-8?B?VlB5N0xiOFZEUjREYVBUM3p1TEt3aENFUG5KSlF2bFl5c1QxeUZxcXNLd1JY?=
 =?utf-8?B?UHJiRGExVmxoUjgwL3dqVk1COEZGQjhyRWU0K1k2V1M4ZEE1WkkrVVRKUHRs?=
 =?utf-8?B?dWtFOENqSmY5RU9zQXdUK2tzV2dodm1rQkl5c2FaeUxDSVBoQm5xQ2tqS3V3?=
 =?utf-8?B?YkU0ZW16YWE4VHgrS3B5dGtSblkyTUE4b2M1NUd4RnF0cEdWZUdkN0d6ZXRP?=
 =?utf-8?B?WEhseFlkRjA2T3Q5NGMrRHRVV1dkU3Z4NXpJOVpkdDZPNTRSK2hZcVV2L1Nu?=
 =?utf-8?B?UWt1V2dDRFZZNXd2dnRIams0T3ZaNE5ZL1FFRG5TM1FnbnZkZDYxQVlWaFRm?=
 =?utf-8?B?N3RMUlgwL3kvSHFONkk5V0E2aFpjYWl5dkt6OHVCS2xtQUxlUUNqWEtBODdH?=
 =?utf-8?B?d3E3MXZBbUlpT3h4aXFmZ010cEhWTEQwSlYyTDlHVll2SzhTN2Z2UEV6TXUr?=
 =?utf-8?B?NjhZcVdpMC9DRjRocHU4dGM4UGVMbkN1S2IwZDlyM2htNU9Yb2F1UVUwdm9n?=
 =?utf-8?B?VGdSeGxRYnlSUk95K2pEcEsvNXhneEFtcStVd0J0MlB6bEttZE5ZK2hGTjJS?=
 =?utf-8?B?bDRIaDBYVnBpaUlZK1JkQ0sxUi83NERpbGNwZTlqK0dTWnJaQU16QWt5UVhB?=
 =?utf-8?B?TkRiNmNJWTYvK1NaUk5Xem9xNi9lVklzSitQbnNtZ2JiL3p1ODJvZ0ZFOVJl?=
 =?utf-8?B?MzRlS0FxRE1OQzA1VTZyUzI1MlZPdXZLQkJJVjBFbUU5dFh4VHE4RXlTcU9D?=
 =?utf-8?B?MjM3TjRuWC9XWmVkUk5kSWkrc0NZVXo4TkRrR2NBNGxwWFBzdm1WaWdOM1Z5?=
 =?utf-8?Q?zEY6uKUnJecH+F7s9p/b4mt/XOzLAq+FgR67C7X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHJlWjV0OUVXNEFKRnptaCt2TUI5VGFQbWZLaElhK25qN3RadmpMdjYvdm1R?=
 =?utf-8?B?NjBMbjhqaVN5REQxbHdFclprZUxOaWtOZ3ZEdFpFMVFkazJ4SDhBeDJ4YmpD?=
 =?utf-8?B?ZGU2dFpwa0wra28yYmJXU1paTDNieE1UV1hkcjBPUUFLUGxPZitJRVlUL0lR?=
 =?utf-8?B?NVNidGo0dmV1TGpuUjFiY1diRXdiVTZTS0UzamxoMCt1Uk5ZVzVSOERNdEhu?=
 =?utf-8?B?K2l3SDcwWjNubC9vZy9Vc0Q0NWY2VXJESTlkOFUzUFhvWkh3d2tiZ3lZSUNH?=
 =?utf-8?B?OW5xd0tFMWxIRWZUN3hIOVJ3T2hFTHRaaVhEUmpkYXhCQjMxcGlSOG1PbzQv?=
 =?utf-8?B?K2FmOFBXY0JWdnM3SG5KeUZIUmtNdGJBV0J5MWdmbmRHTmNCTXpPYXc0a3BI?=
 =?utf-8?B?ZnJIdWNTc21NZnJNdEpNOWtreTBaano1ajczZjJLWkV3TDlXS1F5K09rRE44?=
 =?utf-8?B?NWN0S3c5TkdqZFVKcXgvQThPMTZ0dVkrOXpTbE40aGd5RmRqUFlOZUQxdmdY?=
 =?utf-8?B?Y3k3Qno4RTNjeSthaTRTSTYvUkNiVG5UY0xpZEJjeEloZXIvSHdpK1Fjc2o3?=
 =?utf-8?B?YTlIWGVPOEs5RXhvRDlteTJBWkovVk1sVjA0cWZ5WkZmMklXMXU4cldZTHI3?=
 =?utf-8?B?YnJrVVREa01CK0gzUjl0bDBDY0laYmgreFZFZWtiS0VYSjVESDhMTFJPSzVv?=
 =?utf-8?B?bjZ4bU1neUZiZHYzNnFNL3EwUjcvcWxyQTQ0ckZRRGYvQWFjc1NrT1V5c2I4?=
 =?utf-8?B?QkJmMGNHK2J6VkVwcTVhNXJMdVp4N1B3NWFZK3FuRXgxSE1lbXpBUm9HeFht?=
 =?utf-8?B?NlI5bGRpWkNlT2tHbUxiWFNxRjVGRm5nV0xya0RqQWhnZUNGVFZmS3c3RnM2?=
 =?utf-8?B?TlZydms2ZElDalVvQloxalBzZGtqMThSV1pnYW51YmwyUklobmgzTmk0dFZ4?=
 =?utf-8?B?K3hwU0xDN0pDSENZRmdPQi9FallBeGJOMGZBWE44MlhIY3hZM2VVTkRoR3c1?=
 =?utf-8?B?QUgrWXd3OVpqQmhkUmx6cG4xS1NuMVJlNGIxdlIvWVpMZFRpbFZEUkVnMkhF?=
 =?utf-8?B?cjR3ZEw4RXkra0YxeDIwWjZjTGdmQ0ZyMUtXNmlNNFd6NTE1ay9rcVZkK1FB?=
 =?utf-8?B?ZGZva2J1V2U1UHZKTzgwVWxmYkJFNnp3NjJqL1R2MjVhOTd4NXhGSitxdHpE?=
 =?utf-8?B?dHVMTndFemxNb2NRd01IajdnTmEzcHNQQkJxdDFKckNhMkx0ZXBMaHpCOEhW?=
 =?utf-8?B?RXhub25PcFVqRnIvRm03SW9GVmQ1emkxYjRIdDJ4dG50SjFGWS9QTTRxdXBz?=
 =?utf-8?B?UkVyZHhETGFmcW9RYVAyanBPdFhkQWczWnpBYklSVnFHNWVRSW1VVFZUWWJP?=
 =?utf-8?B?MjNzZzN4VnNISWpzSXA5c29Ic2p6bnpITVhaTVBVaW0zM05qc0NkQlRURkFM?=
 =?utf-8?B?anVJOGtHODBSTWgweFIxMWNVTk1nVlJIaE1SYk1tQ2JaRFFYZXFZVFBqYW5q?=
 =?utf-8?B?Y0IvUjEvUG5KclZKL011a1cwV2xCYXB6RGNBSFFiQmRKaUcwV29uaFJxYk8y?=
 =?utf-8?B?WVlKTWlFMmZaa0YvN2I3WUxMQzFvSk1ab0Mxa0hod3k2b0N6dEhyYlRhZXJO?=
 =?utf-8?B?MGNQc2Z5Qk1iZi9admJydTNjY1BmN2d0bkJlZ3hpS01sMjdZWG01aE1aZDFa?=
 =?utf-8?B?MEs1N09TL1c3dUtCMm9VZ1JRY2VERnd0bUNOWitJS0pmVk9IZmlZVmdaaC9W?=
 =?utf-8?B?blZqdGhtY3FmRUlUSzdkMy9GcnlMS1dPRWVWa1I4QjVMNzBQWGQ0TTNNd3pQ?=
 =?utf-8?B?K2UydkpVMEIrVmtNZ2dRbk5oVzg4NjkxRDhRbW54N2ZaQXBSRmFITjVkNjEr?=
 =?utf-8?B?L2xJTzN5SGV0YjJjNHdURlhnQ3cxV0haN3ZHeGpVUzFlOWRpdjN0REg2V05F?=
 =?utf-8?B?QWs1M0J1UmxMS2lwb01RYnQwb29RZXRXemlDZ1R6OEh6WjhWN1p0Vkg5WGQ5?=
 =?utf-8?B?VUg1R1QxaGhZeWhaNDVOT3Ftcnc0L0N2cmwyaXhtbzcrV0xrK3lFVkl4M3pT?=
 =?utf-8?B?djE1empnd21LYmNNazVGZnFqNHVnK0RNTmlscS9UQVRWZTRrTEUwdGF4cWlD?=
 =?utf-8?Q?9YA3UkHzv17q6SHqydCSzljtD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Q8+Gq5gWjPqLzXSHraSGQynuWWucOlNe+DiyWET3mMDTTVSunv8CZX5CN6zjoxTOxO9x1KLXlnhK8QhuwGtDqxvlKxVpUokCQdcLlw9So7mM28gw8zNPxXgLgIluDz/cDbcPgLogl+kc0HFC4wzroIjdwDiCPLr7PJfiGStShjTQyuJFl6mSv/Oo51IsMhrMd5PPPeu45dYD3CMsxhJBrtixYxkXGyecu2IeNoFmM3/YEI7DXf+3TyAVxsN2QjVOwst35P2EzXfn349Ny7o78UJLA+fYpI74Pr15YjJaPXHGbMQlRebOS5bLOgr6I9c6ADp0ZMloeG8NRDDvY87bSYtHCAyz6xh173C7kc+FIjL2J4J6SQcQRo4FhWhiOXRb5VXMGda0tgKkcZakUxOQYbSARXAGWM+N1015ogyUHXgI48GrMAaIjjjDfChDyuYH7fGINQYPHJJxez3vh4AECApmVqPMgL+0SbaJE+/3KGnYtXdYDZs2+uyNwE7HZRtFKFY21d22xSLNVnIFUjBJjAN9J20A/PytX2nvlpmjV0YUot5hd7ROhYqn6dQ8LB5HahGzs46QxNulEXKc8HkWiAcY5Aq/ezX0EiwQM+/FKYw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8024f6f-27fd-444c-fb38-08dcf462492d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 19:30:15.3014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOxrIRtZbxWn5SlFDSn/5OXh6gh5h8MvsvmZ4D6OFg1z0GQQRBmUUbpnHi49iS5EO4dQRGlBZo8K0nvnJ3z56Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7262
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_18,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410240158
X-Proofpoint-ORIG-GUID: m3FPUpLKPYah0saOJLrYrDEvFe--PJLS
X-Proofpoint-GUID: m3FPUpLKPYah0saOJLrYrDEvFe--PJLS


On 10/23/24 16:28, Kris Van Hees wrote:
> On Tue, Sep 24, 2024 at 04:25:54PM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> In ignore_clauses, for an underlying probe uprp, we try to
>> decide if we can safely ignore clause n.
>>
>> Meanwhile, for some clauses, the probe description tells us the
>> clause will not be called for any USDT probe, regardless of the
>> underlying probe.  For example, "syscall::write:" can safely be
>> ignored, for all uprp.
>>
>> Add a dtsd_usdt variable to each statement to track status:
>>
>>      USDT_FLAG_UNINITIALIZED  not yet initialized
>>
>>      USDT_FLAG_POSSIBLE       clause could possibly be called
>>                               for some USDT probe
>>
>>      USDT_FLAG_IGNORE         clause can safely be ignored for
>>                               all USDT probes
> I think it would be better to use the dtsd_clauseflags member for this.
> You can add dt_stmt_set_flag() and dt_stmt_test_flag() (or similar names)
> to set and test for specific bits in the dtsd_clauseflags member using
> DT_CLSFLAG_* constants.  You should be OK with just 2, one to indicate
> POSSIBLE and one to indicate IGNORE (neither being set obviously meansnot
> yet initialized).
>
> I don't really know what symbol names would be best... perhaps for now use
> DT_CLSFLAG_USDT_INCLUDE and DT_CLSFLAG_USDT_EXCLUDE?
>
> Main thing I would like to accomplish here is simply to access flags on the
> statements through functions rather than accessing them directly.

I'd like to push back here.

First of all, the patch exposes only dtsd_usdt at the dtrace.h level.  
That variable can hide whatever it is that USDT wants to do with it.  
Your proposal would expose at least USDT_INCLUDE/EXCLUDE (or 
POSSIBLE/IGNORE or whatever we want to call them) in dtrace.h, and I do 
not know if future USDT would have even more stuff it wants to play 
with, meaning even more changes outside of the provider.

Second, you say the main point is to access flags through functions 
rather than directly, but to date we've been accessing flags directly.  
The set/test functions would be new.  If we want to stop the direct 
accesses, that would seem to be a different patch.

Thoughts?
