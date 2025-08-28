Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7CC7082D
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 00:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756341480; cv=fail; b=miq816dtl+8wqp8OCJZ8jtdWXybxuX25WNjsWf+GmZrhG+Uz6MaqajDuG4imSV6wkNEPDO978HoJ+2wZRu9Q/aQRfvbZvGDeNLu+un1XVK6D1WWGmQecICIju2vLv4FPK1+T2gDPVwumIICDaYvMnj/hvPBPEq9XL0857ClVXaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756341480; c=relaxed/simple;
	bh=TseBpKo/4WcBHvQRUXbV2cBfekgMAwtXUGtLKpidtaw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GuwBo6VMBSsjHL1Tnbtf9SRDffzhYyV8Mqi2KmbmA6XL+oeYGfsGgv53r0o2bI5yJGkNlr8jnS6Eti/9H4WfkeA4E2KfvW1wl0cVLJIfuXEH8qqC/F0kXD5I3JoS35+9gM3BAnUtB7gv1/mLqt2aqIkRFJaP4JcxgBi7C+K6/hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QJE2Pkh8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Xlg6BTDm; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QJE2Pkh8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Xlg6BTDm"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RLHFcG003637
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 00:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=JX7vgOnE7lXX12T6FcCdHtNLCSp5uNQV57jtxBR6vWU=; b=
	QJE2Pkh8zBneZBMvtbVaWq2YjL411j/nx3EDJkjxApZP3aNTeac4GzAQ/z6kIqYa
	luy09M3ZpiaFakc6HH/XCKnUUp5uyj7mCj1xiM6NPrd77iLIj3oBZQtZs0YCH+LB
	6xlpOi26haSph68f7RP4IaPNQ6T3OowQMNXnVAj8S545cyCP0o8cw/SBRSJTkiCO
	68laUheYXuiekrjxR4ANqhkhG/yyotpkBX9eLqJuGPb6UhZaH+s04TWaJqKL0o8O
	CEqQwbzRnhhG9YOZF2N4oGyEHNmFbNCM1Nc6e9Wxsdw3zhyHf6QmRe5MA9lqyYSR
	JQ+1ZIlsEqMXzhteHQvg+Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q42t7ckt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 00:37:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57RLs0GE019697
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 00:37:52 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48q43bbdcq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 00:37:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fy0x9qxxs3NwC/4JoHOxfP/96DXElzLgfLGy3xY1aWbJnpKdk/j5jP9pg0sYXreEBWzMV5mVEVXDUYDR6tvwqjU8Oc5GKgZAtjY+6tBfVEJXCt9yy+uMDXjRl+yi2p9m5daCbW0XaWCvkunDsY9h1dnJdkwXDT7fEAwo8w+5XfuFhyog1RT2sgaaBTHJRqdD7IjFer08E68kh6VkFAFE0wR4lCOrXwxk3CZg0vj3nP//EiedIjFrWRMQPMVmBqBK+VCjISaqILQ+Q4JMoUyEJ9yntCXjRxOUDRmSuKslJ5+LlhSlGj5Npcyn4/Eien480b8VLtXfjeotqfSOK947Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JX7vgOnE7lXX12T6FcCdHtNLCSp5uNQV57jtxBR6vWU=;
 b=PNtIZB6WzU6PDM4pvGzESzt4bZxotsE4B66UnZISCy+z2XIO2K/LgPmsRGwldKP/aSlTk2iTkJI1NFk3xe8teESLjMiIZB6j3XUNZRc7cnTmEYYZLVVNLL1ZWufTKZWpxuUKinMaQdwq27Nk/0QsvH13MZwE+IvrXUIP1aedj75celli6E/r1c41MtxXTTXpVCRqcLZBB+Wec+kXC5WZ9uIg4c1XFITvYI8DRfAfbh7o8sTXUVexHV0NRKa86KR1oPO8sjDDn+wUsess8UimOHAmBdhUTV4eRU9/p0sCmq9QWFJqV7RNAPDPZoT4dJjt6N5p4QmLdh+zkGToGFYlGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JX7vgOnE7lXX12T6FcCdHtNLCSp5uNQV57jtxBR6vWU=;
 b=Xlg6BTDmbQ0Rvr69aV33PMliL83xSxAueXemxZTodZcAYmsD8FI2fG98FqwSV0OQRNrCtKFJqfbvriHRmbSk7OdYz6PSQSpv6lPwZrim1bVzgQCcI7DGZpcKA/0OC+RQxoaEXyyEeWjSu4VxpLg4efb1dmso/iw6mhff+oZ4i1g=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY5PR10MB6072.namprd10.prod.outlook.com (2603:10b6:930:38::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 00:37:48 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 00:37:48 +0000
Message-ID: <380de1e1-17ea-6dbe-55b3-c2166222ebd4@oracle.com>
Date: Wed, 27 Aug 2025 20:37:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] tcp provider: support tcp:::accept-established in absence
 of skb
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250826131202.632027-1-alan.maguire@oracle.com>
 <99dad3aa-85e6-bd8f-cf58-0e787d8a1d57@oracle.com>
 <701abf39-eae8-46ef-8e59-5acda727c376@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <701abf39-eae8-46ef-8e59-5acda727c376@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0646.namprd03.prod.outlook.com
 (2603:10b6:408:13b::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY5PR10MB6072:EE_
X-MS-Office365-Filtering-Correlation-Id: c4063845-2718-4b9d-ab39-08dde5cb1c7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTJkbWVmOTdUY1lyMlJKa0s5VWtTdjNwdkNyZjNPUE5nM3d6Tmh6ZURSNWpG?=
 =?utf-8?B?cXdiMUlaUDdiZjF6My9zUENxckhVdG13bnI2T3ZCNWYzSTF2K0xZU1puMjNL?=
 =?utf-8?B?dUVSVVI0RDBkR0JwYzFjYld0emdGWVdLdjVzbG5rTTlRcjJmNktnZ2dtaVRE?=
 =?utf-8?B?NVoxODVxNTBOTnpFclRBY0xaR1ZBdUZlY0p1Z3RXZVJEZENsSnVKTjdtMkNG?=
 =?utf-8?B?blVRZWFPQW1WdDVpeGthYVhVd2V5MGp0VDlmRHdGcnhHSlZIalM4aXNCOS9H?=
 =?utf-8?B?Nklzc0tjSFFsRlE1NVFHZlovVUVHeks2Uk5GQWhLS2dnbVZPUkFtcGtHMjdx?=
 =?utf-8?B?d2ZQVklmaS9FdmZWaHR0blVYSVFZMWljSERyRnlxTk45WFhjWXVhV1liM0pF?=
 =?utf-8?B?YlF0QzhCMzd0aTRVNkp6QUVRMU93WmI2bW1vZGRmcVc0UVhGeGRDWUhpV1BV?=
 =?utf-8?B?VXh6QWJiTzM2Y0FxY2NpUjd2eUh4OThGZkVTTmFTRlRYRWoybkZMeWxqNE1U?=
 =?utf-8?B?OFkrcnBnUmY2QjNqQjBBTVpYbUFKbm15TWRQei9KbVpwQnZFSkhyTnlQTzZH?=
 =?utf-8?B?OGJYbU5LQUhIbmgwRlRhb0ZvQ1NyamFiUHFtQVBva1dmMjZWb3lUVHBSU3Vm?=
 =?utf-8?B?RWtyb05tN3hiWGFlazQ3RzNib0syZ1cvSmdrcFdiM1NiWWJ3ZzV5eU5kVGpH?=
 =?utf-8?B?QURNUTVtYkNpSGZyZ0NHdTh2aHhOYVkvbmZ0Y2xNK24vR05RYlRielhDdjE3?=
 =?utf-8?B?R1VxSEhPd2dJRU5OdHkyd1o2bHJRemxDZklUQjg5NURDQlhUcEp5blpvRm52?=
 =?utf-8?B?cmxkSGhUaDE1V2JTTkpjYlQ1TThtdTBSRXdFQlRaNTVYUTI0VENESUovK1R4?=
 =?utf-8?B?b1g1cnlyQjR5REpyS1FoQkZvK1pLb2tiREdEZGtaL0MxOHg5cnY3cHF1Vzlx?=
 =?utf-8?B?WFpIMlVBckZTSDFzUng1cWhsQmV3a2FtL0xwZ3FsTVVLelBBdHZxa2Ewc0x5?=
 =?utf-8?B?dXhUb0pzNXZWYWtQN2NnS1h3aGlmYU52VUJaV1FTVTNiQy9VUGZRQnJ1cVhO?=
 =?utf-8?B?cTNLczZncks2TmE3cnpmVktXV3A3Nm9neDZIcElXMGJvRU0ycnA0QmVBakFJ?=
 =?utf-8?B?LzFYTVVnMnkyZUNlekJuL0JwVHNLcnY4eVpreks1bkVHUzljS2htenlKMlFZ?=
 =?utf-8?B?WDJSc3ZaZXRVWFZXTGNUV1ZiRVBBNlVtOFd5RVZ0aFErZW51aDlmbGlESmJG?=
 =?utf-8?B?TTZlSUhnZ0krT1NrNFdkV2tYcElUc29MaStTRFp0ZGFGQmo3bzl2a2xlM05W?=
 =?utf-8?B?NHlqajg3d0d6eWlNVktCcnRNcVo4TnVOOUwxdnA5Q245Z1p6RG56bUtUU2h3?=
 =?utf-8?B?akZrQmlMS2dremVoOEpmK014OW5PNFdwUVhCbWRGbnNDdG1pcE1XSFRMTXFB?=
 =?utf-8?B?dWlWKzUwOFQ1dHR6SDhzZm0vaEk5cGk0KzYvNTZpSTZ4UHIyYi84QzZyUFlI?=
 =?utf-8?B?T2ZLa1c4cGhISytmWG05K0lhQUpsMW10bzB6UVFRNmVKVEc5cnU1TUJXQ21z?=
 =?utf-8?B?QS9nR3lXYldBaHYvL2RkamhQMndxQWY2RERTZGdBTVphdmZSZGlFZ1l0a3Vy?=
 =?utf-8?B?aVQ3ZzJJeTFGcUgwdGw1YncrZ0FmTm5nTVdGV2E4aUhuZjNQT0pwMndzdkRP?=
 =?utf-8?B?M09xeTNsOEdoNVdBL2dUM0ZIa0UxUjVDTUVtYkVpWDM0bFd0N2tvQ05Jbi9v?=
 =?utf-8?B?LzFRenQ1UEVqczMrSGgxMTNBRmkwT3V0ck96RWRuZ1ljaUwzVE0wazZ2NEpO?=
 =?utf-8?B?ZHZ6MU0xakUxMmpwTGFQTnBpU1JMZzQzL1c3ZHowc08yQ3VFYi9PU0RuTUdM?=
 =?utf-8?Q?5plbKMIeMQa6X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ditBZ2w2WCtCUTNMQnZqQ29lSTlaazNFbEwvdU9KZm5GbEFLRFVGNmJYS1FS?=
 =?utf-8?B?bUFOdkhSVXgyellsb3Z1ZUdlRm45VDVBTWI0UGZwYmphYTZVOEdURi9Fdm1T?=
 =?utf-8?B?NFZVeHdFODRBVFl0eUVMNU5oY1A3cDdvcDdrLzh2KzlSMkRIYjBZU24zVXFX?=
 =?utf-8?B?OHMxRVJJM0NFTktPZzhYcXdjRWxpMXNyR01GZ1cvN1ZGUjllejFLVWc3VVRr?=
 =?utf-8?B?bWpUdHBDa1B2ZU1VYmNxY1BoaTYzYlJwa3MxMVhaT1JFUE5aNHBhMFlFYzVD?=
 =?utf-8?B?V3dUNmQvakdhRE9vc1FqeHZhTFhYc29SWDZrY2ZoZUY2RnJsVTkzRXJ4WTJ6?=
 =?utf-8?B?bHkyUmVma0p6MGVuR1BxWkRYcS9hS3VnMlF3QXhVeVJaWFMwUy81SDFFaHNa?=
 =?utf-8?B?T2lMRXE4UlBRUFd4dXR5Q2cxU0hST0NwSmxzT0NobHlRRTFnMFE1L1VKKy91?=
 =?utf-8?B?YTBjMXRYQnVUQnVyN2w1OWNaUjBoaDF1MkdJUlU0c3pMbERPeldaZjgyMHlp?=
 =?utf-8?B?MkhBWUJ3ZktXb3ZKL1plZDdycHRtbmUxWjdBOWNDcWVJeFpJS25Vd25PSk05?=
 =?utf-8?B?OWIycW02bE5sWmFHRHhhbFdjZFZPN01GTTR6bk9XaVVXUngycXBpOTJIOTA1?=
 =?utf-8?B?dkFGVU52N1MvNExLclJ4SktyaUt0L0lXWFdrRVJHSFVOZjJVd1hlM0J5NU52?=
 =?utf-8?B?bkxiV0VhMWF2ejhmTysxaGxqOTdERTJCeU1MTkdQM2dzNmt4RUxNazQ3M1hq?=
 =?utf-8?B?NVVwZXVmZ0VqMWs3ejM5WDQ5OWxvN2ZlYXFuUXE2OTlsNjllMGJFdEZrdzQ0?=
 =?utf-8?B?TVVNN015aktQd3RLYU1lQU8rYmtuaGZhQjc5K0hiRXA1MEhjMVdISDU2d29p?=
 =?utf-8?B?bHZoQzRtSUxKcjdLN0RTTHlVUE1qdTBvL0w2MlpjREZOMmdXT1NIVjBvaHpi?=
 =?utf-8?B?SisvcnlpRVJ4dkNpT21PcWhZWENzVzlEUXJ4Y2p5ZFFjZ0pEUHVZSy8rSXlW?=
 =?utf-8?B?N0ZHUU44K0hjZzNSUDFxS2UxVXFuRTVoOVlSOVVyRDZqWFJEVEwrTnhOUjZl?=
 =?utf-8?B?b3UwYTdIcklVQW1aWk9pOW1BUHFXZ3pBVThKSjZJT1RHdml0KzJYRHJHbUN6?=
 =?utf-8?B?Q3JacFJEaWRFak9FRm1rbHliRVRNWm5vSU9Yb0pmVCtQdkhSR0hmdS9sbTE3?=
 =?utf-8?B?L1NXK1ZuUUwvV2d1QmVRMERPNFF5V2RzWlI3RW1vbEdNUWU1OWNkMTlmNFhN?=
 =?utf-8?B?bno3Tk8xQ1hBS3NVUGFPekY1cnVaUHhWcXNURzZQNkg1TmIzeUN6K2VOUURV?=
 =?utf-8?B?TW5ndkNyT1MyWnlNaVhtVjZrTUUzSjFjMHQ4dDdjT3cvZzYweERHUnBqZW5p?=
 =?utf-8?B?SWNrLzJmLzhISUVYTXo2SWNwRlBwZElnYmhXb2VOelRoZm1JM1NpVy95T3Bi?=
 =?utf-8?B?OUVoTllLRzhsL0tYbGlHY0FTd1J1MG0rR2k3SU10VDhiRE92ZGNnQ3JCTUla?=
 =?utf-8?B?QkhjVlF5NjlxMkgzMkpTQnpmZGlSakFEQzBCa3BUYzdBU0lLbnBIUXNjajgz?=
 =?utf-8?B?WkgySUpjRGFobDFWdTYyM0swemtSeTVSbVJnY3JEeXEwR0Q4UFBXdUxleXNW?=
 =?utf-8?B?aXU5a0NPc0dzajFqRGRPZFN6MGxIeFBWU1VQT3VWQzNKNG80QmV4RXMrYnBk?=
 =?utf-8?B?Sys1RnlYSlJKU1AwSVlVbG00c3J6RHN5UFFoOXUvcGJDUEkwUWcxUHc4cG1y?=
 =?utf-8?B?WllwME5iSDB2SWhZQlh5SUdEZSt0L0NqUG8yenl0L3F6K21aMWEzamZoa0pt?=
 =?utf-8?B?cmxXcVBqU1FoVEpwdGNzOHNYSytpL25aaTQxQ3hVZXhUbE44L2lpNi9xRFZx?=
 =?utf-8?B?U2o4OUpEemtRNUlWVHdRQ1JDZzdXR2ZqNElqTFQ3bUw2KzJXb3JuYk03UEgx?=
 =?utf-8?B?bHpXS1FBMnEyMDZ6M1c4VHpSOEladFZWVmlnZFl2elRDQWdFY0ErUzgvdFZ5?=
 =?utf-8?B?Yzhxb1hNWjg3ZEx1ODBTZS92SUd0UCtodVpMRC9XWkptaC8wM0dCOTV3NmdF?=
 =?utf-8?B?MVB5allWY0Q0cUZvNlFSZ2VXaDB0SGh2SmtlRWxiM0FsUEpxekNaVUszeFVJ?=
 =?utf-8?Q?spt3Ebm591fYZkLPjArgduQwp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VgQzYptnTvj1l4k3envWB2fGyfZkxhkL0SX02hI64b7C5pACWM2YD2MnL0BUvDa8Jch7PvEQKLEn5/HpAJqBLX33BTz0CJxCu00R4W2bDkUSUidpKhaw7oFJfhIBWy+A2xwNcl0n907CJts2w8L0FUxZysO2AzM/MnJhfrWoQA5L5pFeH5SSgUavT0zi+55WjWxAlcbT8eaYYdJR4RweisCP8GkS8eF+BhkskgxRNU35FFIHDK8Hm8of/e5m28HXXV8/397q/1F/PKtBMAgXxLl3N6XnFSKlfXOQOTrujTxJS5xg8b6wQjSU7nYyDc+yxwAZ7H4vFDjNcyRSkQKfDKKdDu5ByZOYakqIThuPPci2/5FZR+cKwdrbHi/HzubEcEiT7fVGOI8Ylloj2x94yU6oHdQMW5Y2SXjJdYawlT539wKInGPyezhOpIbdAcW7DTwYB/k9D0eJntvk+EzPWcPCIc64QIJ0bfAW7MUzhSxzPeuEe0sDrRVo0oMUEvq5gleIjs+SpfenzObeL58Y65sYhd8xotaUlNLGdq9LcSYo2CLJQRG8Y8SLWy4eFwNo2oZnEgjigEpll1j9tfBeDvnyUGZHNf0reE0npzHdeF4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4063845-2718-4b9d-ab39-08dde5cb1c7d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 00:37:48.1220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: moYuxlOgX3St+cB1/romiUO7pvwDkZntzPeiNC/3gdzROMmhsfYMgdnSwSgpKDM+UNDWAeSpPStgkSLqQZVVlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6072
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508280003
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxMyBTYWx0ZWRfX0ShCOtFz7RmB
 Uq39I4O6CHvSUxWFG/Mb780flxryKYynfTu2v0Rus2YWgwadsBujR94W5f3/DdfknESmp7HUYhR
 Y07BqA8kUXvWTLeTdXy9u+fAByu3HUwlWkTCx11EOAOpN1k8/jwT3wEveaWTqPIkgfqwOVRnR6s
 0uiikm7QUMLLZUXESlkumyt68D1vUncNIOpNPliVjvfXyLqTzmJ8gtvsprT9YpM136Oq7NiioWO
 7wCSMVIsRHF9H3yuEea6dUZsaUug/ovJEPPWDy8ndJc6GoeqsyaUbeh6H1K9tGotXC3Z91Ni3Yo
 ZlWSKyvAuEnKpHSR/I8hfq0FuEFduBkfZo8AavlQif1W1rjJFpE4Q20wxN9GEB1KguEHUdF/7PD
 u6kiC+9e
X-Proofpoint-ORIG-GUID: Pei-hL-sz224MVFEkx7_IYzs0s4HD3_V
X-Authority-Analysis: v=2.4 cv=RqfFLDmK c=1 sm=1 tr=0 ts=68afa4e1 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=vbyJIY8eAAAA:8
 a=yPCof4ZbAAAA:8 a=TOjwwQM-YgTUfRHZFaQA:9 a=cfAxYm45D6da2Qrv:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=UXyj_mcEdvtx2GLQwyJ1:22
X-Proofpoint-GUID: Pei-hL-sz224MVFEkx7_IYzs0s4HD3_V

Oops, thanks.

I didn't look at the details, but it tested well for me.  So:
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 8/27/25 03:30, Alan Maguire wrote:
> On 26/08/2025 23:23, Eugene Loh wrote:
>> I might be doing something wrong, but the tests in question still fail
>> for me -- largely unchanged -- even with the patch.
>> 5.4.17-2136.346.6.el8uek.x86_64
>> 5.4.17-2136.346.6.el8uek.aarch64
>>
> Hmm, did you have both
>
> https://lore.kernel.org/dtrace/87frdegewe.fsf@esperi.org.uk/T/#t
>
> "[PATCH] cg: fix offset for > 8 bit bitfields in dt_cg_ctf_offsetof()"
>
> and
>
> https://lore.kernel.org/dtrace/2073aa34-9bf7-47a2-1f89-13b17c58fafa@oracle.com/T/#t
>
> "[PATCH] tcp provider: use __ip_queue_xmit() as it is non-static on 5.4"
>
> ...applied? The cg patch doesn't mention tcp in the title but it is
> needed as it fixes the offset from where we look up the sk->sk_protocol;
> without that state-change probes won't fire.
>
> Thanks for testing!
>
> Alan
>
>> On 8/26/25 09:12, Alan Maguire wrote:
>>> On a 5.4 kernel, the function we instrument for tcp:::accept-established
>>> (tcp_init_transfer()) does not have a struct sk_buff * as argument;
>>> that does not appear until 5.10.  As a result we need to fake up
>>> the IP and TCP headers from the TCP socket.  We can reuse existing
>>> code (ensuring to mark accept-established correctly as an _INBOUND
>>> probe) once we fix up references in ip.d to be arg6 and not arg7 (this
>>> parameter is used to mark a probe point as inbound, outbound or as a
>>> state change).  We need to ensure that args[2] is translated from
>>> a __dtrace_tcp_void_ip_t * to get this to work for the IP header.
>>>
>>> For the TCP header we need a similar solution; add a
>>> __dtrace_tcp_void_tcp_t type and translate from either the tcp heade
>>> passed in (if non-null) or use arg3 (the socket) to fill out the TCP
>>> header info.  We can get the ports, seq/ack and because we know that
>>> only accept-established is used we know the flags will just be an
>>> ACK.
>>>
>>> With this in place (along with previous fixes for the TCP provider)
>>> the TCP state-related tests finally pass on a 5.4 kernel.
>>>
>>> Reported-by: Eugene Loh <eugene.loh@oracle.com>
>>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>>> ---
>>>    dlibs/aarch64/5.11/ip.d  | 12 +++---
>>>    dlibs/aarch64/5.11/tcp.d | 34 +++++++++++++++-
>>>    dlibs/aarch64/5.12/ip.d  | 12 +++---
>>>    dlibs/aarch64/5.12/tcp.d | 34 +++++++++++++++-
>>>    dlibs/aarch64/5.14/ip.d  | 12 +++---
>>>    dlibs/aarch64/5.14/tcp.d | 34 +++++++++++++++-
>>>    dlibs/aarch64/5.16/ip.d  | 12 +++---
>>>    dlibs/aarch64/5.16/tcp.d | 34 +++++++++++++++-
>>>    dlibs/aarch64/5.2/ip.d   | 12 +++---
>>>    dlibs/aarch64/5.2/tcp.d  | 34 +++++++++++++++-
>>>    dlibs/aarch64/5.6/ip.d   | 12 +++---
>>>    dlibs/aarch64/5.6/tcp.d  | 34 +++++++++++++++-
>>>    dlibs/aarch64/6.1/ip.d   | 12 +++---
>>>    dlibs/aarch64/6.1/tcp.d  | 34 +++++++++++++++-
>>>    dlibs/aarch64/6.10/ip.d  | 12 +++---
>>>    dlibs/aarch64/6.10/tcp.d | 34 +++++++++++++++-
>>>    dlibs/x86_64/5.11/ip.d   | 12 +++---
>>>    dlibs/x86_64/5.11/tcp.d  | 34 +++++++++++++++-
>>>    dlibs/x86_64/5.12/ip.d   | 12 +++---
>>>    dlibs/x86_64/5.12/tcp.d  | 34 +++++++++++++++-
>>>    dlibs/x86_64/5.14/ip.d   | 12 +++---
>>>    dlibs/x86_64/5.14/tcp.d  | 34 +++++++++++++++-
>>>    dlibs/x86_64/5.16/ip.d   | 12 +++---
>>>    dlibs/x86_64/5.16/tcp.d  | 34 +++++++++++++++-
>>>    dlibs/x86_64/5.2/ip.d    | 12 +++---
>>>    dlibs/x86_64/5.2/tcp.d   | 34 +++++++++++++++-
>>>    dlibs/x86_64/5.6/ip.d    | 12 +++---
>>>    dlibs/x86_64/5.6/tcp.d   | 34 +++++++++++++++-
>>>    dlibs/x86_64/6.1/ip.d    | 12 +++---
>>>    dlibs/x86_64/6.1/tcp.d   | 34 +++++++++++++++-
>>>    dlibs/x86_64/6.10/ip.d   | 12 +++---
>>>    dlibs/x86_64/6.10/tcp.d  | 34 +++++++++++++++-
>>>    libdtrace/dt_prov_tcp.c  | 85 ++++++++++++++++++++++++----------------
>>>    libdtrace/ip.d           | 12 +++---
>>>    libdtrace/tcp.d          | 34 +++++++++++++++-
>>>    35 files changed, 698 insertions(+), 169 deletions(-)
>>>
>>> diff --git a/dlibs/aarch64/5.11/ip.d b/dlibs/aarch64/5.11/ip.d
>>> index 493b75a0..95520b4a 100644
>>> --- a/dlibs/aarch64/5.11/ip.d
>>> +++ b/dlibs/aarch64/5.11/ip.d
>>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>>     * In some cases where the ipinfo_t * is NULL we wish to construct
>>> IP info
>>>     * using the struct tcp_sock * (arg3).  In order to map local IP to
>>> source
>>>     * or destination IP address appropriately we need to check if the
>>> associated
>>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> - * the value is stored in arg7.  If inbound, we map the local IP
>>> address to
>>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> + * the value is stored in arg6.  If inbound, we map the local IP
>>> address to
>>>     * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>>     */
>>>    #pragma D binding "1.5" translator
>>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>>            "<unknown>";
>>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>>            "<unknown>";
>>> diff --git a/dlibs/aarch64/5.11/tcp.d b/dlibs/aarch64/5.11/tcp.d
>>> index 48d9adb4..8f87aa57 100644
>>> --- a/dlibs/aarch64/5.11/tcp.d
>>> +++ b/dlibs/aarch64/5.11/tcp.d
>>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>            (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>>            ((struct sock *)T)->__sk_common.skc_num :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->dest :
>>>              ((struct tcphdr *)arg4)->source) :
>>>            0;
>>>        tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>>            ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->source :
>>>              ((struct tcphdr *)arg4)->dest) :
>>>            0;
>>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>    translator tcplsinfo_t < int I > {
>>>        tcps_state = arg3 ? ((struct sock *)arg3)-
>>>> __sk_common.skc_state : 0;
>>>    };
>>> +
>>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>>> have
>>> + * an sk_buff with struct tcphdr * available; currently only used for
>>> + * the tcp:::accept-established case where the struct sk_buff * is not
>>> + * available on < 5.10 kernels.
>>> + */
>>> +typedef void * __dtrace_tcp_void_tcp_t;
>>> +
>>> +#pragma D binding "1.6.3" translator
>>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>>> +            0;
>>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>>> +            0;
>>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>>> +          0;
>>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>>> +          0;
>>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>>> +             0;
>>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>>> +    tcp_hdr = (uintptr_t)T;
>>> +};
>>> diff --git a/dlibs/aarch64/5.12/ip.d b/dlibs/aarch64/5.12/ip.d
>>> index 493b75a0..95520b4a 100644
>>> --- a/dlibs/aarch64/5.12/ip.d
>>> +++ b/dlibs/aarch64/5.12/ip.d
>>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>>     * In some cases where the ipinfo_t * is NULL we wish to construct
>>> IP info
>>>     * using the struct tcp_sock * (arg3).  In order to map local IP to
>>> source
>>>     * or destination IP address appropriately we need to check if the
>>> associated
>>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> - * the value is stored in arg7.  If inbound, we map the local IP
>>> address to
>>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> + * the value is stored in arg6.  If inbound, we map the local IP
>>> address to
>>>     * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>>     */
>>>    #pragma D binding "1.5" translator
>>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>>            "<unknown>";
>>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>>            "<unknown>";
>>> diff --git a/dlibs/aarch64/5.12/tcp.d b/dlibs/aarch64/5.12/tcp.d
>>> index 48d9adb4..8f87aa57 100644
>>> --- a/dlibs/aarch64/5.12/tcp.d
>>> +++ b/dlibs/aarch64/5.12/tcp.d
>>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>            (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>>            ((struct sock *)T)->__sk_common.skc_num :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->dest :
>>>              ((struct tcphdr *)arg4)->source) :
>>>            0;
>>>        tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>>            ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->source :
>>>              ((struct tcphdr *)arg4)->dest) :
>>>            0;
>>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>    translator tcplsinfo_t < int I > {
>>>        tcps_state = arg3 ? ((struct sock *)arg3)-
>>>> __sk_common.skc_state : 0;
>>>    };
>>> +
>>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>>> have
>>> + * an sk_buff with struct tcphdr * available; currently only used for
>>> + * the tcp:::accept-established case where the struct sk_buff * is not
>>> + * available on < 5.10 kernels.
>>> + */
>>> +typedef void * __dtrace_tcp_void_tcp_t;
>>> +
>>> +#pragma D binding "1.6.3" translator
>>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>>> +            0;
>>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>>> +            0;
>>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>>> +          0;
>>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>>> +          0;
>>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>>> +             0;
>>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>>> +    tcp_hdr = (uintptr_t)T;
>>> +};
>>> diff --git a/dlibs/aarch64/5.14/ip.d b/dlibs/aarch64/5.14/ip.d
>>> index 493b75a0..95520b4a 100644
>>> --- a/dlibs/aarch64/5.14/ip.d
>>> +++ b/dlibs/aarch64/5.14/ip.d
>>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>>     * In some cases where the ipinfo_t * is NULL we wish to construct
>>> IP info
>>>     * using the struct tcp_sock * (arg3).  In order to map local IP to
>>> source
>>>     * or destination IP address appropriately we need to check if the
>>> associated
>>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> - * the value is stored in arg7.  If inbound, we map the local IP
>>> address to
>>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> + * the value is stored in arg6.  If inbound, we map the local IP
>>> address to
>>>     * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>>     */
>>>    #pragma D binding "1.5" translator
>>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>>            "<unknown>";
>>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>>            "<unknown>";
>>> diff --git a/dlibs/aarch64/5.14/tcp.d b/dlibs/aarch64/5.14/tcp.d
>>> index 48d9adb4..8f87aa57 100644
>>> --- a/dlibs/aarch64/5.14/tcp.d
>>> +++ b/dlibs/aarch64/5.14/tcp.d
>>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>            (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>>            ((struct sock *)T)->__sk_common.skc_num :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->dest :
>>>              ((struct tcphdr *)arg4)->source) :
>>>            0;
>>>        tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>>            ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->source :
>>>              ((struct tcphdr *)arg4)->dest) :
>>>            0;
>>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>    translator tcplsinfo_t < int I > {
>>>        tcps_state = arg3 ? ((struct sock *)arg3)-
>>>> __sk_common.skc_state : 0;
>>>    };
>>> +
>>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>>> have
>>> + * an sk_buff with struct tcphdr * available; currently only used for
>>> + * the tcp:::accept-established case where the struct sk_buff * is not
>>> + * available on < 5.10 kernels.
>>> + */
>>> +typedef void * __dtrace_tcp_void_tcp_t;
>>> +
>>> +#pragma D binding "1.6.3" translator
>>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>>> +            0;
>>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>>> +            0;
>>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>>> +          0;
>>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>>> +          0;
>>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>>> +             0;
>>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>>> +    tcp_hdr = (uintptr_t)T;
>>> +};
>>> diff --git a/dlibs/aarch64/5.16/ip.d b/dlibs/aarch64/5.16/ip.d
>>> index 493b75a0..95520b4a 100644
>>> --- a/dlibs/aarch64/5.16/ip.d
>>> +++ b/dlibs/aarch64/5.16/ip.d
>>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>>     * In some cases where the ipinfo_t * is NULL we wish to construct
>>> IP info
>>>     * using the struct tcp_sock * (arg3).  In order to map local IP to
>>> source
>>>     * or destination IP address appropriately we need to check if the
>>> associated
>>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> - * the value is stored in arg7.  If inbound, we map the local IP
>>> address to
>>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> + * the value is stored in arg6.  If inbound, we map the local IP
>>> address to
>>>     * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>>     */
>>>    #pragma D binding "1.5" translator
>>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>>            "<unknown>";
>>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>>            "<unknown>";
>>> diff --git a/dlibs/aarch64/5.16/tcp.d b/dlibs/aarch64/5.16/tcp.d
>>> index 48d9adb4..8f87aa57 100644
>>> --- a/dlibs/aarch64/5.16/tcp.d
>>> +++ b/dlibs/aarch64/5.16/tcp.d
>>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>            (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>>            ((struct sock *)T)->__sk_common.skc_num :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->dest :
>>>              ((struct tcphdr *)arg4)->source) :
>>>            0;
>>>        tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>>            ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->source :
>>>              ((struct tcphdr *)arg4)->dest) :
>>>            0;
>>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>    translator tcplsinfo_t < int I > {
>>>        tcps_state = arg3 ? ((struct sock *)arg3)-
>>>> __sk_common.skc_state : 0;
>>>    };
>>> +
>>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>>> have
>>> + * an sk_buff with struct tcphdr * available; currently only used for
>>> + * the tcp:::accept-established case where the struct sk_buff * is not
>>> + * available on < 5.10 kernels.
>>> + */
>>> +typedef void * __dtrace_tcp_void_tcp_t;
>>> +
>>> +#pragma D binding "1.6.3" translator
>>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>>> +            0;
>>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>>> +            0;
>>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>>> +          0;
>>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>>> +          0;
>>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>>> +             0;
>>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>>> +    tcp_hdr = (uintptr_t)T;
>>> +};
>>> diff --git a/dlibs/aarch64/5.2/ip.d b/dlibs/aarch64/5.2/ip.d
>>> index 493b75a0..95520b4a 100644
>>> --- a/dlibs/aarch64/5.2/ip.d
>>> +++ b/dlibs/aarch64/5.2/ip.d
>>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>>     * In some cases where the ipinfo_t * is NULL we wish to construct
>>> IP info
>>>     * using the struct tcp_sock * (arg3).  In order to map local IP to
>>> source
>>>     * or destination IP address appropriately we need to check if the
>>> associated
>>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> - * the value is stored in arg7.  If inbound, we map the local IP
>>> address to
>>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> + * the value is stored in arg6.  If inbound, we map the local IP
>>> address to
>>>     * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>>     */
>>>    #pragma D binding "1.5" translator
>>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>>            "<unknown>";
>>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>>            "<unknown>";
>>> diff --git a/dlibs/aarch64/5.2/tcp.d b/dlibs/aarch64/5.2/tcp.d
>>> index 48d9adb4..8f87aa57 100644
>>> --- a/dlibs/aarch64/5.2/tcp.d
>>> +++ b/dlibs/aarch64/5.2/tcp.d
>>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>            (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>>            ((struct sock *)T)->__sk_common.skc_num :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->dest :
>>>              ((struct tcphdr *)arg4)->source) :
>>>            0;
>>>        tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>>            ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->source :
>>>              ((struct tcphdr *)arg4)->dest) :
>>>            0;
>>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>    translator tcplsinfo_t < int I > {
>>>        tcps_state = arg3 ? ((struct sock *)arg3)-
>>>> __sk_common.skc_state : 0;
>>>    };
>>> +
>>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>>> have
>>> + * an sk_buff with struct tcphdr * available; currently only used for
>>> + * the tcp:::accept-established case where the struct sk_buff * is not
>>> + * available on < 5.10 kernels.
>>> + */
>>> +typedef void * __dtrace_tcp_void_tcp_t;
>>> +
>>> +#pragma D binding "1.6.3" translator
>>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>>> +            0;
>>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>>> +            0;
>>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>>> +          0;
>>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>>> +          0;
>>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>>> +             0;
>>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>>> +    tcp_hdr = (uintptr_t)T;
>>> +};
>>> diff --git a/dlibs/aarch64/5.6/ip.d b/dlibs/aarch64/5.6/ip.d
>>> index 493b75a0..95520b4a 100644
>>> --- a/dlibs/aarch64/5.6/ip.d
>>> +++ b/dlibs/aarch64/5.6/ip.d
>>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>>     * In some cases where the ipinfo_t * is NULL we wish to construct
>>> IP info
>>>     * using the struct tcp_sock * (arg3).  In order to map local IP to
>>> source
>>>     * or destination IP address appropriately we need to check if the
>>> associated
>>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> - * the value is stored in arg7.  If inbound, we map the local IP
>>> address to
>>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> + * the value is stored in arg6.  If inbound, we map the local IP
>>> address to
>>>     * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>>     */
>>>    #pragma D binding "1.5" translator
>>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>>            "<unknown>";
>>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>>            "<unknown>";
>>> diff --git a/dlibs/aarch64/5.6/tcp.d b/dlibs/aarch64/5.6/tcp.d
>>> index 48d9adb4..8f87aa57 100644
>>> --- a/dlibs/aarch64/5.6/tcp.d
>>> +++ b/dlibs/aarch64/5.6/tcp.d
>>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>            (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>>            ((struct sock *)T)->__sk_common.skc_num :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->dest :
>>>              ((struct tcphdr *)arg4)->source) :
>>>            0;
>>>        tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>>            ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->source :
>>>              ((struct tcphdr *)arg4)->dest) :
>>>            0;
>>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>    translator tcplsinfo_t < int I > {
>>>        tcps_state = arg3 ? ((struct sock *)arg3)-
>>>> __sk_common.skc_state : 0;
>>>    };
>>> +
>>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>>> have
>>> + * an sk_buff with struct tcphdr * available; currently only used for
>>> + * the tcp:::accept-established case where the struct sk_buff * is not
>>> + * available on < 5.10 kernels.
>>> + */
>>> +typedef void * __dtrace_tcp_void_tcp_t;
>>> +
>>> +#pragma D binding "1.6.3" translator
>>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>>> +            0;
>>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>>> +            0;
>>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>>> +          0;
>>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>>> +          0;
>>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>>> +             0;
>>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>>> +    tcp_hdr = (uintptr_t)T;
>>> +};
>>> diff --git a/dlibs/aarch64/6.1/ip.d b/dlibs/aarch64/6.1/ip.d
>>> index 493b75a0..95520b4a 100644
>>> --- a/dlibs/aarch64/6.1/ip.d
>>> +++ b/dlibs/aarch64/6.1/ip.d
>>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>>     * In some cases where the ipinfo_t * is NULL we wish to construct
>>> IP info
>>>     * using the struct tcp_sock * (arg3).  In order to map local IP to
>>> source
>>>     * or destination IP address appropriately we need to check if the
>>> associated
>>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> - * the value is stored in arg7.  If inbound, we map the local IP
>>> address to
>>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> + * the value is stored in arg6.  If inbound, we map the local IP
>>> address to
>>>     * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>>     */
>>>    #pragma D binding "1.5" translator
>>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>>            "<unknown>";
>>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>>            "<unknown>";
>>> diff --git a/dlibs/aarch64/6.1/tcp.d b/dlibs/aarch64/6.1/tcp.d
>>> index 48d9adb4..8f87aa57 100644
>>> --- a/dlibs/aarch64/6.1/tcp.d
>>> +++ b/dlibs/aarch64/6.1/tcp.d
>>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>            (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>>            ((struct sock *)T)->__sk_common.skc_num :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->dest :
>>>              ((struct tcphdr *)arg4)->source) :
>>>            0;
>>>        tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>>            ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->source :
>>>              ((struct tcphdr *)arg4)->dest) :
>>>            0;
>>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>    translator tcplsinfo_t < int I > {
>>>        tcps_state = arg3 ? ((struct sock *)arg3)-
>>>> __sk_common.skc_state : 0;
>>>    };
>>> +
>>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>>> have
>>> + * an sk_buff with struct tcphdr * available; currently only used for
>>> + * the tcp:::accept-established case where the struct sk_buff * is not
>>> + * available on < 5.10 kernels.
>>> + */
>>> +typedef void * __dtrace_tcp_void_tcp_t;
>>> +
>>> +#pragma D binding "1.6.3" translator
>>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>>> +            0;
>>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>>> +            0;
>>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>>> +          0;
>>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>>> +          0;
>>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>>> +             0;
>>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>>> +    tcp_hdr = (uintptr_t)T;
>>> +};
>>> diff --git a/dlibs/aarch64/6.10/ip.d b/dlibs/aarch64/6.10/ip.d
>>> index 493b75a0..95520b4a 100644
>>> --- a/dlibs/aarch64/6.10/ip.d
>>> +++ b/dlibs/aarch64/6.10/ip.d
>>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>>     * In some cases where the ipinfo_t * is NULL we wish to construct
>>> IP info
>>>     * using the struct tcp_sock * (arg3).  In order to map local IP to
>>> source
>>>     * or destination IP address appropriately we need to check if the
>>> associated
>>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> - * the value is stored in arg7.  If inbound, we map the local IP
>>> address to
>>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> + * the value is stored in arg6.  If inbound, we map the local IP
>>> address to
>>>     * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>>     */
>>>    #pragma D binding "1.5" translator
>>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>>            "<unknown>";
>>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>>            "<unknown>";
>>> diff --git a/dlibs/aarch64/6.10/tcp.d b/dlibs/aarch64/6.10/tcp.d
>>> index 48d9adb4..8f87aa57 100644
>>> --- a/dlibs/aarch64/6.10/tcp.d
>>> +++ b/dlibs/aarch64/6.10/tcp.d
>>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>            (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>>            ((struct sock *)T)->__sk_common.skc_num :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->dest :
>>>              ((struct tcphdr *)arg4)->source) :
>>>            0;
>>>        tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>>            ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->source :
>>>              ((struct tcphdr *)arg4)->dest) :
>>>            0;
>>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>    translator tcplsinfo_t < int I > {
>>>        tcps_state = arg3 ? ((struct sock *)arg3)-
>>>> __sk_common.skc_state : 0;
>>>    };
>>> +
>>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>>> have
>>> + * an sk_buff with struct tcphdr * available; currently only used for
>>> + * the tcp:::accept-established case where the struct sk_buff * is not
>>> + * available on < 5.10 kernels.
>>> + */
>>> +typedef void * __dtrace_tcp_void_tcp_t;
>>> +
>>> +#pragma D binding "1.6.3" translator
>>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>>> +            0;
>>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>>> +            0;
>>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>>> +          0;
>>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>>> +          0;
>>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>>> +             0;
>>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>>> +    tcp_hdr = (uintptr_t)T;
>>> +};
>>> diff --git a/dlibs/x86_64/5.11/ip.d b/dlibs/x86_64/5.11/ip.d
>>> index 493b75a0..95520b4a 100644
>>> --- a/dlibs/x86_64/5.11/ip.d
>>> +++ b/dlibs/x86_64/5.11/ip.d
>>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>>     * In some cases where the ipinfo_t * is NULL we wish to construct
>>> IP info
>>>     * using the struct tcp_sock * (arg3).  In order to map local IP to
>>> source
>>>     * or destination IP address appropriately we need to check if the
>>> associated
>>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> - * the value is stored in arg7.  If inbound, we map the local IP
>>> address to
>>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> + * the value is stored in arg6.  If inbound, we map the local IP
>>> address to
>>>     * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>>     */
>>>    #pragma D binding "1.5" translator
>>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>>            "<unknown>";
>>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>>            "<unknown>";
>>> diff --git a/dlibs/x86_64/5.11/tcp.d b/dlibs/x86_64/5.11/tcp.d
>>> index 48d9adb4..8f87aa57 100644
>>> --- a/dlibs/x86_64/5.11/tcp.d
>>> +++ b/dlibs/x86_64/5.11/tcp.d
>>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>            (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>>            ((struct sock *)T)->__sk_common.skc_num :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->dest :
>>>              ((struct tcphdr *)arg4)->source) :
>>>            0;
>>>        tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>>            ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->source :
>>>              ((struct tcphdr *)arg4)->dest) :
>>>            0;
>>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>    translator tcplsinfo_t < int I > {
>>>        tcps_state = arg3 ? ((struct sock *)arg3)-
>>>> __sk_common.skc_state : 0;
>>>    };
>>> +
>>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>>> have
>>> + * an sk_buff with struct tcphdr * available; currently only used for
>>> + * the tcp:::accept-established case where the struct sk_buff * is not
>>> + * available on < 5.10 kernels.
>>> + */
>>> +typedef void * __dtrace_tcp_void_tcp_t;
>>> +
>>> +#pragma D binding "1.6.3" translator
>>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>>> +            0;
>>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>>> +            0;
>>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>>> +          0;
>>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>>> +          0;
>>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>>> +             0;
>>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>>> +    tcp_hdr = (uintptr_t)T;
>>> +};
>>> diff --git a/dlibs/x86_64/5.12/ip.d b/dlibs/x86_64/5.12/ip.d
>>> index 493b75a0..95520b4a 100644
>>> --- a/dlibs/x86_64/5.12/ip.d
>>> +++ b/dlibs/x86_64/5.12/ip.d
>>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>>     * In some cases where the ipinfo_t * is NULL we wish to construct
>>> IP info
>>>     * using the struct tcp_sock * (arg3).  In order to map local IP to
>>> source
>>>     * or destination IP address appropriately we need to check if the
>>> associated
>>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> - * the value is stored in arg7.  If inbound, we map the local IP
>>> address to
>>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> + * the value is stored in arg6.  If inbound, we map the local IP
>>> address to
>>>     * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>>     */
>>>    #pragma D binding "1.5" translator
>>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>>            "<unknown>";
>>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>>            "<unknown>";
>>> diff --git a/dlibs/x86_64/5.12/tcp.d b/dlibs/x86_64/5.12/tcp.d
>>> index 48d9adb4..8f87aa57 100644
>>> --- a/dlibs/x86_64/5.12/tcp.d
>>> +++ b/dlibs/x86_64/5.12/tcp.d
>>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>            (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>>            ((struct sock *)T)->__sk_common.skc_num :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->dest :
>>>              ((struct tcphdr *)arg4)->source) :
>>>            0;
>>>        tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>>            ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->source :
>>>              ((struct tcphdr *)arg4)->dest) :
>>>            0;
>>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>    translator tcplsinfo_t < int I > {
>>>        tcps_state = arg3 ? ((struct sock *)arg3)-
>>>> __sk_common.skc_state : 0;
>>>    };
>>> +
>>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>>> have
>>> + * an sk_buff with struct tcphdr * available; currently only used for
>>> + * the tcp:::accept-established case where the struct sk_buff * is not
>>> + * available on < 5.10 kernels.
>>> + */
>>> +typedef void * __dtrace_tcp_void_tcp_t;
>>> +
>>> +#pragma D binding "1.6.3" translator
>>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>>> +            0;
>>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>>> +            0;
>>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>>> +          0;
>>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>>> +          0;
>>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>>> +             0;
>>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>>> +    tcp_hdr = (uintptr_t)T;
>>> +};
>>> diff --git a/dlibs/x86_64/5.14/ip.d b/dlibs/x86_64/5.14/ip.d
>>> index 493b75a0..95520b4a 100644
>>> --- a/dlibs/x86_64/5.14/ip.d
>>> +++ b/dlibs/x86_64/5.14/ip.d
>>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>>     * In some cases where the ipinfo_t * is NULL we wish to construct
>>> IP info
>>>     * using the struct tcp_sock * (arg3).  In order to map local IP to
>>> source
>>>     * or destination IP address appropriately we need to check if the
>>> associated
>>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> - * the value is stored in arg7.  If inbound, we map the local IP
>>> address to
>>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> + * the value is stored in arg6.  If inbound, we map the local IP
>>> address to
>>>     * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>>     */
>>>    #pragma D binding "1.5" translator
>>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>>            "<unknown>";
>>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>>            "<unknown>";
>>> diff --git a/dlibs/x86_64/5.14/tcp.d b/dlibs/x86_64/5.14/tcp.d
>>> index 48d9adb4..8f87aa57 100644
>>> --- a/dlibs/x86_64/5.14/tcp.d
>>> +++ b/dlibs/x86_64/5.14/tcp.d
>>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>            (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>>            ((struct sock *)T)->__sk_common.skc_num :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->dest :
>>>              ((struct tcphdr *)arg4)->source) :
>>>            0;
>>>        tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>>            ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->source :
>>>              ((struct tcphdr *)arg4)->dest) :
>>>            0;
>>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>    translator tcplsinfo_t < int I > {
>>>        tcps_state = arg3 ? ((struct sock *)arg3)-
>>>> __sk_common.skc_state : 0;
>>>    };
>>> +
>>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>>> have
>>> + * an sk_buff with struct tcphdr * available; currently only used for
>>> + * the tcp:::accept-established case where the struct sk_buff * is not
>>> + * available on < 5.10 kernels.
>>> + */
>>> +typedef void * __dtrace_tcp_void_tcp_t;
>>> +
>>> +#pragma D binding "1.6.3" translator
>>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>>> +            0;
>>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>>> +            0;
>>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>>> +          0;
>>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>>> +          0;
>>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>>> +             0;
>>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>>> +    tcp_hdr = (uintptr_t)T;
>>> +};
>>> diff --git a/dlibs/x86_64/5.16/ip.d b/dlibs/x86_64/5.16/ip.d
>>> index 493b75a0..95520b4a 100644
>>> --- a/dlibs/x86_64/5.16/ip.d
>>> +++ b/dlibs/x86_64/5.16/ip.d
>>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>>     * In some cases where the ipinfo_t * is NULL we wish to construct
>>> IP info
>>>     * using the struct tcp_sock * (arg3).  In order to map local IP to
>>> source
>>>     * or destination IP address appropriately we need to check if the
>>> associated
>>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> - * the value is stored in arg7.  If inbound, we map the local IP
>>> address to
>>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> + * the value is stored in arg6.  If inbound, we map the local IP
>>> address to
>>>     * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>>     */
>>>    #pragma D binding "1.5" translator
>>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>>            "<unknown>";
>>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>>            "<unknown>";
>>> diff --git a/dlibs/x86_64/5.16/tcp.d b/dlibs/x86_64/5.16/tcp.d
>>> index 48d9adb4..8f87aa57 100644
>>> --- a/dlibs/x86_64/5.16/tcp.d
>>> +++ b/dlibs/x86_64/5.16/tcp.d
>>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>            (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>>            ((struct sock *)T)->__sk_common.skc_num :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->dest :
>>>              ((struct tcphdr *)arg4)->source) :
>>>            0;
>>>        tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>>            ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->source :
>>>              ((struct tcphdr *)arg4)->dest) :
>>>            0;
>>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>    translator tcplsinfo_t < int I > {
>>>        tcps_state = arg3 ? ((struct sock *)arg3)-
>>>> __sk_common.skc_state : 0;
>>>    };
>>> +
>>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>>> have
>>> + * an sk_buff with struct tcphdr * available; currently only used for
>>> + * the tcp:::accept-established case where the struct sk_buff * is not
>>> + * available on < 5.10 kernels.
>>> + */
>>> +typedef void * __dtrace_tcp_void_tcp_t;
>>> +
>>> +#pragma D binding "1.6.3" translator
>>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>>> +            0;
>>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>>> +            0;
>>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>>> +          0;
>>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>>> +          0;
>>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>>> +             0;
>>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>>> +    tcp_hdr = (uintptr_t)T;
>>> +};
>>> diff --git a/dlibs/x86_64/5.2/ip.d b/dlibs/x86_64/5.2/ip.d
>>> index 493b75a0..95520b4a 100644
>>> --- a/dlibs/x86_64/5.2/ip.d
>>> +++ b/dlibs/x86_64/5.2/ip.d
>>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>>     * In some cases where the ipinfo_t * is NULL we wish to construct
>>> IP info
>>>     * using the struct tcp_sock * (arg3).  In order to map local IP to
>>> source
>>>     * or destination IP address appropriately we need to check if the
>>> associated
>>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> - * the value is stored in arg7.  If inbound, we map the local IP
>>> address to
>>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> + * the value is stored in arg6.  If inbound, we map the local IP
>>> address to
>>>     * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>>     */
>>>    #pragma D binding "1.5" translator
>>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>>            "<unknown>";
>>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>>            "<unknown>";
>>> diff --git a/dlibs/x86_64/5.2/tcp.d b/dlibs/x86_64/5.2/tcp.d
>>> index 48d9adb4..8f87aa57 100644
>>> --- a/dlibs/x86_64/5.2/tcp.d
>>> +++ b/dlibs/x86_64/5.2/tcp.d
>>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>            (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>>            ((struct sock *)T)->__sk_common.skc_num :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->dest :
>>>              ((struct tcphdr *)arg4)->source) :
>>>            0;
>>>        tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>>            ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->source :
>>>              ((struct tcphdr *)arg4)->dest) :
>>>            0;
>>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>    translator tcplsinfo_t < int I > {
>>>        tcps_state = arg3 ? ((struct sock *)arg3)-
>>>> __sk_common.skc_state : 0;
>>>    };
>>> +
>>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>>> have
>>> + * an sk_buff with struct tcphdr * available; currently only used for
>>> + * the tcp:::accept-established case where the struct sk_buff * is not
>>> + * available on < 5.10 kernels.
>>> + */
>>> +typedef void * __dtrace_tcp_void_tcp_t;
>>> +
>>> +#pragma D binding "1.6.3" translator
>>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>>> +            0;
>>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>>> +            0;
>>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>>> +          0;
>>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>>> +          0;
>>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>>> +             0;
>>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>>> +    tcp_hdr = (uintptr_t)T;
>>> +};
>>> diff --git a/dlibs/x86_64/5.6/ip.d b/dlibs/x86_64/5.6/ip.d
>>> index 493b75a0..95520b4a 100644
>>> --- a/dlibs/x86_64/5.6/ip.d
>>> +++ b/dlibs/x86_64/5.6/ip.d
>>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>>     * In some cases where the ipinfo_t * is NULL we wish to construct
>>> IP info
>>>     * using the struct tcp_sock * (arg3).  In order to map local IP to
>>> source
>>>     * or destination IP address appropriately we need to check if the
>>> associated
>>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> - * the value is stored in arg7.  If inbound, we map the local IP
>>> address to
>>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> + * the value is stored in arg6.  If inbound, we map the local IP
>>> address to
>>>     * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>>     */
>>>    #pragma D binding "1.5" translator
>>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>>            "<unknown>";
>>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>>            "<unknown>";
>>> diff --git a/dlibs/x86_64/5.6/tcp.d b/dlibs/x86_64/5.6/tcp.d
>>> index 48d9adb4..8f87aa57 100644
>>> --- a/dlibs/x86_64/5.6/tcp.d
>>> +++ b/dlibs/x86_64/5.6/tcp.d
>>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>            (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>>            ((struct sock *)T)->__sk_common.skc_num :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->dest :
>>>              ((struct tcphdr *)arg4)->source) :
>>>            0;
>>>        tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>>            ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->source :
>>>              ((struct tcphdr *)arg4)->dest) :
>>>            0;
>>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>    translator tcplsinfo_t < int I > {
>>>        tcps_state = arg3 ? ((struct sock *)arg3)-
>>>> __sk_common.skc_state : 0;
>>>    };
>>> +
>>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>>> have
>>> + * an sk_buff with struct tcphdr * available; currently only used for
>>> + * the tcp:::accept-established case where the struct sk_buff * is not
>>> + * available on < 5.10 kernels.
>>> + */
>>> +typedef void * __dtrace_tcp_void_tcp_t;
>>> +
>>> +#pragma D binding "1.6.3" translator
>>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>>> +            0;
>>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>>> +            0;
>>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>>> +          0;
>>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>>> +          0;
>>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>>> +             0;
>>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>>> +    tcp_hdr = (uintptr_t)T;
>>> +};
>>> diff --git a/dlibs/x86_64/6.1/ip.d b/dlibs/x86_64/6.1/ip.d
>>> index 493b75a0..95520b4a 100644
>>> --- a/dlibs/x86_64/6.1/ip.d
>>> +++ b/dlibs/x86_64/6.1/ip.d
>>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>>     * In some cases where the ipinfo_t * is NULL we wish to construct
>>> IP info
>>>     * using the struct tcp_sock * (arg3).  In order to map local IP to
>>> source
>>>     * or destination IP address appropriately we need to check if the
>>> associated
>>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> - * the value is stored in arg7.  If inbound, we map the local IP
>>> address to
>>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> + * the value is stored in arg6.  If inbound, we map the local IP
>>> address to
>>>     * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>>     */
>>>    #pragma D binding "1.5" translator
>>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>>            "<unknown>";
>>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>>            "<unknown>";
>>> diff --git a/dlibs/x86_64/6.1/tcp.d b/dlibs/x86_64/6.1/tcp.d
>>> index 48d9adb4..8f87aa57 100644
>>> --- a/dlibs/x86_64/6.1/tcp.d
>>> +++ b/dlibs/x86_64/6.1/tcp.d
>>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>            (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>>            ((struct sock *)T)->__sk_common.skc_num :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->dest :
>>>              ((struct tcphdr *)arg4)->source) :
>>>            0;
>>>        tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>>            ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->source :
>>>              ((struct tcphdr *)arg4)->dest) :
>>>            0;
>>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>    translator tcplsinfo_t < int I > {
>>>        tcps_state = arg3 ? ((struct sock *)arg3)-
>>>> __sk_common.skc_state : 0;
>>>    };
>>> +
>>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>>> have
>>> + * an sk_buff with struct tcphdr * available; currently only used for
>>> + * the tcp:::accept-established case where the struct sk_buff * is not
>>> + * available on < 5.10 kernels.
>>> + */
>>> +typedef void * __dtrace_tcp_void_tcp_t;
>>> +
>>> +#pragma D binding "1.6.3" translator
>>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>>> +            0;
>>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>>> +            0;
>>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>>> +          0;
>>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>>> +          0;
>>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>>> +             0;
>>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>>> +    tcp_hdr = (uintptr_t)T;
>>> +};
>>> diff --git a/dlibs/x86_64/6.10/ip.d b/dlibs/x86_64/6.10/ip.d
>>> index 493b75a0..95520b4a 100644
>>> --- a/dlibs/x86_64/6.10/ip.d
>>> +++ b/dlibs/x86_64/6.10/ip.d
>>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>>     * In some cases where the ipinfo_t * is NULL we wish to construct
>>> IP info
>>>     * using the struct tcp_sock * (arg3).  In order to map local IP to
>>> source
>>>     * or destination IP address appropriately we need to check if the
>>> associated
>>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> - * the value is stored in arg7.  If inbound, we map the local IP
>>> address to
>>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> + * the value is stored in arg6.  If inbound, we map the local IP
>>> address to
>>>     * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>>     */
>>>    #pragma D binding "1.5" translator
>>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>>            "<unknown>";
>>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>>            "<unknown>";
>>> diff --git a/dlibs/x86_64/6.10/tcp.d b/dlibs/x86_64/6.10/tcp.d
>>> index 48d9adb4..8f87aa57 100644
>>> --- a/dlibs/x86_64/6.10/tcp.d
>>> +++ b/dlibs/x86_64/6.10/tcp.d
>>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>            (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>>            ((struct sock *)T)->__sk_common.skc_num :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->dest :
>>>              ((struct tcphdr *)arg4)->source) :
>>>            0;
>>>        tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>>            ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->source :
>>>              ((struct tcphdr *)arg4)->dest) :
>>>            0;
>>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>    translator tcplsinfo_t < int I > {
>>>        tcps_state = arg3 ? ((struct sock *)arg3)-
>>>> __sk_common.skc_state : 0;
>>>    };
>>> +
>>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>>> have
>>> + * an sk_buff with struct tcphdr * available; currently only used for
>>> + * the tcp:::accept-established case where the struct sk_buff * is not
>>> + * available on < 5.10 kernels.
>>> + */
>>> +typedef void * __dtrace_tcp_void_tcp_t;
>>> +
>>> +#pragma D binding "1.6.3" translator
>>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>>> +            0;
>>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>>> +            0;
>>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>>> +          0;
>>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>>> +          0;
>>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>>> +             0;
>>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>>> +    tcp_hdr = (uintptr_t)T;
>>> +};
>>> diff --git a/libdtrace/dt_prov_tcp.c b/libdtrace/dt_prov_tcp.c
>>> index a191efe1..44ed2bc9 100644
>>> --- a/libdtrace/dt_prov_tcp.c
>>> +++ b/libdtrace/dt_prov_tcp.c
>>> @@ -72,9 +72,9 @@ static probe_dep_t    probes[] = {
>>>    static probe_arg_t probe_args[] = {
>>>        { "accept-established", 0, { 0, 0, "struct sk_buff *",
>>> "pktinfo_t *" } },
>>>        { "accept-established", 1, { 1, 0, "struct sock *", "csinfo_t
>>> *" } },
>>> -    { "accept-established", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
>>> +    { "accept-established", 2, { 2, 0, "__dtrace_tcp_void_ip_t *",
>>> "ipinfo_t *" } },
>>>        { "accept-established", 3, { 3, 0, "struct tcp_sock *",
>>> "tcpsinfo_t *" } },
>>> -    { "accept-established", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t
>>> *" } },
>>> +    { "accept-established", 4, { 4, 0, "__dtrace_tcp_void_tcp_t *",
>>> "tcpinfo_t *" } },
>>>        { "accept-established", 5, { 5, 0, "void", "void" } },
>>>          { "accept-refused", 0, { 0, 0, "struct sk_buff *", "pktinfo_t
>>> *" } },
>>> @@ -166,8 +166,11 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>>        dt_probe_t    *uprp = pcb->pcb_parent_probe;
>>>        int        direction, have_iphdr;
>>>        int        skarg = 0, skbarg = 1, tcparg = 0;
>>> -    int        skarg_maybe_null;
>>> +    int        skarg_maybe_null, have_skb = 1;
>>>        int        skstate = 0;
>>> +    dtrace_typeinfo_t sym;
>>> +    ctf_funcinfo_t    fi;
>>> +    int        rc;
>>>          /*
>>>         * We construct the tcp::: probe arguments as follows:
>>> @@ -258,11 +261,24 @@ static int trampoline(dt_pcb_t *pcb, uint_t
>>> exitlbl)
>>>        }
>>>          if (strcmp(prp->desc->prb, "accept-established") == 0) {
>>> -        direction = NET_PROBE_OUTBOUND;
>>> +        direction = NET_PROBE_INBOUND;
>>>            have_iphdr = 1;
>>> -        /* skb in arg2 not arg1 */
>>> -        skbarg = 2;
>>> -        skarg_maybe_null = 0;
>>> +        /* on older (5.4) kernels, tcp_init_transfer() only has 2
>>> +         * args, i.e. no struct skb * third argument.
>>> +          */
>>> +        rc = dtrace_lookup_by_type(dtp, DTRACE_OBJ_EVERY,
>>> +                       uprp->desc->fun, &sym);
>>> +        if (rc == 0 &&
>>> +            ctf_type_kind(sym.dtt_ctfp, sym.dtt_type) ==
>>> CTF_K_FUNCTION &&
>>> +            ctf_func_type_info(sym.dtt_ctfp, sym.dtt_type, &fi) == 0 &&
>>> +            fi.ctc_argc > 2) {
>>> +            /* skb in arg2 not arg1 */
>>> +            skbarg = 2;
>>> +            skarg_maybe_null = 0;
>>> +        } else {
>>> +            have_skb = 0;
>>> +            have_iphdr = 0;
>>> +        }
>>>            /* ensure arg1 is BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB */
>>>            emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(1)));
>>>            emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_6,
>>> @@ -289,10 +305,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>>        } else {
>>>            direction = NET_PROBE_OUTBOUND;
>>>            if (strcmp(uprp->desc->fun, "ip_send_unicast_reply") == 0) {
>>> -            dtrace_typeinfo_t    sym;
>>> -            ctf_funcinfo_t        fi;
>>> -            int rc;
>>> -
>>>                /* Newer kernels pass the original socket as second
>>>                 * arg to ip_send_unicast_reply(); if that function
>>>                 * has an extra (> 9) argument we know we have to
>>> @@ -344,10 +356,14 @@ static int trampoline(dt_pcb_t *pcb, uint_t
>>> exitlbl)
>>>            emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
>>>        emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_6));
>>>    -    /* then save skb to args[0] */
>>> -    emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skbarg)));
>>> -    emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
>>> -    emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
>>> +    if (have_skb) {
>>> +        /* then save skb to args[0] */
>>> +        emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7,
>>> DMST_ARG(skbarg)));
>>> +        emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
>>> +        emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
>>> +    } else {
>>> +        emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(0), 0));
>>> +    }
>>>          /* next save sk to args[1] now that we have skb in args[0] */
>>>        emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(3)));
>>> @@ -358,34 +374,37 @@ static int trampoline(dt_pcb_t *pcb, uint_t
>>> exitlbl)
>>>         *    skb_network_header(skb)    =    (include/linux/ip.h)
>>>         *    skb->head + skb->network_header    (include/linux/skbuff.h)
>>>         */
>>> -    emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(0)));
>>> -    dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
>>> -    if (have_iphdr)
>>> +    if (have_skb && have_iphdr) {
>>> +        emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(0)));
>>> +        dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
>>> "head");
>>>            emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2),
>>> BPF_REG_0));
>>> -    else
>>> -        emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2), 0));
>>> -
>>> -    if (have_iphdr) {
>>>            dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
>>> -                 "network_header");
>>> +                       "network_header");
>>>            emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(2),
>>> BPF_REG_0));
>>> +    } else {
>>> +        emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2), 0));
>>>        }
>>> +
>>>        /*
>>>         * tcp_hdr(skb) =
>>>         *    skb_transport_header(skb) =        (include/linux/ip.h)
>>>         *    skb->head + skb->transport_header    (include/linux/skbuff.h)
>>>         */
>>> -    emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(tcparg)));
>>> -    if (tcparg) {
>>> -        /* struct ip_reply_arg * has a kvec containing the tcp header */
>>> -        dt_cg_tramp_get_member(pcb, "struct kvec", BPF_REG_6,
>>> "iov_base");
>>> -        emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
>>> +    if (have_skb) {
>>> +        emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7,
>>> DMST_ARG(tcparg)));
>>> +        if (tcparg) {
>>> +            /* struct ip_reply_arg * has a kvec containing the tcp
>>> header */
>>> +            dt_cg_tramp_get_member(pcb, "struct kvec", BPF_REG_6,
>>> "iov_base");
>>> +            emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4),
>>> BPF_REG_0));
>>> +        } else {
>>> +            dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
>>> "head");
>>> +            emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4),
>>> BPF_REG_0));
>>> +            dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
>>> +                     "transport_header");
>>> +            emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(4),
>>> BPF_REG_0));
>>> +        }
>>>        } else {
>>> -        dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
>>> "head");
>>> -        emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
>>> -        dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
>>> -                 "transport_header");
>>> -        emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(4),
>>> BPF_REG_0));
>>> +        emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(4), 0));
>>>        }
>>>          if (!skarg_maybe_null) {
>>> diff --git a/libdtrace/ip.d b/libdtrace/ip.d
>>> index 493b75a0..95520b4a 100644
>>> --- a/libdtrace/ip.d
>>> +++ b/libdtrace/ip.d
>>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>>     * In some cases where the ipinfo_t * is NULL we wish to construct
>>> IP info
>>>     * using the struct tcp_sock * (arg3).  In order to map local IP to
>>> source
>>>     * or destination IP address appropriately we need to check if the
>>> associated
>>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> - * the value is stored in arg7.  If inbound, we map the local IP
>>> address to
>>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>>> (NET_PROBE_OUTBOUND);
>>> + * the value is stored in arg6.  If inbound, we map the local IP
>>> address to
>>>     * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>>     */
>>>    #pragma D binding "1.5" translator
>>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>>            "<unknown>";
>>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>>            inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>>            arg3 != NULL &&
>>>            ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>>            &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>>            "<unknown>";
>>> diff --git a/libdtrace/tcp.d b/libdtrace/tcp.d
>>> index 48d9adb4..8f87aa57 100644
>>> --- a/libdtrace/tcp.d
>>> +++ b/libdtrace/tcp.d
>>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>            (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>>            ((struct sock *)T)->__sk_common.skc_num :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->dest :
>>>              ((struct tcphdr *)arg4)->source) :
>>>            0;
>>>        tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>>            ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>>            arg4 != NULL ?
>>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>>              ((struct tcphdr *)arg4)->source :
>>>              ((struct tcphdr *)arg4)->dest) :
>>>            0;
>>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>>    translator tcplsinfo_t < int I > {
>>>        tcps_state = arg3 ? ((struct sock *)arg3)-
>>>> __sk_common.skc_state : 0;
>>>    };
>>> +
>>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>>> have
>>> + * an sk_buff with struct tcphdr * available; currently only used for
>>> + * the tcp:::accept-established case where the struct sk_buff * is not
>>> + * available on < 5.10 kernels.
>>> + */
>>> +typedef void * __dtrace_tcp_void_tcp_t;
>>> +
>>> +#pragma D binding "1.6.3" translator
>>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>>> +            0;
>>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>>> +            0;
>>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>>> +          0;
>>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>>> +          0;
>>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>>> +             0;
>>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>>> +    tcp_hdr = (uintptr_t)T;
>>> +};
