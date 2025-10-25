Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7AC225A3B
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 19:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761418967; cv=fail; b=FHgiJLUK8tybWVnaPbnCfAWecSDtrLvuHjSznStls6RaRjehXRvlzZgmtQmGg5hod3OWnujEb7dZkKhTzB5hsypBNF3idUEundy9S64Gnzceua6YfByEj0xeDOOAlCt5C8Yt21xO4D59fe/t3EUYSXSBPTaT/QJU6+M3Pew1k68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761418967; c=relaxed/simple;
	bh=cESv8LL0whuMvEmJsfiGm5nroWQWaXhvDLjaWpHj0aU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R7d3s9TEydxTWlus6kgmQ0cPMWOlyZZ8P0V8F1rTY2TLw6yAQ/bWIQzlIP/PoIgGyHb4P8BJVhyuyiYTvv9X0XwLDK5F3mQnqK0lmRUrAITwsh8F3CescuZ32xPYT0u3yT1ZhBpZHInETE9hKtCDlroJkZ0JQe5+qZhrNAhe3wM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QNpYPtoh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gKxqgSw/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QNpYPtoh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gKxqgSw/"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59PBDblt009505
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 19:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=eFMvPLGbppVdYCzXQ8poJAonPyIoK4kQq5Cz6hlgcVM=; b=
	QNpYPtohS1Ij66kDeJNgPyhSSvKDNjFNCT4nBCy0C8C8actgYyOW5r5gDgEapVT8
	NT5wSwb3c6o4OulmxGBbned5wLnu5kWQkjjlXC1x4YE1nFithwpjqpMcbE6ECxvO
	XxqdgZ88xJCLd3q3XK6w6yXTZxC68mBxg1XAmcbMFRDBOxt0QcZ8DMYTIdceJxz4
	e5L/TN1/3/PJv1AwASHiI9zWh781c6y74G4PyTZmoZL7ICwblubI6VWA/m5La3RV
	XC/RuAv3ngnfs6mOgxx5WkW4BhJYK1EtCs+ZVyRTyDLXaM6I+2gykZBXbWR+JauJ
	U9U5Q1IJvQrp+pyy3SR5IA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a0n4ygstt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 19:02:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59PI6QYW025068
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 19:02:39 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010003.outbound.protection.outlook.com [40.93.198.3])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a0n05pgjv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 19:02:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtivQgbRAa9t8aMeEFz6xJ/1VmS1OjOQGvEsruu/IMTyd6mRazb1tNPlTcOpZ+RwPviiPtoyGCELRCKKeQI3lfsAMg9fIL98rdxQeG8w67XhbyYruzT3sph7SGdifFvb0LDQbpqIhvLTChu4WF5HAfm4zrSZbE99KtgdK9eJtepVIEGY2KQUxNSoDDJU1iJOU5+Ef1KxECj0LnkfuqAiSNVgUDw0/R44WzovvOLBu8FvEFzwzn7YS0VhwL5Qnzex4o28A2l0wkz5q26Kjo57fQKye8fETK6TOjFxnr7oGw42RVrlKS+3tjy+wYIPRnYWQwsK/iTd2rBRHpI9yxekkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFMvPLGbppVdYCzXQ8poJAonPyIoK4kQq5Cz6hlgcVM=;
 b=Kvk6uMJBGVq7oVQLwqtg1n43sT9RD95U4HfaBou6Hqjr+PLH+dgHAlVeNdt6kvcsjESXxPZyQxAAJEUKa6bfAg2wr0i9Q3dDqbTciV2KKfl/AYXEJZfHq4flN+YarOL6IBgVIJ61am2eQ8zBSBtP0BXU+qBTCZfEo5ny0an8hWre+i+zCyCIY1k8Ux/mtz8tr8AnqM5FmQz3wUZcEGmip+vtPHHXg3vhXYuLSAi9PvmnB69kuimAEX/WFe2zmfli5ysVNpTl+mxPkj7FgL2DBYFGoF95myBd1ov+TkckEKOpdsqVJaCTYMUYvo9c36wS/6Ea3LMWkWdE0KErOZ+5JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFMvPLGbppVdYCzXQ8poJAonPyIoK4kQq5Cz6hlgcVM=;
 b=gKxqgSw/EPayPhC+iBR48myxjMs5l0UBSit/hS9hxJjtFfoGmXKMe2ud6y1jSbnxgiyp3OaA72cQSZ7mxuhPd2+MKYcMvy9U0A9oCnh1XOjYAED4u/sQBfT2ZPpgLccOy+cVU3AMurXnP0YHPioIVSLwYZ5CSj56mCTKxU1z7cU=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by BL3PR10MB6065.namprd10.prod.outlook.com (2603:10b6:208:3b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.16; Sat, 25 Oct
 2025 19:02:35 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9253.013; Sat, 25 Oct 2025
 19:02:35 +0000
Message-ID: <9d62707e-595c-975d-3674-cbc172ccd32c@oracle.com>
Date: Sat, 25 Oct 2025 15:02:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] Bump up the version to 2.0.4
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251025034446.5894-1-eugene.loh@oracle.com>
 <aPxPZG4QJkAwS7fu@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aPxPZG4QJkAwS7fu@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR15CA0008.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::27) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|BL3PR10MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d1eb39-ec39-40fb-662e-08de13f90f1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWdGd0lXY2ppcy9XS3ZBRnZzbE5WM3RBK0craU1MRzBoVDg1bzJHT0U4S25V?=
 =?utf-8?B?U0dHTC8yRTl0K1dVeTJZNERZT2pMa04zcENXM0NLaWRUckorcGFkK0N4RWh5?=
 =?utf-8?B?Qm1jYktCUlhpZU1nWHg5c1liMDFnNmR0NmtDOXpFWjJnU0FEYk52V2prSkxv?=
 =?utf-8?B?UGRjWVhtcFo4SlpiTnFGZzhqY2hmOC9YaDU1ZkVPZ1U1UFloVXVQY2c0TmtS?=
 =?utf-8?B?dFZGekgveXJFbVQ2OXpwNHl4dndTTDQxbHhrdi9KOHhISlpKNUwyNFBmQ1E1?=
 =?utf-8?B?OGZNdlp5eWlVeEswT2luUWNpZEJXRDZrdVM1clV6SE5ScDYwYTg5RWRWc2RD?=
 =?utf-8?B?UVJTb2VXQzgzdHpHZGZFUmdYTXZnNC9pbEx1ZFdUOFRXdFVlbmJCeklUYUZ5?=
 =?utf-8?B?bTFKZnp5aDJBcVpUNG5MbjNvZUpaZzk0aGQzdEx6ay93eXdTMmhqYjZibGZx?=
 =?utf-8?B?eXhxWDhaTVdNK1FkVEU3b0oxUlNEVjhXY0RVVFVxVDFEUGtZMVJ4aE80ZUs3?=
 =?utf-8?B?MGdLR1NJTXZMM2ZKTm95RS9jeC9PTU1PQ0loa0puc0RnV1NRZkpvRkQvSHFa?=
 =?utf-8?B?eGZZWHd1ZXFHN2h4R1dNQ1MvdUJRSmxtdWhvcXQ5N2REdGZCMElQaEpTa3kx?=
 =?utf-8?B?b0pMS1U4K2lZcHB3SmVJUHNQR0NHcTM2YSs3NERpTTg0MkZwdXE3OXRyN3Ey?=
 =?utf-8?B?cjVMd3JjVmZEeDN1cFRQM1ZYK2t1RGtBRmY5WXlFSE1PNDhCNHI0MzdQUTZZ?=
 =?utf-8?B?ZndEWVg4WTRMMVpxY28xb2ZuYzlialZaZVh5bWtxQnIyNjA0LzFZV0FSVXNj?=
 =?utf-8?B?L29SeThqZHRrZkJQbWtXWDNMOXV0bTk0aEdWdnlnK2NQMnBBQWh3cGtLUkZm?=
 =?utf-8?B?RjcrOW84V0xHOGRYSTdMYnFlTXFCYWw0dk91T2E0bDh2blRBNm9KSlY3TEV6?=
 =?utf-8?B?b1BXSVZBaVN1Snhmd25ZWExSL2tRSG40bGgvSVNOVGllenVPNUJDTVF6SUlB?=
 =?utf-8?B?M2xOeUxYRjd4dXJqSEFUeGl6ZGhqVXYvdVp0bmRDcnRBSSswbXg5ekFkZlZ4?=
 =?utf-8?B?MkM0UGMwbnBoYlNPeUxCSFpqTWFocGIwOUJFK2tNMVZKSlNBMFk3SzhKZXJY?=
 =?utf-8?B?VUhDNVJTWlBKYnRqR2xiKzdMRGVvTVRxZzZROHcrODZOK29BUnhuUC9BOHMr?=
 =?utf-8?B?SnQxYlJWM1l6S1Rqakg5cVIyNUVKWm9vMFJxODVCdnk2eDM4MUlxTytRT0R4?=
 =?utf-8?B?MkhxUTk1cVlScm9iNVVRZExUcjlQcUZKSzhab05LUXZ6NzN5bDFUVW1HWHY0?=
 =?utf-8?B?UUZGdkdrcHphdWFyWEVHWXYwTm9ycWg2a1djUkF4TVRvK09FMkR4UHpiS0hR?=
 =?utf-8?B?dDFueTF1akhaMUhSWGxBY2I4UHY1bTJobDhwanNVY3dZcTFmbEh5RFNpekho?=
 =?utf-8?B?QXVvSXdCdEY2cWwvSGlUS3l5T3RyTDRRdko4WUhrdzlRWjEvSEdCQ3FCSlc5?=
 =?utf-8?B?cngyTmpIeUVPZklXTmpGVlJYNzQxQXdRMDhFZWUxUGtNMWFrOHROZERUMlZ6?=
 =?utf-8?B?ZUhCNzVETDdmQ05UeTVoWDZLL1prc0RXYzFXaGc1cFpQUm9Qc2x1aitQZHZQ?=
 =?utf-8?B?dUVTdHYzbHQ2MWxndTBQRmJYNnVxNmlyRk1EdzZSN0N1dU5Xc3lnMU10YnJw?=
 =?utf-8?B?WHNBWGRvWWNmRlJRcUJONkQ1ejdUTXFVMGhnQmZwZ3hxUUxlc1Y5Um9ZQ2xr?=
 =?utf-8?B?Vm5ZRUtoVlRQUlN3bTJGSEZ0TUNvL2tYVjFSaUhqcW5JL3BoejZDdGw4NFls?=
 =?utf-8?B?bWhnN2VaRnRpSkd0VkdsOUFnOGttUlYxbk9MSHdRbC9HdWc0dU1RWGdNWlJu?=
 =?utf-8?B?MTU5VjVnSGQ1UGFpcVQxRnE2OEJzTjBiT2tsNEpPd2tlSXBhV01SNXpjR1dJ?=
 =?utf-8?Q?tJ5wU00HsFSaGQLS+hN214wUcPwwgUNP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OExtRVBsN1NjN25NL2JTY0p6ZVFqcTJYRWpmYnhQcVZ0a1VyVzg1NHJoUDZi?=
 =?utf-8?B?M1JiaHRqV0lMSklIeTQ5bUhBcmZRbS9YMVpmaGRnb3FWMm1rUlhWNWhkWFh4?=
 =?utf-8?B?K0tnWkNqV3dsczgraW9wYXkyOU90STdJb1gzTC9CakMxaXBpYkwyeUhzK1Y1?=
 =?utf-8?B?SXl2MXZuU2wvbWgwSHVOcVhvaUxtcU5JOUZWV2ZnTGROTHFDdXp0cW03M1hT?=
 =?utf-8?B?RC9VYXZQeHl1Ty9Ldmw0aTdTNDh4bUNYM2x6dkhJU3QyVmdCbXc5WlZjS2dB?=
 =?utf-8?B?Z0pKeUVxQTVZWGFWMW9GSGkyN0wrdkpzVnRrWnFOWFFOZS93cmJ3Z3pIMldT?=
 =?utf-8?B?dVljaFo4VjBxZUkzMTF6cDdFcFhXRUpXSURkUzVvU2plVEVKeldqQ1BTZUxz?=
 =?utf-8?B?NThpNEEvTWpiYzdWVytpa2ludlFBQVc2Y21xUnRzN3pNV01mdXp3Q1g5aG11?=
 =?utf-8?B?MXArU0pRUjlBT2VyQ2h4WWFnUXpXbmFiSE9pK0FyK2pURW5xRnRTMVhDR08x?=
 =?utf-8?B?MTAxN3dFU0NFNXRraWc1YXZXaHJRa2JWNS83cDh6RDV3WmttaVVtSXlJOFpy?=
 =?utf-8?B?MVlOb0ZXVlhhbDNjOG9XZ3ZrNXhycXI5dnVidWo5N2UrWWR3NUltNkFvUUZ4?=
 =?utf-8?B?R3lWRXBGYzVCQnh1U2E5ZGg0UFA1VlNQeHl6SmVJeG9MTlRybkJhdFhRNTBV?=
 =?utf-8?B?MHVQdjRvN1FxRTRCQ0V5aUV0RENkeVBXVlpYVVdYTDRBY25DSDdpRlplZDIy?=
 =?utf-8?B?S3c1UGRNWEQyUWJkc3ExYlEvSFlQOXdYdUpNUkRySVVTaEh2REZTcEltRjdH?=
 =?utf-8?B?MG5rY0QxeVMraWwyMllrRm5MS0daTDZydmNEdUVyWjQvZU1sUnJUcnpjeFgw?=
 =?utf-8?B?SUVEMnJSSUlNZTdCT3g3R3JuL2llVU5pRFlmYWNFTVBGYUltMXFybEZDMEoz?=
 =?utf-8?B?YUlNU2JMem9xMFRabktwSGVoOEtERUowTVE2QloxbDMra201TWFFVHRmaW5o?=
 =?utf-8?B?VUo1MjJaOE9BQStiQkNlSnhHaGJWaE5iR05POTZmTnc4MkdQZVlSd09LSms4?=
 =?utf-8?B?NXh3WGdCdG1VR2E2ZmgzVFFkc1BES21OMHVjMjU1RUx3ZjNrOW9VVVpMSVMx?=
 =?utf-8?B?anZlOUp5QUx2N051eGdJQUIxNW8wUU02MUxtZjhjT2dXRmZaeGMyZnpCNzBD?=
 =?utf-8?B?U054ZTlEREF0UkpHbm15ZExSdzJMdGFTTnI0R081cDVNOFhIZi9IcjkxR1ZK?=
 =?utf-8?B?aHM4ZEFVNXpvVHhpUWFSVVd4bWhydFBQMTh6UGU1T2N1aXFnayttcmhyUXZ4?=
 =?utf-8?B?K2VVcjJlY093WFNGUmRnSURKWnFLa2preGpaUExvVW9wY2JrTklGbVZEZ3Ji?=
 =?utf-8?B?VlBUWTVQMW5neGdaWU1OdjUwS1NpZGFhSGhRK1NpbERZZ0twZTB2eUdvU0JJ?=
 =?utf-8?B?dTA4TlJGY2JKSE9Va21TdTVQTE1nZHFhdTZTcTFJMFZGWDBnUUpCWUNjRzZm?=
 =?utf-8?B?ZGgxczdIdmZPT09ObmJIeGZtWURDaWdKNnIwRHNvZFk5Snc5VTZoTDEya0gx?=
 =?utf-8?B?WHkveUZFSitJL205ZjNuVWVVZ3RXd0VCTTZ4cGd1aGhFMk5CUjl3YVUwR01m?=
 =?utf-8?B?VEtOVmQ1S1hJdGp1VGR4NjYyckttbG0yWTRudC8zbnF6eTkyNUJMNmxteWRP?=
 =?utf-8?B?Y29abzlCRFBDSCt4MmFwRWZmUDhJWTFwbTc3eEhwMGRtQmVxZGZnUHpXd2Fw?=
 =?utf-8?B?SXp1Smk1T2xKUjFFc2k2NWZhZGllcEYwTFlHSVc0K3ZpVTd5aUZCOU5oQW9N?=
 =?utf-8?B?TkZNb0FkTUVyLy9TWTd1RXVhTVBvOXBmeFk0NWhoNWhHNTJGbFNMYzRwelIy?=
 =?utf-8?B?UnNqTTUwK1pTTUJzcGNQdGZpckZqN0JoUDNNMHE0U28wZ0JVOStzMHgzeXBS?=
 =?utf-8?B?aGp4YVZuVkx2Um9BakVLWC9memtkMUhFb3BIeG5zQm5KaGlsd3MwajBzWklj?=
 =?utf-8?B?ZUlDWDBTblhEWW5pYnp5OHNGNFNzMVFXMGxqTFREQktKeWhUWnRnRmdDUXBT?=
 =?utf-8?B?cDRIYnNsbW9xUnZNU1RtLzlGM01HN0RySlRaZ0h6cWZmRE40SkJlekI0S2p5?=
 =?utf-8?Q?aD3n58uBwkxwUFX2jFJFc5LX9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LfOJ5U/xhlA2BT67ORsnqt68zj/pDV4fRnhZHVprC082k73oIceEhLj8HF6N80W/OB341oR3B15Lo+lEbRiLIInaJKEH5o9BOvbtuOh0uDw19KD+4NJ4cyE37nv6R3KPITtu4K0WZh3ecmfCbb8OjjHOFAayGdtGTkyRgTHMJouEEvx0qn7QY8VeiXWFhdOj+QWLP3rowtL4zkymcTt8mvQQZxCZumKCgzmSF5GjI779QN2nI+oDCYuQOdx/UYzsSeUeFCMLAIe3siQFyglDSi2m9w3xcv4QsEFDZentjAvFJLKtymzxS8CWNoqWU/3WvzuOYQq4h5Pifcid5Gl5SLzbmKIg3ejK8yowDCtEcQyN+jnlk5qOzTOU+LhQ/s+krGjpyRvyzGZgcKr7yLpZ/RJl+aEDdAgeHkSZNDg/Mt1Lpl+kr2VP8+lEg6fcZA6nbVYWgHBVRCu4VSheb6p+P+LfHvANVRJ2IcDN7lyOAQHX883+nOznztCkbucREGbYmxt4ABA/7MxW81cZ0A7pj9fRmhjJ2hrVAiXu4ZG2KzmLX7snQNmPePSYmD8esPOxRfU2UtA2NrP5oJJfvd7xd+017ZieXO+y9zZq+p07bYI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d1eb39-ec39-40fb-662e-08de13f90f1e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 19:02:35.6242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRnI1qpobqhmEWukiwI+GnTDcNYLwVBinNEPPgMDVpvVUIKGMsNPCx6BNA7iZUzQZKwQL+F5v91g8QmCifbxfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6065
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-25_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0 mlxscore=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510250174
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAxMyBTYWx0ZWRfXyUxx8dsUJXtO
 HGlQbvnW3pNVnl9Bonm11QFvFPsPLTVf6m67MclL6WRoBCUhELs5T46uRW+7gsjjDhs0ea/kLJ5
 JciOxFF0ik+SiUnhQs50XyR/9is276CLRgiNL3rvvWVhhJi/qi8H4N08YPKrHJrYxw5UE/a0CWX
 7OMw048zO1qzGQBBOtRto9zIFYm2BUKqF9X8UmVAV/vdhCQ0sdACh/F36DEYe/MLdzDq07cjuFL
 fl1UO49OWj8opTpPJSmH7jP3GznA8lCNxxQ3EqCe6zJP9FMVUD3aptr0BGv5hR6J/mzI606L1pw
 KxVyMN4PzNwBIy3Kj9v9Q/v7akVG6uf3x06bg2x0UxPhYdyazGfLWRV1IW4N3uWPqDv3qInqcpo
 cHozJhZV6znMvvXdwOev1RqtAiM9tw==
X-Authority-Analysis: v=2.4 cv=Z9vh3XRA c=1 sm=1 tr=0 ts=68fd1ecf b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=-7kNcYVUq5IDa-sUQtIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: zGKxrSadPqIIqtB5oMcFUNYCMYJjxvD3
X-Proofpoint-GUID: zGKxrSadPqIIqtB5oMcFUNYCMYJjxvD3

On 10/25/25 02:05, Kris Van Hees wrote:

> On Fri, Oct 24, 2025 at 11:44:46PM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Note that test/unittest/preprocessor/tst.predefined.sh checks that the
>> __SUNW_D_VERSION preprocessor symbol is consistent with the "dtrace -vV"
>> message, and both of them simply use the last entry of versions.list and
>> therefore will be consistent for in-tree builds.
>>
>> When RPM packages are built from the .spec file, however, _DT_VERSION,
>> used for the "dtrace -vV" "This is" message, comes from the .spec file.
> This is actually not correct.  THe value of _DT_VERSION is always provided
> by the GNUmakefile, which takes it from its own VERSION macro, which in fact
> is set to the highest (most current) version of DTrace based on versions.list.
>
> So, the version that DTrace reports is always provided by the highest version
> listed in versions.list.
>
> The version that is specified in the spec file is only used as version of the
> RPMs that are built from it.

I'm confused.  E.g., with the 2.0.4 RPMs we're testing:

$ sudo /usr/sbin/dtrace -vV
dtrace: D 2.0.3
This is DTrace 2.0.4
dtrace(1) version-control ID: 1ac1d4aaf8fb2ffa21187eb9e5227a487f7fcd40
libdtrace version-control ID: 1ac1d4aaf8fb2ffa21187eb9e5227a487f7fcd40

The "2.0.3" is _dtrace_version, which is DT_VERS_STRING, which is the 
highest version mkvers finds in versions.list.

The "2.0.4" is _DT_VERSION, which, um, okay, yeah, is set by 
GNUmakefile, which I guess gets it from "mkvers -vcurrent=t versions.list".

So if versions.list was missing 2.0.4, then how in the world could the 
RPM build report 2.0.4?  Where does that value come from?

>> Append a 2.0.4 entry to versions.list.
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libdtrace/versions.list | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/libdtrace/versions.list b/libdtrace/versions.list
>> index 8986d2007..8d858f0bd 100644
>> --- a/libdtrace/versions.list
>> +++ b/libdtrace/versions.list
>> @@ -65,3 +65,4 @@
>>   2.0.1	D API 2.0.1 Linux (BPF)
>>   2.0.2	D API 2.0.2 Linux (BPF)
>>   2.0.3	D API 2.0.3 Linux (BPF)
>> +2.0.4	D API 2.0.4 Linux (BPF)
>> -- 
>> 2.47.3
>>
