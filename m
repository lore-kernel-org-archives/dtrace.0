Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8221B381B8
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 20:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726779454; cv=fail; b=RlVkcGIzgmWeuASOyIUC+xnRpIql6s5z/M/sWUgcXLs98ocZMFX1s6AOJq/Taa7747FWq4e45K24wr0weBAqfhUMHZ2bgP/MUy+8x/VoVkCDDL9uHu79Yyz1Ktall1vcJZAgPwng5+9jTMMhsLMeyywkEoYo2hXtNfD5XMzWj78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726779454; c=relaxed/simple;
	bh=XwK6ywiThs8vz66QUdGB43jP+u+F/XY2Zted6FS0ZaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rEcb65pfQ55SVK7KlO/OrVtagpCc/iLxmIxtRuBaHKZG7GTz+UO58w9ssKpvZSPyeIOilIALFLGQjeYbS6w/lWKxkm+/aLopxhCopTlREQJLdenuCwIAEPLfA84X5OjG5GdEAZDuaMcR1FeyAuUWigN94O///S5YFq/xYZyYqaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZFpRU8Et; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OKM9LoSg reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZFpRU8Et";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OKM9LoSg"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JKjw9s020375
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 20:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=GoNS9WYK3r5fbU6xdQ6NoDEyP6SLxLdMokGk21wY9+A=; b=
	ZFpRU8EtQ4Re7+nUVnqYMouyykEdyKXidMcWG5J62wkln4h+saemKJS+GJK0EkF2
	D3Lnx1471nF4tZ4seEDoXeZSS0vJ7NJYMKCH927+7GfDlU/YKtEdWoyfgTbMNB1d
	1t6+GPMi2uMuXy9eN1EL9t6zQ+m6t/t8E5Da3V1J2MuKgZpsWR4pJX0K0KflQJ+x
	s+/hBOi+tTvQ5UuXQZ3EQUM83o2KrRKlxWaYvd0s5ITTfuKVuv4GjYynDJlXeam+
	ZV2H1KJ7QBedygRvHxsSn5tQvwkt3relHD4A+A0j7EuOnDJUdkZZkOqx3YbEzt63
	aKHg04d+z18b/0jeXkjCWQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3sd5abm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 20:57:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48JJnWw7008105
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 20:57:30 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41nyffd9ea-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 20:57:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIxN5TquEIiJ12vnppudTdlggWikG88uhN+P8zPBRoCvELOY7eH8pobFGrKMTh6PBKs2x1isv617zIZfxrpwuVZPNth7KhGBhAcG4OSsl38B2UmAzmN8NYyDjagONCpZKCJPvqhxN+ylGq6wCMz+0PpL2TcYXQf/4kkTpY//q0qk6vt+Ty2VoDbfDZvWu0Uc4wUDgmpo6Xyx3Y9Uz5IoNoDwjaeUNXcBytXrFvdcVrafPdUAeIub5YOHfyVLRgs4x9m7534f1PD9wPVV6HXFvw9on7ceXUc4SrJJBVx4eHaeNzai5tJzMuspBk8IT7ExJODO+KW47K11MtYZRAAK4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBdssw6QFoPazZupf0PNrMmrRxYQA+2claSlFerk3Xs=;
 b=CO6Uhx3UG4b3mxl06vyxvQsjrmlxtaLYRKUL8f2bDJdiM6C3H/dmT1FIjS0K58ejOdkLUiz47pvnNKTP+4xOuKNGqI7vRze7xm/kJBCbYTk2xVr0/SBV6OZh7uTMi+g5tqLqBiu53WowV+IdkFZyNa//YdPoHKpCyUVxBYJdLlrCdbCn0Nh/4w+SrKAtXa6+50k8bHYK6MMq0O9FcCiwPng7lpAESzK2th5uLwzsRWkVOq69mFMLr09ii+LA9qN2Z115aRnWrOzfet0JrmvEvR3f8VK7N0GQHOy0JrZz4ldfnpazyJX4R7LAUx+FSvlWl4QXH/cNR7Y/ibwBTPUiVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBdssw6QFoPazZupf0PNrMmrRxYQA+2claSlFerk3Xs=;
 b=OKM9LoSgVmyyPLJbijPz8bzzo7WY9cHNvLhcI1y/Ysqsq68+R0dZiBTc2SUpE8AhldpVTJOqEhfO+sjG4J4eJkNmy2RFbMlfj4udUmQOk7C3VXn+nS61AJ2F2/13OG/njwV5ouaTiqNZcQNUUqGugbqDjW7WzinoP1E2zLhZp4U=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH0PR10MB4711.namprd10.prod.outlook.com (2603:10b6:510:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.10; Thu, 19 Sep
 2024 20:57:27 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 20:57:27 +0000
Date: Thu, 19 Sep 2024 16:57:23 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] options, test: correct bufsize calculations and tests
Message-ID: <ZuyQM2y6REtQJQsK@kvh-deb-bpf.us.oracle.com>
References: <ZuwfFjKdHQvlxuSU@kvh-deb-bpf.us.oracle.com>
 <f40cc706-20bd-e0ae-9e08-ba3a450e4b54@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f40cc706-20bd-e0ae-9e08-ba3a450e4b54@oracle.com>
X-ClientProxiedBy: BL0PR0102CA0062.prod.exchangelabs.com
 (2603:10b6:208:25::39) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH0PR10MB4711:EE_
X-MS-Office365-Filtering-Correlation-Id: 25202f62-f0f8-44ea-c4de-08dcd8edab67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?UAKq8w5Zi9EJ7LUyJSH5lSrieD3dWxYPIfaYuM9O/4MDiprooxMDZYd+I3?=
 =?iso-8859-1?Q?wvu4QiEg4c/83POGf/120+Qq2sZ8gazF4JHT27AxYKEJGxot/Vi7rWmqRe?=
 =?iso-8859-1?Q?/BBTE7xcP0+umzsY6bUT5aFmrW9+dxyBfG8VD7+65wvJBeMZj/wVbDXd28?=
 =?iso-8859-1?Q?tbygfsV8ljcV0YJTHbiB+vU/VwnebbKlZYO8isPUdrnqhRWzBLAgWrke4a?=
 =?iso-8859-1?Q?Ta1HaB13FFLrgmXHkdZLrCVrufrRBjpdH/tZBW9Pr+KvFI0ObscOk28akE?=
 =?iso-8859-1?Q?BORgpwIAlko4dmatKm44wPNj+vyLsqxjaBdrLJjQbpKqY11TtenXuzMgaM?=
 =?iso-8859-1?Q?cbQzSu/9Sj+lpCssFz4XT1/8qzQpxSgcUTOpe6CnqiHkJYL/w3Sw3hJ4qG?=
 =?iso-8859-1?Q?y/a71+rAj0awdEImihHYrHEOZN5aPsL/WENdskQZum++AodHYLPnjYZxce?=
 =?iso-8859-1?Q?MLXGxLALb1TQT/7xCjXayPJONE77mX+MJ4lPYvoF0Od7ejpJlCmlXs8C55?=
 =?iso-8859-1?Q?3oWCHQP02zOd1Dg6Brj5jZyN5H8HqW5+O2iJLFvjl/Obq8SzhiJazhkBaq?=
 =?iso-8859-1?Q?C8Mt61vve6CZHEiVQej7iST4nqlIM8JJsNd4ja+wXLi9ONcGBKghvbfCxy?=
 =?iso-8859-1?Q?dcdIIL5kTCJNMNms6kHpYUmDS4bQnYhDlbT93ll4z+zNQyt+RbQ3Z4m62F?=
 =?iso-8859-1?Q?P7i68VBgfMY78fSIDGUIUJUaRqidEorDsOp93SDU++wZCBEcYGhwX9jd9U?=
 =?iso-8859-1?Q?VMqWBYWD0H4pMQ9TRNSw7xJsVDKRFmippHDezwfADWkJWYpKilWn9FHUJK?=
 =?iso-8859-1?Q?VvIoNu0pIyqyoVnMB4CYmEiFe55qwh9JOtVzgMOps68va7wUyuNpNsxNJ/?=
 =?iso-8859-1?Q?AbI/2u9r10ogRNPL2YJGGRTMmKaJZ/xhVp9XSaJSJlhnnQ1NKwWed+fM6n?=
 =?iso-8859-1?Q?jemje60HNsyt1e45LpuVozlfF8pWyDFO0XKkdc5iGivwkbteRy72MQ9bwG?=
 =?iso-8859-1?Q?0D7mwvPua7yWvRrvBiK4R4K/yXrvFEG7wIuOthxmLZd14esf6iqh0ew3qQ?=
 =?iso-8859-1?Q?+s0Q72D2VTmZ/QcHesCsyBR165RKVaj6fwzLydokHQh1aA7uAhrId3qmB6?=
 =?iso-8859-1?Q?gfQkjWEv96ogAwkdeu8OaVaZN4oGtXSTENrDG4KoqYgnD7C5cFCl7aH8YU?=
 =?iso-8859-1?Q?LfXrk1E0zYv1bh+G5Db2gAkDQskDgN6tuL0y9h5UTZEI5YB9JCnzAdln2D?=
 =?iso-8859-1?Q?ow1MTN1nvTubQpkthYCsrY9t3SKxMw91UmJLeUDL2CCLDPb/qerL/RCcKY?=
 =?iso-8859-1?Q?VajlN3tpeJyFllIU30IEDmZgmBkbH9BCzomdRqJx/NgmiNpMNYg/VA6zHL?=
 =?iso-8859-1?Q?uMyud//fBEtVyV7/t4M8/4DKuM1F91Mw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?sB87fTFXabNu6e3uzLqtSvE1bgZXlOARI35ye/NpU7/exEVC92u3+o7TwB?=
 =?iso-8859-1?Q?CYcL0z1xOYgY3miIZHCRwPql0i0E/joes38KgxrSmYfxlY/0Sse+NaH/wd?=
 =?iso-8859-1?Q?1JJvK8+TZppQEchAh/85RuMAdMhS8g4I1x/LDRyQIFRkpRyVdJgRmYH/kC?=
 =?iso-8859-1?Q?XReoiv/EDRE0TWD/hu15KXCABtO/92aZHA+L+XzTfzveflo35RDtTqKz0z?=
 =?iso-8859-1?Q?eLrxhNdyQMPGTPzALN+RX9t/en+nJX7FvbKoTUUrUdgtChfSRWagHezWO6?=
 =?iso-8859-1?Q?Roo5du8W3Bp8FeXbikzPz67HOXgNxl/N11fqIu5KzHLetdkYVESc+Sibi5?=
 =?iso-8859-1?Q?qet0BPcB+hmsKffT/cyBCNid7tfGkYSXK1HcqeIGOiR3G7XGaqD1BDwG+j?=
 =?iso-8859-1?Q?FTPXJMRo+F4Nwnd2heJKtRVjYyqPrvAtDfsaYuP9Qe/ebJJ6rpz+wVE+Eq?=
 =?iso-8859-1?Q?o6xAMqNlCly4VN3NCTNr4B2jhtLnVgqyko8USmFtxRqX9S/EfHlal2eWTQ?=
 =?iso-8859-1?Q?SRGn+oLtWbYF2fj78PqtNvnXKEjQ2a53g26YDGwIk423KnQhckUMf2J530?=
 =?iso-8859-1?Q?mP21MZH/GN4fkkw0+/67gaChSDv+izKV8tQWKuRo/UYCBQlohth9QqQkMT?=
 =?iso-8859-1?Q?/T1f1sKAH18NfLb2Z0/fakkFZc15soHgaBWdN1BPUj9+gXim0mkFGdCSPA?=
 =?iso-8859-1?Q?7b6W4T3tG63DwLgFeX017Asyu+8ZH+YsXsYANF5kMn5/so0fi0J8+E78ZX?=
 =?iso-8859-1?Q?Nsko0Htw0APUH7EPy2qciWDcXsKA26iAiOH/FkeA6RWR9Jsucm1MTl3tur?=
 =?iso-8859-1?Q?q2Hlo6uK35gdUbxeb/1kt9LBXipiHLFQMSNAmbjM9gfNCzchSsIifazPIs?=
 =?iso-8859-1?Q?bXe48tTHAQRtOUligEMcNlx/nwwMdpJWLmsHdMGx9PptY7MeWrt7uZnQGI?=
 =?iso-8859-1?Q?3ziIAOOvk7OBsWhxdVd3H/915XQIsq2YRo2sNoKfeBtoGvLozlgiQ9E8B2?=
 =?iso-8859-1?Q?wE/c8qsrsvP2JN2H+Sy8VxXoAgyYNRnAocP9eh6fKa9iGDj6rdU1JU3Gju?=
 =?iso-8859-1?Q?qMDN2dRAXu01/YFac1eUqs6Xq5nkXI9aifuxowdXwjAtUMPMlVM68Zwu8+?=
 =?iso-8859-1?Q?P9LOT/tj2p1BSgcKGvAyo3fxruk1M32dHwaCIqsgkYPMpg4MAI+eljdRkG?=
 =?iso-8859-1?Q?/lfU2HBkL63H++RnxwCF+puz0emZ8rjhMZ0CYoJjtBQ/rRX3vZqQv8r3eX?=
 =?iso-8859-1?Q?nBMALn+2TQh4ba/rC0+2m3U23FqpnBjUV/qdgfydLat9ScMbRpU84WYqHK?=
 =?iso-8859-1?Q?HZEvgdbCR3AEtsCKipeCJgalLcrMaKXxmEEAi2axI+8nMlI4r/VhsvZZiE?=
 =?iso-8859-1?Q?74jj5lYZEAvXt1/qygZTRG0LEJG1UNlxV8CfY6lMJdGXHG62W6L6ZoZ9V2?=
 =?iso-8859-1?Q?SPmigFsL2J0nzHzmZpdDbOYII+aKF2yXnneGFcM+6ZeWFK9soPUVbrVVwZ?=
 =?iso-8859-1?Q?cgnG0nSL9KR0TBVHkYNuPhd4SxuJw/Pwes439N2vPgVi5yRH9HHxSVGr5x?=
 =?iso-8859-1?Q?5AZb7Th3z+vHBCBPoeMw3ZMV8dX4piHhoobZwpUXNDqVIh7kAIFGlFDVcC?=
 =?iso-8859-1?Q?UrIy8ICsO29nKopmohKM9HIiYvO2dHvhbHWCVaRJtbjN3y6OVLu5xuLQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X5Y/OjPq3iC/DAJ1ciwa8A8+HNS05R6oHkXc9Lh7GXf9wAjLrn3LEyOq4NiVUuIXVjXx8VF1FlklfQ2zWPoW2XbbYT/+11vA6qkgVvtTY4YKttCTyKkPimax7wTxAECD3RW2NToqvUSLo6kzHS4T0xTHY1hpU4bmVeBC+uvKJ4VEnWO6E2+t1EN/mej2QsDdoRWtvKaMuDreHetanRhSp+nPAH6/SrC9hLO+mP+5LqsssaN04AV8mwe+L4fOKWeZ0fJa7vnRFSPtaPDq8ql2eEPh9JJ0UcjLSwENhWcmVezoPLfb3K6yiZXgru5iSgzKSiqTc2HEKAtUFuDG6cu9poE4bg1J3NIRBa6b+QMBI0KjVyE6nx0Bqd/Q1HsRnbWgaaagjgXb18HOTv5PjI4Nuh6+rEsN1+Xra5kg8VhKwEbngP/IcuC3bEW47Emq26oD+BFzvQA+B+Hp6+JL0XPvxgASC9MMjON0hcGE5mHh5RXohbLsT25pxioReA8pMGD2RoEChZs06hqqPSvcwhw03VQQG0RxDeuhb9HJ1MINg4ePKMveaniSBRDvK09dajWm8vz/Ugc0nMgcbO58cjq1x6JhwHKkoSC7+ZM49xvSBq8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25202f62-f0f8-44ea-c4de-08dcd8edab67
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 20:57:27.5700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUL51mdUAOfydTboGha8Nw5srFeeHqjO9YcdLIZPuzfqhz+keL4WTTK1jG7rTOmQdb7EWoNhIfD1CmcuG5xizLUHik8mozUWoo67FcVSLcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4711
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_19,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409190139
X-Proofpoint-ORIG-GUID: 3YeNrdvrWvv7ieaePCaVUofMUAKKWHTU
X-Proofpoint-GUID: 3YeNrdvrWvv7ieaePCaVUofMUAKKWHTU

On Thu, Sep 19, 2024 at 04:39:26PM -0400, Eugene Loh wrote:
> As we have discussed, I do not see the point of such a check.  We change the
> user-supplied value anyhow;  so why should we check it?  How about we come
> to a decision about what to do about this auto resizing stuff (which we've
> changed since legacy DTrace) before fine-tuning what we're checking.  (FWIW,
> I vote for no resizing.  The user typically has no need to specify a size. 
> If they do, we cannot guess if they want their size to be a min, max, or
> what.)

We have discussed this at great length, yes, and since there is no resolution
yet (because it is a more involved problem that needs discussion) and yet we
have failing tests, I think it is best to make sure the tests pass.

We can work on a redesign , but in the meantime, the tests should really pass,
and the current status quo maintained.

> Also...
> 
> On 9/19/24 08:54, Kris Van Hees wrote:
> > Reported-by: Eugene Loh <eugene.loh@oracle.com>
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_work.c                 |  9 +++------
> >   test/unittest/options/tst.b.d       | 19 ++++++++++---------
> >   test/unittest/options/tst.bufsize.d | 19 ++++++++++---------
> >   3 files changed, 23 insertions(+), 24 deletions(-)
> 
> What about the "too low" tests?

Those pass as expected so no change was needed.

> > diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> > @@ -268,15 +268,12 @@ dtrace_go(dtrace_hdl_t *dtp, uint_t cflags)
> >   	dtrace_getopt(dtp, "bufsize", &size);
> >   	if (size == 0 ||
> > -	    size < sizeof(struct perf_event_header) + sizeof(uint32_t) +
> > -		   dtp->dt_maxreclen)
> > +	    size < sizeof(struct perf_event_header) + dtp->dt_maxreclen)
> >   		return dt_set_errno(dtp, EDT_BUFTOOSMALL);
> >   	if (dt_pebs_init(dtp, size) == -1)
> >   		return dt_set_errno(dtp, EDT_NOMEM);
> 
> Why does the code special-case "size == 0"?

I honestly cannot remember why that was there.  I bet it was a mistake I made
when I originally wrote that code.  I'll remove it since that is (of course)
meaningless if t is followed by || size < ...
