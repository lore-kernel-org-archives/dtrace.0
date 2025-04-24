Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0283522AE48
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 15:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745508895; cv=fail; b=kcagwjMXb7XNRdiDiFi3Els3PYelrwYHgGvaGDuSiCJb0OEGiKZNa0vsItCraPOS1lXuzLA93KX1qot8yGGem+O0dpeCOF/IpCNhPEoKXAY6tRqGFU6qId0ByggBfFbGmMElWnXvAWhWS9SNrvXlVwvzsLE6ifonPx9GV1SKyDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745508895; c=relaxed/simple;
	bh=SmBqJtfecljH6E8fcu1A4d+uElQqNSLi0kdVJ9fJS58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KBbd27qdXNKueM6VB2q6QGRqYT0jq4mY8AksTTfveGso/nH1BTOyJ6BYzMjSV1gpwMPPqINusW06/TcLI3Q+qpMA5qVJsA+o4xbhN6oob9j76aRmgno9ae6Y3PjQSLXyEt+GeohvpcCu6nwdsNTaJXKqW3z18yKAsXwtNK2IiRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lz0bYIji; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dy8YOzBQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lz0bYIji";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dy8YOzBQ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OEq1ii014764
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 15:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=zvKZcd6/drP97SiPpR
	ssqNBNxPRJziaj5Qv5cv75L/E=; b=lz0bYIjimT25tB6evVWuSNO7flKa0V1I4m
	GNqByw6RzHOPvFhrQwW1QhL2OKecF6zUrp203vKO+i9bbN1u9NA3/n8kgyFFmBgq
	qh2ORijYi+gjRBSvbkcmofffhalOHW+6nMdqZhwjdSkIjeoa2h7OrL3cK2kvMm3r
	Byun88i0LLd1P746uTeyDVYkbBoJVlgtcD+++xKix99HaYvhXMlY8Qy3GwcFGKy9
	/diXdRRiHQ01yxRRegiTlb9V21fB5T7SOy8gFn4b0YwUmIWbGRlEmyamy3h9lKU/
	Z3v0HxZS0/UNnHYOVsUt6ouvuarT5DsErEqW5goRiBnlQbB6Dt6A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 467qeg06xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 15:34:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53OFVpUC031703
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 15:34:50 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazlp17012036.outbound.protection.outlook.com [40.93.6.36])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 467gfrjbux-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 15:34:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGCaDEaLzfOO12VCrtQ67vJgDk0mcH+z4FX/DxVK6wc/z0GW4SI/mUyHy/6MrS5D+9BdlrRlcbiKxVMPVHdo7YUqqY/9XvvfAHgwKHW95/MUm/o/rkyxvUCJ2WW04H0VY/ZXkZjyFhghkPYl/nIx5QP7aAgsPuqS3PypGnWbbd/tNe5TE3yuwUZ8bq56FN/l+H7E73PpnkF4a0D6rI8Pc/Plq+0tZ2QbZnJd9aaL730ApsWyX79xOwZC9j1/XkNqqX0PJ13W9o6FpsRea2N2yryfdTnPED923nRuT1uFPicufP9ILPD5teJz+/JE2UyMJo9Kvlni011f+Zx83POKLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvKZcd6/drP97SiPpRssqNBNxPRJziaj5Qv5cv75L/E=;
 b=ibWdkW9JOIqF8GYC+l2u9EEUyop7zrbT3Jaqa8gPfwVX3boemQ9VkQY3XYaXOg5XQDLznJFG8ZlgX/+MkfxmCyOIJHT9wh9bBJsyyGF8p3WKOMr5msC7RdECVRRsmjJZslo44AMp6DWnq9OY6SidEGAzvQEE21kS3RDj+GbTWAsa+C+ogb6TzllCNZbHDWFGDoJpih1FBCzgIGDZFvaIAJHxJ/kcXsga0sc4NYEyo4csD12WDZogecu+myowSkZRm4ZV3G+4kTlZ4kGB1Ieq7AkF/k5evjjtBFcUObLpChFvadDGz3u+nzfLJQqux0pPkA682lMhWWgxMSDyiosXXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvKZcd6/drP97SiPpRssqNBNxPRJziaj5Qv5cv75L/E=;
 b=dy8YOzBQIrllOImUwAujrMGcRijxRF8d9gS2aoInAzXmZnKSFknKNC7OHUj6U+2bouVv6LwDh6jwwUBYxT8XRa1MCcceKEWMqo2OysLGCbFsREQ/fbYrY1F2NofSWnBxPdijcvHhypMRPfXZkGsbC79e6+RKyx7gqzWPnnF5YlI=
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae) by SA6PR10MB8208.namprd10.prod.outlook.com
 (2603:10b6:806:435::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 15:34:47 +0000
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437]) by SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437%4]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 15:34:47 +0000
Date: Thu, 24 Apr 2025 11:34:45 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 2/2] Clean up sched provider trampoline FIXMEs
Message-ID: <aApaFbKvzWSJuNh7@kvh-deb-bpf.us.oracle.com>
References: <20250403050252.15239-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403050252.15239-1-eugene.loh@oracle.com>
X-ClientProxiedBy: SJ0PR05CA0174.namprd05.prod.outlook.com
 (2603:10b6:a03:339::29) To SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7F7BBD994:EE_|SA6PR10MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: a262970b-898b-4acc-6836-08dd83458b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u3gc434ibx5E64uxh90frpgF0AxyxsSzJ50V4kUjpw2O8zTPrGI6zVK8tc+c?=
 =?us-ascii?Q?KMzMZAjiflVqdgHwJNKAFMExWAX9IUiQORVtClZj2LLjs7nQpAVKgKcmNr7A?=
 =?us-ascii?Q?JH7lRI4v8uVMo8OEMwO0vmvvwEuOE9JHT+vweOuSGcAMmmvqIE2MQJVbaTn+?=
 =?us-ascii?Q?k7FYiNjx2JP1mVq1D4Xruuq06pFvfXOTXvTBer292WswZjEuWTGYk+l3daVa?=
 =?us-ascii?Q?Pm2HboCCHEHptzPTebynvhXqxsEcgrm/AkQvGs6dUj/cyOK8yVF1cYW8M7v2?=
 =?us-ascii?Q?ThRmZLdhCb+9EWv7AoUfM28i4l+MRaT1QfOWN9LKXG67HmO0uKUoOhAt5gXN?=
 =?us-ascii?Q?KG+DxZ07wkIPTtINgzhmVACAw7mzz6Hnm4O4VYA2uRMDKsP1eKfBm92a//i5?=
 =?us-ascii?Q?HvcT4P4O2rX6CFri9dZCJKlGzQlDMhP8pxEenS7b2zxef6PH9H7vvtn1IgQw?=
 =?us-ascii?Q?hAxM5O7jvazuIO5SrdhG/jhitKV89Lnh3wdGeRV3HqOgg+RxYTH/X5+4yqmc?=
 =?us-ascii?Q?xJz++TMW0a7UbA0wJCdpO/eMfcDdvm6LBQLj2jpMMkgeK9ASGCMeVTXysW2U?=
 =?us-ascii?Q?qpDjpXAdQ6IK/69Qu/jU8L1hYl6HPE4Qz4Ad6U1GUSRnephOTzCLUrDhPhHC?=
 =?us-ascii?Q?ooMrxLnxa0m6g0do2QadKKD2kInrOwh0fa1fqtwJAvyqSUreGnh3aUarR+7E?=
 =?us-ascii?Q?b1gEVMS4RpeWauR4necGffWYsgx1zjNCkszg7/oDHLNWVk7GLgS1uXhe0BNu?=
 =?us-ascii?Q?OdrdUIwt/tuHqXj4Dp0AWb0s1rlZoVamN7QYs7ygfqR1MC5xfHGA4xSf+JqS?=
 =?us-ascii?Q?Sc/gQkry4c5792atYydQxjtPTYxZb+HKhHgLPxDu7AO1QF3Db6+aHzO6Xnoe?=
 =?us-ascii?Q?2TVfKNDfU/TUInm331M2H/s2sOcvUDIa8WMwdCiX4XVPtS+VNs0g8yoj0L1M?=
 =?us-ascii?Q?G41dq+4VOohdcjNacayXdHslX7eVdMn2dQvGkDPRkHTqcFzm2Rr4akg+ioOg?=
 =?us-ascii?Q?zdIwfWuZjF/cs/KZOdomXw3iMaxLLGwamCT5+qQ25bpvti7qkz6J7jm/ZA/s?=
 =?us-ascii?Q?D/+lUVH1J087ORov4Ksj7RFL54+AJdKUUWCc1AHVdUVs6O3sNWZXplmyKqes?=
 =?us-ascii?Q?FRbOORw0283bqqF414hcW13Lo0cnJA9AfrdSkM7RQMqFHd4gCt6Pi2plXT7O?=
 =?us-ascii?Q?P0o+hBDijmDW86lk6JnUMsF2PVLvn0jpNNcZKqkCwpijWA4wQ1oUWbE2TQbL?=
 =?us-ascii?Q?FWVjgqfX1AnwyUgSUomr0KTdJbiEc6JAPp4SzdKPygnvs+p+7HQQJYoYDW1h?=
 =?us-ascii?Q?DZu64bSKrsPXrdaMgASc3w0b+TjpS3YEPNUrhY/Giv1Kkd231QiWn1DYZR/r?=
 =?us-ascii?Q?LeLDPwnVN7volLjq7zSF2EVKR84bPq4abQCUNN1hOzkN4D02HyH1LK4zLB5t?=
 =?us-ascii?Q?mCgSKEZtoyk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF7F7BBD994.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q472dcyJRVgj2jIRxv/goB9S1qUIB822optmD4AMoah5JqHrW/DmN9G0mtve?=
 =?us-ascii?Q?pnu0SLw30pELZlpm2WOAq+1n7NwtKX3IAvTaOOSLYDRm7Re9VcJi3TroMtTz?=
 =?us-ascii?Q?KeCXLmd9R4PW8aFJusJSPEkWt+1x1uNpZDPy+AVxPNR99Io7u0okbTfRZJZG?=
 =?us-ascii?Q?24oJLaEfSTVUjms/EcL/ZNQ+ix7zIaDqHLK1aSZFzRQ5u6/8HduKTiPccrU9?=
 =?us-ascii?Q?BtSW+A377Fa82xF/cHdyyFkHVDNkmzcijEY4illAyf9ojmvwPKD3fV2N3XTw?=
 =?us-ascii?Q?bio0h/lKR+Z3ofszC/0vjjkL7Odyp/xLexVAZpLol9KAc3TvomqwDfwgH13+?=
 =?us-ascii?Q?CyvRTg74JcRxeuP9oNzQ3vvA/D4CwB+WOEEkkA+6+TiKMU3dh9BCl9QRfF+2?=
 =?us-ascii?Q?wESLD7sNgpJx0eCr+V3ah3Xs+jm5Nga4PgV2S3kkNgkx5iFGUvg0n5Of7qLL?=
 =?us-ascii?Q?A7BSMRkzlvbd+JV9916NgWNwxCCfvmZbG30vpn/ucp2KVrdWCdybV3muCZSk?=
 =?us-ascii?Q?iIk2pTn8oqWhcsuv7qWI9GZfuvLEZrurieoD9MJPbGN/7TzCgbuEiIEppnNW?=
 =?us-ascii?Q?lvgZD6bpM3tNpWodSLKZlHZwhR/8EnBwe16OBLr2d2XGVyqQ7VSKbJXwPULC?=
 =?us-ascii?Q?y5GS63sf0YGfDN2VZn/HGmTIHYStWt3wIL/C2i0WCFhsem7uioNsYb9WSeUw?=
 =?us-ascii?Q?S+SD/OcF4rTMFGAO7KZFUHT1zPi3eydmr5hZjRrNHztUVOaI6Nsd8OCY54r+?=
 =?us-ascii?Q?zXtFRgwVKzSHX3KidCQSXKjz6/4fKsFMSUN3h+zO+9WYd66Phxe08HvJNCgv?=
 =?us-ascii?Q?Y5YeIPu3FrNXeie0EvhiHJtWyXrOEUgWYuuHmV1E/ZC60kNECSbRQZO/hFvz?=
 =?us-ascii?Q?OE7jDaomO6GM7SAdLOPi95AxS6dZ4BpbAw4bw3E3oqcjlUZUZsivtxbS6GJ7?=
 =?us-ascii?Q?5rt6CImm7HHghHqyYRCN0pd+krMm9QSpy5RlgLEH10Oda8vEoGSFV+E90VFs?=
 =?us-ascii?Q?rrjoCunVpQgNTVJAVZl7I3zPOYzDBTqLXM+Ka8InxeTI0dmW5mkZNc4pooii?=
 =?us-ascii?Q?lW+FXZ7cjfl0HpkWpyhHL0rHK/mwnwhT+joaTVBG2OluuXWzqPqjWDNtIGh4?=
 =?us-ascii?Q?Di4jHe/UcvhuCGd/tw2T++BeAA5xd7EHdj9uD99TfPOkdAspORorMRTi/Us5?=
 =?us-ascii?Q?U30Ohz7i4JGaapShhua2Yt3LYWDEIn3knlYW2EL6x6BvImcOAS48yk8fVexM?=
 =?us-ascii?Q?ayJ+I7TFNDxXLUAhoV8nH2MLmUdfoQ48X3iD26bCU9/NatmpRjT1lCdIdWFI?=
 =?us-ascii?Q?LfUQf8o4mwsDLQq7vpX1GwGcX5GBIgmavPajq0LjPpMbnrmTrdIooK1+rXBZ?=
 =?us-ascii?Q?0g3/IeHAe5DmtNE/fbTbyT+Ubms8Axzuob7MAJXOvxIVjlGTYWauTbug1GtG?=
 =?us-ascii?Q?dqbEvpYPufNxjedsIiJnS4YLqwyoXTbsejX6/HxOieCFPyxcdJrbrBauAIPR?=
 =?us-ascii?Q?eE/9jdBlekBt2Z8D16vZQEA9qYRZGi96HCvJ10LH3ioRQEdPzF0xEqggPDVQ?=
 =?us-ascii?Q?pnu72n1/GdtO8qc+UdrdOgzLUvuTyVn0utzyob1UaMlNJv442pFEseGSfrBi?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KN9mssQhwLYzigclgS2+yyYhyMExA6qwOtSYn++3AjQhnOVQ4KSGLWXHdW7owf9/iU3lFjdRDxYv+XMO/3Tdlad7KYRL1ZahXglb74J6Nd7eYjpsJvUyOSo7eJ43ac0QXApu1utsb+opNsZMLHoJHoCEtAIEVG1dUcW20pVH1rBSt4oFETExj78u6WvYXduQpk88DVGSm5b7p4Ok28sAcyPyw8oZ4r/v+K+1T6ZAW/vWcieW79Qd5Qxqr3jQxJagd3r9CYNf5A/Un7meSZrrpAXEUKcfyn8yNuhc75Jhbkz78dACa0IoOaMmEHyi+upDvr2pRHDYV83oiAQEaWPM+ZTOe70V30aDS6D8pN+jDkLbDmViNzKgFjwd9iE5gk/SuQG4v1Ml5JBgyVOWXFtBvraZ5SK7Z8PaMV7ihHSMJXwS6JaqgPzsMwAd0pYsJai4SrPDZ64ICC9jMuwu+We2Bp0wGIFOvzIcYh0I+e7XNy4Osj2m3NYC+JgNILqzwkw82/UQXg2eFeQ3gTykd2ej5OlILMfmXik3zh5YyueImvfRaR3Cy8MKfBecsjvrT3aT0WMhSYTbqla2x8Py8olIWLYarD2LSsgQPvucdR8i9xQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a262970b-898b-4acc-6836-08dd83458b69
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7F7BBD994.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 15:34:47.3559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bTf9OHtde/3wKdqSOsjh0hIW54Tx1JUL69psL1Z2HteHJmDlVsL8pnPH54TKt3Oe0U96Gv4l3edmLTsENFwcfWms0j0r8hYnRIakP62O5W4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8208
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504240106
X-Proofpoint-ORIG-GUID: FN6Mi3d0bknQ2u7FB1TJ3YOQf6y4n_8W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDEwNiBTYWx0ZWRfX/pTAYLYyDWt8 gOLoqxxBA/Q1NqlsRekysxB0bjElNtmOpfZgmxj8NbyPpYVetCrYKB1ly3QpkhlpffyQexj8nQ3 YV0HN+pJdOQisL5hZQfMZZt6BtTif8M65l999GzCn0WyOl8DDp58uSO39cOdx3CVdMkA4NR3aU9
 wNnHLk4+I5Js71yrK1/5lnJg73pSYxAmd2dDnr+f2oxnHCPjTbbwZqZZekHXj+vz4NqYqES+d7U DTS+l8wvW3HXvQTbQsJjw80yzi9E0owG3234v9o9HTDSYTPboqtbuyFySm0E1M9S2/dPSGnO0fM I9sYyvNi1v29mBAZQBHBkx3V5hmsPQzQIDowl3EqAAfL3iF7wBKmWQ07MQZIHumkJBC9JZBlh18 5wVXFnoq
X-Proofpoint-GUID: FN6Mi3d0bknQ2u7FB1TJ3YOQf6y4n_8W

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

On Thu, Apr 03, 2025 at 01:02:52AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The sched provider trampoline for enqueue and dequeue probes had
> pending FIXMEs for providing a cpuinfo_t* for the cpu associated
> with the run queue.  Implement the missing code.
> 
> Since the cpu associated with the run queue might be different from
> the cpu where we are running, it becomes necessary to access the
> cpuinfo for some random cpu.  With Linux 5.18, there is a BPF
> helper function map_lookup_percpu_elem() that allows such lookups
> on per-cpu arrays.  To support older kernels, however, we change
> the cpuinfo BPF map from per-cpu to global.  Also, it is a hash
> table rather than an array in case cpus are not numbered consecutively.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  bpf/get_agg.c                     |  2 +-
>  bpf/get_bvar.c                    |  2 +-
>  libdtrace/dt_bpf.c                | 34 ++++++--------
>  libdtrace/dt_cg.c                 |  5 ++-
>  libdtrace/dt_prov_lockstat.c      |  4 +-
>  libdtrace/dt_prov_sched.c         | 74 +++++++++++++++++++++++++------
>  libdtrace/dt_work.c               | 20 +++------
>  test/unittest/sched/tst.enqueue.d |  1 -
>  8 files changed, 89 insertions(+), 53 deletions(-)
> 
> diff --git a/bpf/get_agg.c b/bpf/get_agg.c
> index c0eb825f0..e70caa6ef 100644
> --- a/bpf/get_agg.c
> +++ b/bpf/get_agg.c
> @@ -21,7 +21,7 @@ extern struct bpf_map_def cpuinfo;
>   */
>  noinline uint64_t *dt_no_agg(void)
>  {
> -	uint32_t		key = 0;
> +	uint32_t		key = bpf_get_smp_processor_id();
>  	dt_bpf_cpuinfo_t	*ci;
>  
>  	ci = bpf_map_lookup_elem(&cpuinfo, &key);
> diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
> index d372b3445..d81c3605f 100644
> --- a/bpf/get_bvar.c
> +++ b/bpf/get_bvar.c
> @@ -67,7 +67,7 @@ noinline uint64_t dt_bvar_caller(const dt_dctx_t *dctx)
>  
>  noinline uint64_t dt_bvar_curcpu(const dt_dctx_t *dctx)
>  {
> -	uint32_t	key = 0;
> +	uint32_t	key = bpf_get_smp_processor_id();
>  	void		*val = bpf_map_lookup_elem(&cpuinfo, &key);
>  
>  	if (val == NULL) {
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 6d42a96c7..d6722cbd1 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -761,37 +761,29 @@ gmap_create_buffers(dtrace_hdl_t *dtp)
>  static int
>  gmap_create_cpuinfo(dtrace_hdl_t *dtp)
>  {
> -	int			i, rc;
> +	int			i;
>  	uint32_t		key = 0;
>  	dtrace_conf_t		*conf = &dtp->dt_conf;
>  	size_t			ncpus = conf->num_online_cpus;
> -	dt_bpf_cpuinfo_t	*data;
> +	dt_bpf_cpuinfo_t	data;
>  	cpuinfo_t		*ci;
>  
> -	/*
> -	 * num_possible_cpus <= num_online_cpus: see dt_conf_init.
> -	 */
> -	data = dt_calloc(dtp, dtp->dt_conf.num_possible_cpus,
> -			 sizeof(dt_bpf_cpuinfo_t));
> -	if (data == NULL)
> -		return dt_set_errno(dtp, EDT_NOMEM);
> -
> -	for (i = 0, ci = &conf->cpus[0]; i < ncpus; i++, ci++)
> -		memcpy(&data[ci->cpu_id].ci, ci, sizeof(cpuinfo_t));
> -
>  	dtp->dt_cpumap_fd = create_gmap(dtp, "cpuinfo",
> -					BPF_MAP_TYPE_PERCPU_ARRAY,
> +					BPF_MAP_TYPE_HASH,
>  					sizeof(uint32_t),
> -					sizeof(dt_bpf_cpuinfo_t), 1);
> +					sizeof(dt_bpf_cpuinfo_t), ncpus);
>  	if (dtp->dt_cpumap_fd == -1)
>  		return -1;
>  
> -	rc = dt_bpf_map_update(dtp->dt_cpumap_fd, &key, data);
> -	dt_free(dtp, data);
> -	if (rc == -1)
> -		return dt_bpf_error(dtp,
> -				    "cannot update BPF map 'cpuinfo': %s\n",
> -				    strerror(errno));
> +	memset(&data, 0, sizeof(data));
> +	for (i = 0, ci = &conf->cpus[0]; i < ncpus; i++, ci++) {
> +		memcpy(&data.ci, ci, sizeof(cpuinfo_t));
> +		key = ci->cpu_id;
> +		if (dt_bpf_map_update(dtp->dt_cpumap_fd, &key, &data) == -1)
> +			return dt_bpf_error(dtp,
> +					    "cannot update BPF map 'cpuinfo': %s\n",
> +					    strerror(errno));
> +	}
>  
>  	return 0;
>  }
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 6dcf4cd3d..d83b1c2ce 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1243,9 +1243,12 @@ dt_cg_epilogue(dt_pcb_t *pcb)
>  		} else {
>  			idp = dt_dlib_get_map(dtp, "cpuinfo");
>  			assert(idp != NULL);
> +
> +			emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_smp_processor_id));
> +
>  			dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
>  			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_2, BPF_REG_FP, DT_STK_SP));
> -			emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_2, 0, 0));
> +			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_2, 0, BPF_REG_0));
>  			emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
>  			emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
>  			emit(dlp, BPF_MOV_IMM(BPF_REG_1, 1));
> diff --git a/libdtrace/dt_prov_lockstat.c b/libdtrace/dt_prov_lockstat.c
> index c73edf9be..8b2cf4da2 100644
> --- a/libdtrace/dt_prov_lockstat.c
> +++ b/libdtrace/dt_prov_lockstat.c
> @@ -121,11 +121,13 @@ static void get_cpuinfo(dtrace_hdl_t *dtp, dt_irlist_t *dlp, uint_t exitlbl)
>  {
>  	dt_ident_t	*idp = dt_dlib_get_map(dtp, "cpuinfo");
>  
> +	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_smp_processor_id));
> +
>  	assert(idp != NULL);
>  	dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
>  	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
>  	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_BASE));
> -	emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_2, 0, 0));
> +	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_2, 0, BPF_REG_0));
>  	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
>  	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
>  	emit(dlp, BPF_MOV_REG(BPF_REG_6, BPF_REG_0));
> diff --git a/libdtrace/dt_prov_sched.c b/libdtrace/dt_prov_sched.c
> index 3a218f3cb..a548e679f 100644
> --- a/libdtrace/dt_prov_sched.c
> +++ b/libdtrace/dt_prov_sched.c
> @@ -84,6 +84,40 @@ static int populate(dtrace_hdl_t *dtp)
>  			       probe_args, probes);
>  }
>  
> +/*
> + * Get a pointer to the cpuinfo_t structure for the CPU associated
> + * with the runqueue that is in arg0.
> + *
> + * Clobbers %r1 through %r5
> + * Stores pointer to cpuinfo_t struct in %r0
> + */
> +static void get_cpuinfo(dtrace_hdl_t *dtp, dt_irlist_t *dlp, uint_t exitlbl)
> +{
> +	dt_ident_t	*idp = dt_dlib_get_map(dtp, "cpuinfo");
> +
> +	assert(idp != NULL);
> +
> +	/* Put the runqueue pointer from mst->arg0 into %r3. */
> +	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
> +
> +	/* Turn it into a pointer to its cpu member. */
> +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, dt_cg_ctf_offsetof("struct rq", "cpu", NULL, 1)));
> +
> +	/* Call bpf_probe_read_kernel(%fp + DT_TRAMP_SP_SLOT[0], sizeof(int), %r3) */
> +	emit(dlp, BPF_MOV_IMM(BPF_REG_2, (int) sizeof(int)));
> +	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
> +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
> +	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read_kernel));
> +	emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, 0, exitlbl));
> +
> +	/* Now look up the corresponding cpuinfo_t. */
> +	dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
> +	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
> +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
> +	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
> +	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
> +}
> +
>  /*
>   * Generate a BPF trampoline for a SDT probe.
>   *
> @@ -98,18 +132,39 @@ static int populate(dtrace_hdl_t *dtp)
>   */
>  static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  {
> +	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
>  	dt_irlist_t	*dlp = &pcb->pcb_ir;
>  	dt_probe_t	*prp = pcb->pcb_probe;
>  
>  	if (strcmp(prp->desc->prb, "dequeue") == 0) {
> -		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
> -		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
>  		/*
> -		 * FIXME: arg1 should be a pointer to cpuinfo_t for the CPU
> -		 *	  associated with the runqueue.
> +		 * Get the runqueue from arg0 and place its cpuinfo_t* into %r0.
> +		 */
> +		get_cpuinfo(dtp, dlp, exitlbl);
> +
> +		/*
> +		 * Copy arg1 into arg0.
>  		 */
> -		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_3));
> +
> +		/* Store the cpuinfo_t* in %r0 into arg1. */
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
>  	} else if (strcmp(prp->desc->prb, "enqueue") == 0) {
> +		/*
> +		 * Get the runqueue from arg0 and place its cpuinfo_t* into %r0.
> +		 */
> +		get_cpuinfo(dtp, dlp, exitlbl);
> +
> +		/*
> +		 * Copy arg1 into arg0.
> +		 */
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_3));
> +
> +		/* Store the cpuinfo_t* in %r0 into arg1. */
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
> +
>  /*
>   * This is ugly but necessary...  enqueue_task() takes a flags argument and the
>   * ENQUEUE_HEAD flag is used to indicate that the task is to be placed at the
> @@ -120,15 +175,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   * outside the kernel source tree.
>   */
>  #define ENQUEUE_HEAD	0x10
> -
> -		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
> -		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
> -		/*
> -		 * FIXME: arg1 should be a pointer to cpuinfo_t for the CPU
> -		 *	  associated with the runqueue.
> -		 */
> -		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
> -
>  		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(2)));
>  		emit(dlp, BPF_ALU64_IMM(BPF_AND, BPF_REG_0, ENQUEUE_HEAD));
>  		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> index 498d5332a..2167ed299 100644
> --- a/libdtrace/dt_work.c
> +++ b/libdtrace/dt_work.c
> @@ -37,35 +37,29 @@ END_probe(void)
>  int
>  dt_check_cpudrops(dtrace_hdl_t *dtp, processorid_t cpu, dtrace_dropkind_t what)
>  {
> -	dt_bpf_cpuinfo_t	*ci;
> -	uint32_t		cikey = 0;
> +	dt_bpf_cpuinfo_t	ci;
> +	uint32_t		cikey = cpu;
>  	uint64_t		cnt;
>  	int			rval = 0;
>  
>  	assert(what == DTRACEDROP_PRINCIPAL || what == DTRACEDROP_AGGREGATION);
>  
> -	ci = dt_calloc(dtp, dtp->dt_conf.num_possible_cpus,
> -		       sizeof(dt_bpf_cpuinfo_t));
> -	if (ci == NULL)
> -		return dt_set_errno(dtp, EDT_NOMEM);
> -
> -	if (dt_bpf_map_lookup(dtp->dt_cpumap_fd, &cikey, ci) == -1) {
> +	if (dt_bpf_map_lookup(dtp->dt_cpumap_fd, &cikey, &ci) == -1) {
>  		rval = dt_set_errno(dtp, EDT_BPF);
>  		goto fail;
>  	}
>  
>  	if (what == DTRACEDROP_PRINCIPAL) {
> -		cnt = ci[cpu].buf_drops - dtp->dt_drops[cpu].buf;
> -		dtp->dt_drops[cpu].buf = ci[cpu].buf_drops;
> +		cnt = ci.buf_drops - dtp->dt_drops[cpu].buf;
> +		dtp->dt_drops[cpu].buf = ci.buf_drops;
>  	} else {
> -		cnt = ci[cpu].agg_drops - dtp->dt_drops[cpu].agg;
> -		dtp->dt_drops[cpu].agg = ci[cpu].agg_drops;
> +		cnt = ci.agg_drops - dtp->dt_drops[cpu].agg;
> +		dtp->dt_drops[cpu].agg = ci.agg_drops;
>  	}
>  
>  	rval = dt_handle_cpudrop(dtp, cpu, what, cnt);
>  
>  fail:
> -	dt_free(dtp, ci);
>  	return rval;
>  }
>  
> diff --git a/test/unittest/sched/tst.enqueue.d b/test/unittest/sched/tst.enqueue.d
> index f445ac843..28dcace8c 100644
> --- a/test/unittest/sched/tst.enqueue.d
> +++ b/test/unittest/sched/tst.enqueue.d
> @@ -4,7 +4,6 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
>  
>  #pragma D option switchrate=100hz
>  #pragma D option destructive
> -- 
> 2.43.5
> 
