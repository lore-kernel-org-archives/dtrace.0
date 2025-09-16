Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E55A2D9484
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 22:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758063229; cv=fail; b=aFMmmFCWW435DZI9QhnkyXtG9M0RFJDSAvDiuAoac+6zKN0d4fDT7EXlCV7D88n9qsVJoqDKBSksvu42/SSiWDJJ9KYIKdJwiW5Ror2j0BeEfobHwbl4F+fCnDFzcCnkYdJBZhgAST6qboJcugB2tvgpJYQhqSz6ewrDdn7QW1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758063229; c=relaxed/simple;
	bh=5izH+z5ToZ3LPe8QUNlguqgMQRUPpk7lPjVYGXIZ5SE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=USBpwhWJ5a5DRcrVG3+I3mj+O0lmpWfF04I/zIESqNKY2wwl4KxpjGu6MJnAOyRx/nUI1RNlTREwoq0z+OJXhNBVxzBMA3eIRTpFpVmxYPPVw/h26Ox8QWD9+Ox75ahyiwH+j5gTS5WtfX0iyx5r3CPialVZH8j8na4ldhTl4w8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LSpDvfsV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Q1wf7Zwu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LSpDvfsV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Q1wf7Zwu"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLYvlN024221
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 22:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=McB7BrJCZvKAPmlaw7bbvr3X/X3EhHYE8hRiHTP2gNI=; b=
	LSpDvfsVUCtA0Kr1C5Q5bWCMUFmUm24ZOOZizd7pEuwOa2jHQ29fU3EaoxTlog9E
	ji9kS+RMGATcKVpSDFJReLVnwgHH5sd0jhFHnK8ZoY/8Qy6/m3qd6XbwI9xVNEYB
	2ytxslqR2Nmvht2nFBuoRkknui43U9WOkspDhJPDfchKb226ntZuk7Ry5m1yk5Ta
	Dj8gZtkpjrle+SZk2UonB2pR1eqnvoKLOS/vlR0Q7vcuCbTw7u3oYuxK/F3w1xvy
	UMIy3h+XIKAViJXNklhdCx4u03pmatDzH7fpI4Pyh0taT1mlKmOJDI9dsm2Zs7fv
	8z/smT9xM6byV2s2PZ9WbA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fx8g2pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 22:53:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58GKYaC1035117
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 22:53:45 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012017.outbound.protection.outlook.com [40.93.195.17])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2kajqf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 22:53:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J++no1jz2TQL7fCYN4/uoNfw6vgvMajQsDWTiBXD97MvohLOYDbqiximze6UpVgCIXXOzO+0yPMt6VSGQD8JsQqO7+R+0Xi3vlHeFP4yIZ8EKZXvIlVpJoO3iDixISpF5CPItlPd3TlwZx+iepUg8ej5pjppmwrJhYki1QuFksZhK9t5/Pvqvt5UzpgTig2KqN/OHzGZUkpA7ETwbL/wGLCsn04OTcPQu559fGiCSJ5fL5fsFRgLq+AS6A6ibK8YOEv4VFXuMqG9b0We9/q5SqRSt4eg2hpw3ceuXx+7pecgBA7MQDTSiI8txrWKYrkPbKbT/bsKHyky1ILGPBHp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McB7BrJCZvKAPmlaw7bbvr3X/X3EhHYE8hRiHTP2gNI=;
 b=vFYVzYeSnGe4uXsicBek4x1akI7lUw5tQ72CAPedE7/Iz1Dmo1bTQJp/QV5u4VaB+rQl0XjBO2nFh+fWrsMQIMyvgWNbpvOuuBmeULUu99Mz74xOyPfiQnYS+33Cn2iseS7sjDsQBrZekGBsBBcwloFRk3wGGI6xvPPwCgvI8tvqiyriYyw6ugQOPPI8L0urAW/DF4WIY6m9k69qm0h++Cs4F+X7lUwF645hye9fQmovqh67R/I8JUdrde6uW1lFZclrgoiApXudNZi7vpDufcC96ncMsVsPRhbGkKcf+9EnQAW0zL9TxxK+OWOQ6rSR8hAnRbapqB6dmMHl+kEXvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McB7BrJCZvKAPmlaw7bbvr3X/X3EhHYE8hRiHTP2gNI=;
 b=Q1wf7Zwu4bvuUfe6wT2zJkIHAme/1fKvl4Fu9iLz2P0DfcxIy0KQS8WIR7DS9mKw4vYBZxG0GIFShnuURkAGXmzkz3+6gjaoI0mmbOgMglsBe6fBvkfmy3oCtUMfetNIsWzN1yeG7YpKGutmM8R3QrPlsX2VAHUsGcfhvFQsuII=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BLAPR10MB5074.namprd10.prod.outlook.com (2603:10b6:208:30d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 22:53:27 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 22:53:27 +0000
Message-ID: <1bb40563-ec79-f466-d210-3fc55197b10f@oracle.com>
Date: Tue, 16 Sep 2025 18:53:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4] trace: print alloca pointers as actual pointer values
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB56721752C4BEB7A65080065EC214A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB56721752C4BEB7A65080065EC214A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P220CA0153.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BLAPR10MB5074:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eedf5c5-b960-4e63-f212-08ddf573d951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGhFVG9qSEp3bmpnRVp5ZEJlUEloRkhrMWQwUlJzVi9jS01rY1BNZ2tyS3kx?=
 =?utf-8?B?YzNBQ0Y2VUZON2o3RlQ4bHg1Q202bTBkV3pzZC9IZmF4N1lZcUY4dW92elRU?=
 =?utf-8?B?TG1MY1BadEJPdzBRMWk2STZRb1RkL3d5dTR0QWRPV2sreDV0OVRsaDRSbGdU?=
 =?utf-8?B?MEUxWmZZd1pnZDVKZnVoQ2JtZmM4S256S21CeWQ3TGlpM2dYV0NLKzRyaFVT?=
 =?utf-8?B?S2dDbGkxcGhJcFMvazdCZjBMTmdXSUxjNkhUVVY0N01rK1Vjd1BTSEtuMGV2?=
 =?utf-8?B?QnlzeWVRRTJzM1crZVdKNytVU0lRR09oT0JqVXJHdmJzMUJzaHFtTVlEY1Jz?=
 =?utf-8?B?OUZlNW9yWUNRZ0JVSzRKZE5xTGtMVThUQ2taOE1EWllVYi85OUpQK0RLWkwz?=
 =?utf-8?B?MHR6R1B1Z2t0Zi9PYVF4V3FZajVUcktTdTRUSXNrcnZKZTkxbGV1QmR6cW1Z?=
 =?utf-8?B?dWw0MCtUZ3dKQzZZeFUyUC8xbGMyQytxemc1a0tWM2VteEIzRTVUWFZqUExn?=
 =?utf-8?B?WnIrelFLcHZRSFpUbWpUSkE0czZCYzRSMHlzRXNGQ1BYK3dkbFNWNkVFaUlK?=
 =?utf-8?B?U2NYYm5BZmJWZUlTRFpPOHhvVTM2c3BrQUxYak9RYTAyNGNEZmVOV0lpZWd0?=
 =?utf-8?B?c0pwMGxOZlVucVdXTHdjZEUwcy9oWDdwY3RqOFlkNHFxWjJUS1R5NGd1YkRx?=
 =?utf-8?B?NEFEdW9WQmFTM2xmdlZON1BON0JlRlQ1YjVwMldlTWJtSzV6SGFKMGxhM1dY?=
 =?utf-8?B?bzUyYWhIMTFmd3Rzbi82YVBlWnlsTk9vbXlkM1kvTGptZFJoYWpIYzZvc1ow?=
 =?utf-8?B?OGtQanN1QjlOU3FPVEl3SC9zNE1ZZWhQK094THZrVVRmS3duUEU2blA4UEN6?=
 =?utf-8?B?Zm5ORXhMZE9yZDNmUUhHYWVHWGFuS2xmWmpscVQ3eTg2SjBRRy93SG56eTVQ?=
 =?utf-8?B?RVNmajdzSENDakFPZ3U4THY1TkttM1BVSXNIQ1dCKy9vSUQvNCtYYTNHQmpk?=
 =?utf-8?B?STk2VDlXa2JLVlFOQ0swTDlFUGtHU3dBU0I4OGdpR1lsdGpqQlQ3b1IvYzBi?=
 =?utf-8?B?d0ZmQW9FYnFha0ZvcWlmTTJUOW5VL1RSS1RTa2FUSUNHMVdNZ0FGYjdrcjJr?=
 =?utf-8?B?T1BNVW04YWFGZVpOYVl0ZFcwaXpDVmtkclJudk1wOWpVU3JTUllqc1NVOENo?=
 =?utf-8?B?TEYzTnFpeUx6aDQ4TW8ybHIzYnV2aEswUWRJN3YyTkQwN3ZPTU9xSXQ2K0Zy?=
 =?utf-8?B?K0F4bUR3MllPU0Q2SHE2ZjYrclNlQkZvbkZ6VE96Z3BKcXpYMFdJYjJvdEo2?=
 =?utf-8?B?ZUpTSWJMSzRpWUxPckp1OFRtVjFEVmxsZjRxUURMS1pWcHF3RFRzMTU3N1F3?=
 =?utf-8?B?V2pyTjE5WjA2V3MrcUZXWDg4cmUvNyttUkE1OE1leExKaUVOUjEzYnZZWTZp?=
 =?utf-8?B?Tzl5WitMck04VTZXbUc1MHFyeDRqMm1rVDNYZjlIZzd5T0R2cFVDNURRYnFL?=
 =?utf-8?B?d0d2YndFUTE1YXlQekhhcXVzUDNtSWtudUJYb0dxNXN6V1lEdklycy9CdzZH?=
 =?utf-8?B?SWdlVHlxcjFYb25iZmJBT3Q3UU9EbGN3T2h4WXR4MnE0aXRrQjA3WkVaajFL?=
 =?utf-8?B?S2c2aUpocXZuVVZNNzVoQjF2bnc2ZExZOVZKejAvRUx5WU4wQW5ZNFdDdmdQ?=
 =?utf-8?B?TlJhekEyM2twbHJZZk5wS3BLNTFaRlphWkxxbWhzenNUWHR4VnRrcGpnYzNm?=
 =?utf-8?B?MWRkWVFqdEhoOGFSbitJcUFQUVM5NjZjYkI2UmFEbGRFdzFjN0RBZlB5dGFy?=
 =?utf-8?B?TG12cmtQdmtlZUxDZDZ5bzNETHRuM2RCY0dud1E3ZXZkV3JYcjR1MFZDTW5O?=
 =?utf-8?B?UlNTQktNTEFHa1djeld6WXVtYkY4Yy9ud0s4NHJwK2tjRGtLd2lGRjNiR1dy?=
 =?utf-8?Q?5w36EtuScXA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUYvVDJCc0RzaVE1U1YySEZhcmlWRXAyT1dyR0M2VXR6L2FiMjF4eTBPdnAy?=
 =?utf-8?B?ZGZHUHVVV3RMbjB5YzkrV2xYQWJjYXlUdU5PRzNSYVloU0RmQklSRTdwZW5r?=
 =?utf-8?B?dW1adWpnRlFtTkY4aXd5c3pJUXNpMy93d29vZ2hsdEJ6NXJHTUowcE9lKzlr?=
 =?utf-8?B?YTMxTzEzc1BkZWRHTVdiRnJ6eTVzd3cweldiTWk3cGlMQmxaZlIzemZGMXNr?=
 =?utf-8?B?YVdTWDZ3aDRnYTdhQWZ0Z1NaZlBzNTE3UURpbUpKZXVoM29IZjQvOXR4TEwr?=
 =?utf-8?B?alc0Qi8vRWhSTXU4VWZqL0FadG9LdG5ZdERJcVZScFNUYTA1Sm1tQlFpUjN1?=
 =?utf-8?B?ZkZMNEFHRU51Z2FSQ3ZaZVR0MGd4RXk3MDloWGVEOTNoVHRYeGFWNG43ZWha?=
 =?utf-8?B?Tm9yeHBSL09QUjYvdDM5NitVWFZ4Z2JOTEptbWJtTkhsWFdIZW9KMzE5M2Vy?=
 =?utf-8?B?c3VEUzdZaU14VkxIb2FQWStnZnM0Y3FHbkxVRTBVbStNbWVDY2I0NUorVUt0?=
 =?utf-8?B?ZE00QlR0U2dsRWJOUzBra2IzT0F2bmpIWUNHbHBrS3NyZGJ5RmxKeDkrZ0Fk?=
 =?utf-8?B?WkFVdUVEdG41Vjl6UU96OXdQaDhhdkNvNWJ6QThTYkdnQjFlQ1lwZ2NjN3VH?=
 =?utf-8?B?R2Q0TVczRmRyL3ZBWURyVW9tK3NRazRZR3FZR1NXWTV6YVk1TXV2Vjh0dGZq?=
 =?utf-8?B?bHpOWSsyazZZMk5kVzhyS1YyS0lRZU9aam1UdHRxK1lWRjVwS1ljdlFaelRI?=
 =?utf-8?B?NzFkWTNZcUd4Y2QvNWc1R3BmOUFGclVSNlhLcE45UGlnWlQyUlVJMDZKbi80?=
 =?utf-8?B?SVUxaE0zKzhydFM0UkkxVDlPOFVjOFZKS1B6VE04Q2hGdmROQWZCZ0VNUGN1?=
 =?utf-8?B?UTJvczkycWgvNkZNbXhxUnNsMVc3VUViR2l1WXdFZXZpSmJFOUpDM2k2S2ZE?=
 =?utf-8?B?c25oSTh3Y0ZxZWdjV0lUaS91cHovbUNWdVVQM0RnbnNaeHVaeVVJdGhUTWIz?=
 =?utf-8?B?bTEyL1lMWWdVU0h5VDlETXhkZVVqQlA1Vm9iMVhNQVhKWTYrUkpOcmk0ZWYx?=
 =?utf-8?B?UE9PTUFFQy84VXhJbmxncXdzRU5YbVJ2ZU9tT0ZsVDNJQXN5cTk2T05OeDFl?=
 =?utf-8?B?ckV3TDhCSGdUcThJdEtqOHRHejZ1N2FiYXdWa01DZEoyaTVveXlkMUx6Ym1N?=
 =?utf-8?B?RFladVBGYlJ0T2Jzd3RzdUZLL1hJK3JGa3B1dk93Vy8vOHRmWW1LdVVibExw?=
 =?utf-8?B?aDFhN0RZcEQxc1Q5VjJCbWxiOHpwZ0JUeVAranRxNkJNUmRUbmV5VXhoY0tU?=
 =?utf-8?B?bnhaeFVNd3NSMDBaRm50M1NjMFgrV1ljdUlRVVhvTVBvMndleDdNbDZDOU5R?=
 =?utf-8?B?TDhITXRGWkV0TCtqeEFWdGNONHNmang5cm1vZmZYMGxWd09SWGtvdlNTUlNi?=
 =?utf-8?B?ZzFENmtRN0diUk9OTWN5MjhsaEpGMTBYTlFsQ0RWdXNJdnNFNmxiWUR4YWdl?=
 =?utf-8?B?VVd6U3lTT2w4ZitYVitCOEF0TWFOZm83ZnhEN0NDWVVILzFTQytteSs5UVhJ?=
 =?utf-8?B?OWYxV3BKb2tqSDB5T3lyU0NyQWhxREVpb3d4S2pGeXk1dExlWVowUWtRZXgv?=
 =?utf-8?B?d2ZldnFkSUxFaUJJTGJXTllmcHRCVUp1aStXOUFYejhqM1dCVXRKRmtrUXd1?=
 =?utf-8?B?cnlrS0d4c3ZTSEJsZlF4SitaaUJWbmloNER1a1BzNnNFNUFyQ0tDd2Raejlt?=
 =?utf-8?B?NjNWZUJRdS9nR01ITWVqT2xNcnRGaUw4N2U2R0kxZVBjWU41NkttSitqVHln?=
 =?utf-8?B?NDNWRklKckNqL05YdHNZbDZuMWFOUW54R0hraHZvMUZTcWNib3ZzMGZlS2xP?=
 =?utf-8?B?bnIwMXN6ZEFyZHp1N3JCc2ROMGxCQklhN1FlMFJVbUVaeERuT3B2em9xeVNB?=
 =?utf-8?B?YlJCemJ6ZFdad1U4WktIenlBOVRzZHlYUGl3U295RytHOG85a0ErVEtJemhU?=
 =?utf-8?B?OUFIcXVoM3N3QjkzOGlRaTVmQWVFRHB1cjJjUU0rQXFQNEl4K3Q3QmEvdms1?=
 =?utf-8?B?L1U2TnQ2bzM4endSK1I4aytxL1ZYOTkvSG9mTmhTQmZOMXJiUy92bGV6Zm40?=
 =?utf-8?Q?k6LIgu70ZsV+kiT6+1Yhji/MB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+dJ5ebsJHPGsO0JV4OLeCG7jO+lf6PLflvUUTXJe59P8x9WPYMm9+5M/akWAz3mo3wkmIyQesOGQ9JCLfgMul9qEeL0TMQFaq6ev36eN3k0hyy8Sxuw9/W2zEvfdEEYt3XKR+DdQLL55iab9ikuRvVrshKoah74yC9cGVfRgGffL3kZKp231T5JukTWhz0VC5aR5I5p7Yrs8djCA0RijXg3WUU5QmX2rmr78vg7eOCC5QadA9HETlWPX15FT0/i6InOYeNWq49pi0RTnmrx1XSVS8qTdShmT8xtNgH/zCk/+BNkxc8d73oDDXU+GlXvk8NrjRYsQha+DZjRaPHrHwcrDLI2aJrpWjI3r3+2znERtBbadg0k5LZPsfVuSeCIUG5kjCLcGM87dbvB2KAw/5HBy3zUqXW1/T2d20y4rylKZ1J4yqJOzTFxtW43y9W+UPMjOXX48k4ZvEsUs1ZHsAUJ9nqi7zYdnYG6SLUsMDAExtfcRGcrt0zner8fg21IN9qx/p8y4lwhaGlP2W/E/tqvWH0mcXAxz88PZu1g4H3Ph8DFZmbHPOWfloGofzubch7ejBORXB4gp7JNSH5tbKuePZrYR8tMZE74V6K2LF2o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eedf5c5-b960-4e63-f212-08ddf573d951
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 22:53:27.7087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndPjgiF8EfudCxNvSh4RtRZu9vFNuFojzL12+h1K2TzQACg3qabnyJ52mUDj6TcGUAp6OWxJ8WqzAS7mIhPMsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5074
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509160215
X-Authority-Analysis: v=2.4 cv=JNU7s9Kb c=1 sm=1 tr=0 ts=68c9ea7a b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=jOeEbmxvWjRFlEUw3LAA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13614
X-Proofpoint-ORIG-GUID: xJv-z3zfILvCRtUAw5L9LIdgVs_n_Xf6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX8b0SBQl/i+c3
 8IgJ4KxYFiO3ZMHmrneZciLJrA6GxeMu8/vWaYivMx/ShlCVMZfk6VlixlgWmfpEoI3KSFWrFwC
 +nagEEcqIoLp9r8qj/RPSpoKO5up83SkxHaf1B2NCjrsox5FZyIpvHD4PZG0tPCNR01WccFzqIV
 kgo3bzubjOVu2G9igqlggE8TZ0/YuySMZaD24JStgbJ1X751yZQcvWezoyal5bWsLGgasYXyhw4
 kv2AM89YvMPzVqXsjylzOScFksby7FJZHUfH1lyxfHMbfDPQWx4NljwJIlHQBoDRwlqexTlEymd
 A8/tgRYz1XmhWtc5fqvflKH28yDmmmnAMpA29inhPNLUnWnL5IpkUp9fm3s4NFNnBEWzNIK+AD5
 6BvgU78P6ILa+o5PXYTtICuRm85RQA==
X-Proofpoint-GUID: xJv-z3zfILvCRtUAw5L9LIdgVs_n_Xf6

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 9/16/25 14:26, Kris Van Hees wrote:
> Because alloca pointers are stored internally as offsets into the
> scratchmem area, they were printed as small integers.  They are
> now printed as actual pointer values into kernel space.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_cg.c                          | 46 ++++++++++++++++------
>   test/unittest/actions/trace/tst.alloca.d   | 24 +++++++++++
>   test/unittest/actions/trace/tst.alloca.r   |  1 +
>   test/unittest/actions/trace/tst.alloca.r.p | 11 ++++++
>   4 files changed, 71 insertions(+), 11 deletions(-)
>   create mode 100644 test/unittest/actions/trace/tst.alloca.d
>   create mode 100644 test/unittest/actions/trace/tst.alloca.r
>   create mode 100755 test/unittest/actions/trace/tst.alloca.r.p
>
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 7d542521..1f120e1d 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1687,18 +1687,42 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>   		align = vtype.dtdt_align;
>   
>   		/*
> -		 * A DEREF of a REF node does not get resolved in dt_cg_node()
> -		 * because the ref node already holds the pointer.  But for
> -		 * alloca pointers, that will be the offset into scratchmem so
> -		 * we still need to turn it into a real pointer here.
> +		 * Alloca pointers are stored as an offset into scratchmem, so
> +		 * they need to be converted into real pointers before we go on.
> +		 * An alloca pointer value either has the ALLOCA flag set, or
> +		 * the value node is a DEREF of an alloca pointer child.
> +		 * If the alloca pointer is a REF or ref-by-value is requested,
> +		 * we need to do bounds checking before turning the alloca
> +		 * pointer into a real pointer.
> +		 * If not, we should scalarize it so that the BPF verifier does
> +		 * not complain.
>   		 */
> -		if (dnp->dn_kind == DT_NODE_OP1 &&
> -		    dnp->dn_op == DT_TOK_DEREF && (dnp->dn_flags & DT_NF_REF) &&
> -		    (dnp->dn_child->dn_flags & DT_NF_ALLOCA)) {
> -			dt_cg_alloca_access_check(dlp, drp, dnp->dn_reg,
> -						  DT_ISIMM, size);
> -			dt_cg_alloca_ptr(dlp, drp, dnp->dn_reg, dnp->dn_reg);
> -			not_null = 1;
> +		if ((dnp->dn_flags & DT_NF_ALLOCA) ||
> +		    (dnp->dn_kind == DT_NODE_OP1 &&
> +		     dnp->dn_op == DT_TOK_DEREF &&
> +		     (dnp->dn_flags & DT_NF_REF) &&
> +		     (dnp->dn_child->dn_flags & DT_NF_ALLOCA))) {
> +			if ((dnp->dn_flags & DT_NF_REF) || (arg & DT_NF_REF)) {
> +				dt_cg_alloca_access_check(dlp, drp, dnp->dn_reg,
> +							  DT_ISIMM, size);
> +
> +				dt_cg_alloca_ptr(dlp, drp, dnp->dn_reg, dnp->dn_reg);
> +				not_null = 1;
> +			} else {
> +				int	reg;
> +
> +				dt_regset_xalloc(drp, BPF_REG_0);
> +				emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_STK_DCTX));
> +				if ((reg = dt_regset_alloc(drp)) == -1)
> +					longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> +				emit(dlp, BPF_LOAD(BPF_DW, reg, BPF_REG_0, DCTX_SCRATCHMEM));
> +				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_0, DCTX_MST));
> +				emit(dlp, BPF_STORE(BPF_DW, BPF_REG_0, DMST_SCALARIZER, reg));
> +				emit(dlp, BPF_LOAD(BPF_DW, reg, BPF_REG_0, DMST_SCALARIZER));
> +				dt_regset_free(drp, BPF_REG_0);
> +				emit(dlp,  BPF_ALU64_REG(BPF_ADD, dnp->dn_reg, reg));
> +				dt_regset_free(drp, reg);
> +			}
>   		}
>   	}
>   
> diff --git a/test/unittest/actions/trace/tst.alloca.d b/test/unittest/actions/trace/tst.alloca.d
> new file mode 100644
> index 00000000..d2ff5152
> --- /dev/null
> +++ b/test/unittest/actions/trace/tst.alloca.d
> @@ -0,0 +1,24 @@
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	arr = (int *)alloca(5 * sizeof(int));
> +	idx = 4;
> +	arr[0] = 1;
> +	arr[1] = 22;
> +	arr[2] = 333;
> +	arr[3] = 4444;
> +	arr[4] = 55555;
> +	trace(arr);
> +	trace(" ");
> +	trace(*arr);
> +	trace(" ");
> +	trace(arr + 2);
> +	trace(" ");
> +	trace(*(arr + 2));
> +	trace(" ");
> +	trace(arr + idx);
> +	trace(" ");
> +	trace(*(arr + idx));
> +	exit(0);
> +}
> diff --git a/test/unittest/actions/trace/tst.alloca.r b/test/unittest/actions/trace/tst.alloca.r
> new file mode 100644
> index 00000000..e9bbf2f5
> --- /dev/null
> +++ b/test/unittest/actions/trace/tst.alloca.r
> @@ -0,0 +1 @@
> +OK 1 OK 333 OK 55555
> diff --git a/test/unittest/actions/trace/tst.alloca.r.p b/test/unittest/actions/trace/tst.alloca.r.p
> new file mode 100755
> index 00000000..8515861a
> --- /dev/null
> +++ b/test/unittest/actions/trace/tst.alloca.r.p
> @@ -0,0 +1,11 @@
> +#!/usr/bin/gawk -f
> +
> +{
> +	$1 = $1 > 0x7fffffff ? "OK" : "BAD";
> +	$3 = $3 > 0x7fffffff ? "OK" : "BAD";
> +	$5 = $5 > 0x7fffffff ? "OK" : "BAD";
> +}
> +
> +{
> +	print;
> +}
