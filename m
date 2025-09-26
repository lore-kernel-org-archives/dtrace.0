Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C56221F2D
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913583; cv=fail; b=Odq+T31Cz7gp4n3CQXd8TVLNi5HRPF2qJbi31H/3PFuACCfEm6VZbqqQnBD2lmilqPRMUurIGx7aOVMsfFFyfynHeSj/JojBvjmTOtyY5eg5TM0bQ+hLqFvD1Cp2+/33H0qjwO03hca+mycGqQLMNQk/WeSxzAdv9iEsbudIAU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913583; c=relaxed/simple;
	bh=uwhZMnKBfTrDScaksuf3PAXg28PZ9jUbD6vq+14RSCI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=joSnIoHdonWQKaU30b/XbZO0U3XGFjTjatVq0MJnBZqHJWTZSsrMteONHrrNHNEaylM3uGscwXatanmOFW2HShmb5EyTjgW2SypU7VqYMeWPUdUm8EbD+bgW2Q4/xbx8tXlSc/caYAl51GwZYeyX8CU3Dipq0oX/2obzJKQh8/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mcTbC9fR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ptlDRcxh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mcTbC9fR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ptlDRcxh"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIMr1A015577
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Oz1+05+eum5XairGUR/1MN5FsjbUXzAw19Uh4jKBMng=; b=
	mcTbC9fRndoFQmr16pdGR+rA4XPzu+W27B8pbixFvTcLr/bLwqPOy4koufcG91zv
	Tvl+FL6bwmmirChG15r2s6MtpBWmkj9cdkjkeEfkaaNNMJwhp9Q9s346H8zEMwdc
	cK1+2kHXTYIcXMfDj8niE2+Kc0rQPGI1JFHbVWvfxwl9wHGAwha5NJ0kK7BbI6mA
	VasdHFxmSZJq5nGpPz07YlMcj+7EfZOFbyPRd2qIOlK4L/4JuaIXxZignr58cHli
	ZEY4yuNd8WwBWVpAXMep+CwBoz69sp+ob/++EwvC5gSX09wrGyDnI4j22MRbFqPy
	FZpann3XYroXbm41qnBy3g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49dybn054d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIIYGm020865
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:19 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011027.outbound.protection.outlook.com [52.101.52.27])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49dd82xnvd-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFncjtVN4NrD2o2IZdjAKjHTsFmlcAB4O38JHipEC47yKSN7kdqhgxxfwCS3YWoOJDRZw/i11EAPfUTcuHz0j3kHWPlfWYq2RdyXoW38TOJ/aiB1xL2aL1afJeAp3KXLiINgeiW9D9B62wESAkM3rQ4vlEzGZBhCKb+zlHgL7hrAfTm1zaJOao3eCZJaApd8IG7497TNb3Y22Okt1O45Ody5G8dIwT4AtZ0hCvsomXGqikQ7W5UH0gYYfM8Kv1Z4wmSuPJE6x0ad6qHvQB4SI3REjB336UkVREn8j0+hnb+/R3pdEnWmvPVyooX4XjbX+GtMW/hNKFMVHN+sff0yeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oz1+05+eum5XairGUR/1MN5FsjbUXzAw19Uh4jKBMng=;
 b=FXLK9HppZCRCWbLgUmh1ds6LiuvSwXtiC31UTfHNWDh8gDhaLbGkOt04oqBB//KHZAsR9Q05tPlVjrgj66VOYTKbKJjo8+KKqSSihstNMV2suO5RwoTwKQzrePMQQ7Hr7Lt1TavZUj9Sp3pm2rmFboQsno8/oSwNPlAHx7h0RLljTiS6XzENALCqe19Or5NE24UcWgqg4XB1056pDRjEaQ7Fn3N2oZ+mVCjWNts/3sdmaWu3yd7SAqSam2TBNyioPfM9nxTQ9cVsRKafly9aKny6M6q/I25NbGEZX2VP9qnAUzBnKrHyyc09Ry8nfajLd2iZaN/FNBE78yfEfU5cBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oz1+05+eum5XairGUR/1MN5FsjbUXzAw19Uh4jKBMng=;
 b=ptlDRcxhrMwQx7z4Xe8bI8sb1ylNzCYbl1YIqHRxADqq1fhu4VQImEfx55w3ExZMiK0iINFRldi/IfvEdyaW/RYpWGmr+Xzd2MC+PmsRVgQSLbjC57rn56lXH+/bR6/Be79bfU/lZad1NA05/C/q1PODSHLsEeIXJGBanl79jI8=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by SJ5PPF0687F9010.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::786) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 26 Sep
 2025 19:06:13 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:13 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 09/20] doc: Fix anchor links for providers
Date: Fri, 26 Sep 2025 15:05:46 -0400
Message-Id: <20250926190557.8485-9-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::8) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|SJ5PPF0687F9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 0219797e-58d6-4359-5985-08ddfd2fc2ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkRSUnpHUk1QZEpGaFdWaUtlS1lvdytOWGliVGFrVC9MeUE3T2ZOa0RyYUJU?=
 =?utf-8?B?RWpRMXRCT1FiOXA0V3c3OGN1Wm9Gb3kzMFVDbFVGZlpXU1A3R1RNL24xMC9r?=
 =?utf-8?B?QmN4T1QwYmNQUVJjZTY0QkR2V1gycTB3WnQ3aVBZamZvRS90Ui9EM1VRNkxI?=
 =?utf-8?B?Y1p4V1pndlEwaFRUSkpDL0sxQTVURSt4Q3RaVGhQQmI0d0pycWdwb3k3eCtD?=
 =?utf-8?B?YmJYZm45OWxleVV4SUpOZUlULzI5c0RyWGZBSjVJcy9BN3VpOVV3ekhMOUdZ?=
 =?utf-8?B?LzM0MzUrMkpSSnpmZDVlR3k2VHNaT1dLblhXTTZWb29xRm0yRFpEbzhvYVJa?=
 =?utf-8?B?QXpGaTFOWUtabkk3SEg1ZGN1OE1oRUhGMU0wS2ZoME0yK255eDFxMC96Vlpa?=
 =?utf-8?B?VTBIUWd6OERHQWY5clcyQ0NMWmhBZXdRb0ZpMXprcytXWWw4MzhzdFRpc0Za?=
 =?utf-8?B?VW50aEZlLzh4MUo0S1ArdjBaUldyQjhBdnJlbHhZSlRKb04rOWdUS2dhbjZ4?=
 =?utf-8?B?QUhZODI1WnZXbWJ2MnFhbUJ4MHRkWC9Jd0JGNUVGbmllNjZkdmRGczhScUZu?=
 =?utf-8?B?MGxyT0dOZFZqR2ZONXVSeko2QitZTkM4UW5ZajdlSVJremtWSVBoemxoQWZn?=
 =?utf-8?B?TVA0VTlQUFJvQ0JPYUZrTzlNdWpvSnU3Vnc5MllOSXY0NVdwa3dUc2dFcDVz?=
 =?utf-8?B?SnBLTjM1V3ZjWmpGeXp2UnUrZHovR09PSWl1M1QzSy9DZUlFYlk1R2Q0Q010?=
 =?utf-8?B?aW9ucnBpUWdraUhFR054ZTdMQVUxNU9ZdTJzMHdFOC82OTBaRVNOcUc5MENN?=
 =?utf-8?B?NE01RzNlT1A3cnRCQ2VXcm4wR2d4THJGd2wvRmswYkp2Q2V6bEZlNUw0WW9S?=
 =?utf-8?B?MUhuc2lJNlRaakJ5WjlHSHRtWFFjZjR5b2RoVVNacjA3elJLeW1OaE1hQ3Ri?=
 =?utf-8?B?c04xSlA2TmRXdlpZVitQbkhJZUx6TG0xblUzUlpyeEZZQ1kzekJPM0hGUWFx?=
 =?utf-8?B?bG13RGRFbWxYOG92QmwzSG4wbmhPS1A1YUtSUEJ6bjNJZUg1Yy9CM29SMHFh?=
 =?utf-8?B?Tm4xOENISUNnSkJVYzU5Nm02VFVxVmdEK01SNDg3aFlndi9HNnRVWWlCZGp1?=
 =?utf-8?B?NjB1aFByejFMK3NZdjBPdzhSMDQ3V3pMUzA4cnYrbzNETC81aFBVbmE0dk9Y?=
 =?utf-8?B?ejVBUkJoK1VETGdlb3RxVXdjdUpBSzFOdUZNRzJwcmIxUW9WbEw4S2cxYmxC?=
 =?utf-8?B?Tk1DNkdBV000VGcrSHgwZFdaMjEwbHhJTm92U3VXaEl1VHVPTkZVVTBXLzFD?=
 =?utf-8?B?dm9aT2VNY04rc3JDdXl4ZFlDZjMrVkd0TDUvb2RFblVwVmM1UjA4UFE3QkV4?=
 =?utf-8?B?QlZMWkxVMzNmaFhwY2NmSE12NkJ5SXBOU1h6OFJUdGs2VmhvL1VSQ25wVytk?=
 =?utf-8?B?RlBSUWc5ZjluMmx1aDg0RE81RmtISjF6MU8vQkdDNEMxRGJEODd3U1RwUkJT?=
 =?utf-8?B?ckpONHp5Tnp4YjNIN0ozSGI4dXVVWGlaQ1pYa3lmaW95cDYwV0ducFVuamha?=
 =?utf-8?B?SzR5bFJqTFZuQjdTeGdKdDRKZmRSZDhIbjRQNUNpS2hQYWNoSFNRTTNLbnZw?=
 =?utf-8?B?eEZzbHorL0MyVmZvckMzdEsrekhxcExoY0ZhaDFhMUNQci9USGtqT0tNZjBh?=
 =?utf-8?B?VEU5ZlA5R3VEeXlnSFFyQ0ZvWExJOU1TRXpQTjhicUZoVEFhcjBzL3ZCZEdy?=
 =?utf-8?B?c0RYaUVwanV5VTVvRTlkZm8ySVFwM09IUXppS3BNWTJtamVNOS9hZDlFWFBR?=
 =?utf-8?B?aEhWY0lvbVArcjNUUnJhM0FhT01EQktoTDgzVHdRNWNTNTNmWXZPamlZRUV4?=
 =?utf-8?B?ODlUdWUweW5TUzJ4Y1o4WDFQV1NDQlJ3UW8wOTZDR0FXZUZCTzcvUi9Cb28v?=
 =?utf-8?Q?0PbWXfR+4CYBOWuum7SnvOcj8qQ1urMy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDA4emtIalNLS3MwQ0d2emZRdU4zZm9EeFVIdURWR1RUK1h0b3NNdzN0TXV2?=
 =?utf-8?B?ZkZERnkxdEJLVGtGWVNHclVtSkJaZjluUS9EclNpZmtKWUpWTG5iN28rL1py?=
 =?utf-8?B?bFhkKzFzWTFRN05aYXNQaXEwa0JRZk9ySkRvMnB4dlZ3UmJmRU55ZVdZbkxk?=
 =?utf-8?B?aTgzb29FZHl5Q2JGV2JldHNOSndIV3VOSkFORzRmcHBNb2wvR21naitFUVZC?=
 =?utf-8?B?SXBjZlZGOFhSTC9MRENOYXptWkVrVXYyMVVxangvakduRlJWaGZoSy9YU2dm?=
 =?utf-8?B?d3Z3aFhHbjU4OEQvUllUYTNMaVl0R1l1b2ZPOS9XV0MzS0hqaVNDSWZDZjk0?=
 =?utf-8?B?OVlaYmFzcEhEUnFQN21pS0x0eFp0TEtKcjYvd1ZEaitwdUZsM2ZrcHQ0Y09x?=
 =?utf-8?B?ZU9OTEF1bXB6Und1akxKQjlML0NVTWZKWHdvbW1JQ3JYVmYxSlNUR1Z1cDlZ?=
 =?utf-8?B?UDFqeTV4VjVIb2tRdExnUXpXeGNxdDZON202MmowMnFxV3VGcmtQZ3RNOXdK?=
 =?utf-8?B?MWFSU0xYNlJEQlplOE44b3NXN1I3YjFWYUN3VVVuZ1ExUURKM3gzUUFsV3NB?=
 =?utf-8?B?YkR4YmxDenpiSXlWd2VVOXVMdTdZcDMzcGIrSUhDMmh0VUlnYk5DRFA0OUpq?=
 =?utf-8?B?akNRQzV3TXNscFVVck9aZk5mK3dyU29uR3ZWN2lISS9mUWtzSUxBSWdaMWNl?=
 =?utf-8?B?dkVyUjRsb01Za3NUOWNRZnQ0NlZlVEhKQ0k4RFlPOGpXUDk5a09XeTd2NFBo?=
 =?utf-8?B?Q09WNSsyMS9IV2dmcVlwRmJlN1ZLamcxWlpwSjhKbU00N09qNjhoUmhNNk9S?=
 =?utf-8?B?SmMyd2xORUdrZWxLbnNLcEExZGwvSWdzVldZTTlzNzI2SDZST1crQXh4YUtm?=
 =?utf-8?B?cjljaHd5RGpmSjl1Q0Q5SkhoZ0ZkYTZFUmlPbkZsUHY0ZEw1MTcxeXJ1NENr?=
 =?utf-8?B?M2Y2NU00ZWtmUmNRVmdiWkFZRGRIOHlpMTZvWGVHM1RLc3VjcWpIK2lpLzgv?=
 =?utf-8?B?SmZoL3JGUnpUSEk5eUhxMWJNQit6TGZERHJuVmhXdTRVbkxOYi90YnVYR1li?=
 =?utf-8?B?MFkzU3QyOTU0cjJwRnFlbm1SUitqMW5HclFKdzRpam1YYmtEU2RRR0hvUGlP?=
 =?utf-8?B?ZUlKSFA5dHlqdWJhaGZRT2xwS25EU0U3YmFVWXFvYm13aDQ2ci9YYTVnaytC?=
 =?utf-8?B?cnMvMDRpNlFFcEhRemoyQ0tBbUlPSEk3K25BVTQ5QWcvcDY1R1I5TDhZL3dK?=
 =?utf-8?B?aDh2ajVWWHpUUWhhZDZSR1JqejBuMDFVZWZqL3liaDdCV1NXeDNMZWhweXo3?=
 =?utf-8?B?MytHME9DRXlxSitvSitrREhVSnJ0Q0x0OVhWWlVNRW51QXdqQWpZTHhNeEls?=
 =?utf-8?B?MVRTdE41MHFhdmRta3JrOXFZZ2Z3dmtENjRhdkdQalJ3ZzZUS2RsL0NPb1cy?=
 =?utf-8?B?bytQVEtLZnYvWXZFbFY1UW5oQ0lVSk9kV1haN0QzaHV2Mml6bXl0SVpuWGRS?=
 =?utf-8?B?Qk9VY0Y0T0s0dXgvWjFJNk9yTFg0c2FGZDhoLzdwak9aZ25nZ3Q4SXdFYjM4?=
 =?utf-8?B?V3dIdGdIRzZvakdoTy91L2YxSk9tL1VBVGI1cGJ3UTdsenJkZG1GamNhaFVv?=
 =?utf-8?B?S2dhcDdJL3IzMUhRRE5pV0hLZjhUS0hZNDFTTFVNTzNlMjJmZVB0WHBoeWw1?=
 =?utf-8?B?QjFlRjhwVlM3NEJURXQxemVWQk0zcitFL2loQmNad1BrNFFtckprVDNiaUxI?=
 =?utf-8?B?K2JRdDlQR2ZHdEgzRTZBeXdMblEvSyt4TjhnWTNiVXhVb2JzQ2JOOXZqZW1K?=
 =?utf-8?B?T01pYmo5aTJlc1laRVJWRnJaelhxdm5Jc2o3eWNUbUJkU2lIM3dkdnEwL3Vo?=
 =?utf-8?B?eTZoUFpYeVR0a1ErdFF4cTVoZnZjaS9zZ0N3WERiVW5Fdm1WQUtyS3ZEanJF?=
 =?utf-8?B?UE9FUE9zZ0pMNytIOWVEMTEyWGlzeWtxbUczVklta2loR0lFV2FLcmhuSExX?=
 =?utf-8?B?MDVINlBBM2xTREVxVFZiTEJ3N3pNNzJhS0VCaW9xRUE4MnhjZThhQ3hCcHlQ?=
 =?utf-8?B?MHFXaGYxVld0djVOVm5FazN4eGh4VDhab0pCTnVlWjYraXoyUkR6YUpyNEZM?=
 =?utf-8?Q?/hdXmxwYZ+GGnwU50hpVzhVx1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EWErzWOZxUf7WvYa+yaXm+90ATjJ1TKq2beg9MAihqqiqgpW3O9xl4LY1gbx2GIo4RRPjebRupnfotQuM5XubZQVYlMLe74IaORquyf16mcQgHVxeToMc0PjmqzBp1GoLc9W1IoxEv+5uBqMmlPXR3HqdwEBrWShQQkUtXjw0i1m2fwfNXu9hHCq6cCzR9iKjzUXI4WVOSd0xXcTuHjkQ9IDa31PzbCkP28NFlUNFJH+vp56pTGlS9tNTMdQXX9y1eBkb6IbHyV45QHPm2AwBMV7BfLZQlhSH03vy/NRh4A+46PPutkMjbzg7Tv1jff3xe+bPE9eiMuIAgmb3jZ6MnmF2h1GCpoypDzAbN6NA5tCwwD/DMVGf/Jr0F+XuMJAiDL0NkiI5+h0cPgQ5MlobJGFkvKmKUBcMdZO6XEEAKija4pZtI0/Y27MNrdbD9BsOqtmLk2tqiFXTcNOLMdDSYpKnpuWuedyNhuqNmD7p5iYuwW8inNXbXtBeY91ElZR/958wxWnRXjWJ3ZeK0qkDT43BcHPzKVxMS6bGJoOGYL4oORsqjw3aQ+anBB0nG/gJ8/avFsu7jdf75ajHO6weBMb5d7i/473HQ82lPFHGnQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0219797e-58d6-4359-5985-08ddfd2fc2ba
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:12.9838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6bR0T7i8G1mNq9zSfLcVZVy4lKurvGuh2Qf2hlV4ArS7K5h12r9C8VZ+rzt80GvDBcUkCwcBsNVrtMenxD5DgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0687F9010
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2509260172
X-Proofpoint-ORIG-GUID: 0lVN0Hm_5fliTkBKpEt8wZ2MIn9SVc_X
X-Authority-Analysis: v=2.4 cv=C+rkCAP+ c=1 sm=1 tr=0 ts=68d6e42c cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=gjYIu7wiHatzkEHYBuYA:9
 a=oEsEupPTTIFhgCFv:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDE1OSBTYWx0ZWRfX4EI3kli0Z4Wy
 RXH0qW/yF8VyPQgU0JY15WtvHKwsWQvKkghIK3HbRLI4iXkuALQ4RnQqofukrLqB7ZU9AC2tykG
 PSwh45dbqiu9F0/HfYIuF45iaRt8EP4JztFwA9mqbyso1wMdRS1W7Rvw8ud7Ii5eiwRMVSK5gRL
 dPig29z+U1CLbiEAFK8oTH31lAra6/Zg9iAQOzLr0U8aPj6j9qbncbcugCpPlkkk1ubgGc7r3Dt
 x3grHnv4fYFbK2lVlBGl8/VWjEwuaXH43LxLC7PXdRhHxSRb1NB+mEdyMMaPpe8KwRyDZxBMj1R
 qPEQqBumI7xHbfaf1gZ339XQyJQpNYqLFL81N0UCOB1WAY8WFEYgDA3mtp+y7lgn+bPojWnTxvp
 LDX+NRqYCiBRB3zo4G8xOvjlxZC6sQ==
X-Proofpoint-GUID: 0lVN0Hm_5fliTkBKpEt8wZ2MIn9SVc_X

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/index.md                        | 113 +++++++++---------
 ...ticallyDefinedTracingofUserApplications.md |   8 +-
 .../reference/dtrace_providers_cpc.md         |   8 +-
 .../reference/dtrace_providers_dtrace.md      |   8 +-
 .../reference/dtrace_providers_fbt.md         |   8 +-
 .../reference/dtrace_providers_io.md          |  14 +--
 .../reference/dtrace_providers_lockstat.md    |   8 +-
 .../reference/dtrace_providers_pid.md         |   8 +-
 .../reference/dtrace_providers_proc.md        |  12 +-
 .../reference/dtrace_providers_profile.md     |  10 +-
 .../reference/dtrace_providers_rawtp.md       |   2 +-
 .../reference/dtrace_providers_sched.md       |  12 +-
 .../reference/dtrace_providers_sdt.md         |   8 +-
 .../reference/dtrace_providers_syscall.md     |   6 +-
 14 files changed, 112 insertions(+), 113 deletions(-)

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index 68d1164f8..57425becc 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -186,72 +186,71 @@
     -   [usym](reference/function_usym.md)
 -   [DTrace Provider Reference](reference/dtrace_providers.md)
     -   [CPC Provider](reference/dtrace_providers_cpc.md)
-        -   [cpc Probes](reference/dtrace_providers_cpc.md#dt_ref_cpcprobes_prov)
-        -   [cpc Probe Arguments](reference/dtrace_providers_cpc.md#dt_ref_cpcargs_prov)
-        -   [cpc Examples](reference/dtrace_providers_cpc.md#dt_ref_cpcexamples_prov)
-        -   [cpc Stability](reference/dtrace_providers_cpc.md#dt_ref_cpcstab_prov)
+        -   [cpc Probes](reference/dtrace_providers_cpc.md#cpc-probes)
+        -   [cpc Probe Arguments](reference/dtrace_providers_cpc.md#cpc-probe-arguments)
+        -   [cpc Examples](reference/dtrace_providers_cpc.md#cpc-examples)
+        -   [cpc Stability](reference/dtrace_providers_cpc.md#cpc-stability)
     -   [DTrace Provider](reference/dtrace_providers_dtrace.md)
-        -   [BEGIN Probe](reference/dtrace_providers_dtrace.md#dt_ref_begin_prov)
-        -   [END Probe](reference/dtrace_providers_dtrace.md#dt_ref_end_prov)
-        -   [ERROR Probe](reference/dtrace_providers_dtrace.md#dt_ref_error_prov)
-        -   [dtrace Stability](reference/dtrace_providers_dtrace.md#dt_ref_dtstability_prov)
+        -   [BEGIN Probe](reference/dtrace_providers_dtrace.md#begin-probe)
+        -   [END Probe](reference/dtrace_providers_dtrace.md#end-probe)
+        -   [ERROR Probe](reference/dtrace_providers_dtrace.md#error-probe)
+        -   [dtrace Stability](reference/dtrace_providers_dtrace.md#dtrace-stability)
     -   [FBT Provider](reference/dtrace_providers_fbt.md)
-        -   [fbt Probes](reference/dtrace_providers_fbt.md#dt_ref_fbtprobes_prov)
-        -   [fbt Probe Arguments](reference/dtrace_providers_fbt.md#dt_ref_fbtargs_prov)
-        -   [fbt Examples](reference/dtrace_providers_fbt.md#dt_ref_fbtexamples_prov)
-        -   [fbt Stability](reference/dtrace_providers_fbt.md#dt_ref_fbtstab_prov)
+        -   [fbt Probes](reference/dtrace_providers_fbt.md#fbt-probes)
+        -   [fbt Probe Arguments](reference/dtrace_providers_fbt.md#fbt-probe-arguments)
+        -   [fbt Examples](reference/dtrace_providers_fbt.md#fbt-examples)
+        -   [fbt Stability](reference/dtrace_providers_fbt.md#fbt-stability)
     -   [IO Provider](reference/dtrace_providers_io.md)
-        -   [io Probes](reference/dtrace_providers_io.md#dt_ref_ioprobes_prov)
-        -   [io Probe Arguments](reference/dtrace_providers_io.md#dt_ref_ioargs_prov)
-            -   [bufinfo\_t](reference/dtrace_providers_io.md#dt_ref_iobuf_prov)
-            -   [devinfo\_t](reference/dtrace_providers_io.md#dt_ref_iodev_prov)
-            -   [fileinfo\_t](reference/dtrace_providers_io.md#dt_ref_iofile_prov)
-        -   [io Examples](reference/dtrace_providers_io.md#dt_ref_ioexamples_prov)
-        -   [io Stability](reference/dtrace_providers_io.md#dt_ref_iostab_prov)
+        -   [io Probes](reference/dtrace_providers_io.md#io-probes)
+        -   [io Probe Arguments](reference/dtrace_providers_io.md#io-probe-arguments)
+            -   [bufinfo\_t](reference/dtrace_providers_io.md#bufinfo_t)
+            -   [devinfo\_t](reference/dtrace_providers_io.md#devinfo_t)
+            -   [fileinfo\_t](reference/dtrace_providers_io.md#fileinfo_t)
+        -   [io Examples](reference/dtrace_providers_io.md#io-examples)
+        -   [io Stability](reference/dtrace_providers_io.md#io-stability)
     -   [Lockstat Provider](reference/dtrace_providers_lockstat.md)
-        -   [lockstat Probes](reference/dtrace_providers_lockstat.md#dt_ref_lockstatprobes_prov)
-        -   [lockstat Probe Arguments](reference/dtrace_providers_lockstat.md#dt_ref_lockstatargs_prov)
-        -   [lockstat Examples](reference/dtrace_providers_lockstat.md#dt_ref_lockstatexamples_prov)
-        -   [lockstat Stability](reference/dtrace_providers_lockstat.md#dt_ref_lockstatstab_prov)
+        -   [lockstat Probes](reference/dtrace_providers_lockstat.md#lockstat-probes)
+        -   [lockstat Probe Arguments](reference/dtrace_providers_lockstat.md#lockstat-probe-arguments)
+        -   [lockstat Examples](reference/dtrace_providers_lockstat.md#lockstat-examples)
+        -   [lockstat Stability](reference/dtrace_providers_lockstat.md#lockstat-stability)
     -   [Pid Provider](reference/dtrace_providers_pid.md)
-        -   [pid Probes](reference/dtrace_providers_pid.md#dt_ref_pidprobes_prov)
-        -   [pid Probe Arguments](reference/dtrace_providers_pid.md#dt_ref_pidargs_prov)
-        -   [pid Examples](reference/dtrace_providers_pid.md#dt_ref_pidexamples_prov)
-        -   [pid Stability](reference/dtrace_providers_pid.md#dt_ref_pidstab_prov)
+        -   [pid Probes](reference/dtrace_providers_pid.md#pid-probes)
+        -   [pid Probe Arguments](reference/dtrace_providers_pid.md#pid-probe-arguments)
+        -   [pid Examples](reference/dtrace_providers_pid.md#pid-examples)
+        -   [pid Stability](reference/dtrace_providers_pid.md#pid-stability)
     -   [Proc Provider](reference/dtrace_providers_proc.md)
-        -   [proc Probes](reference/dtrace_providers_proc.md#dt_ref_procprobes_prov)
-        -   [proc Probe Arguments](reference/dtrace_providers_proc.md#dt_ref_procargs_prov)
-            -   [lwpsinfo\_t](reference/dtrace_providers_proc.md#dt_ref_lwpsinfoproc_prov)
-            -   [psinfo\_t](reference/dtrace_providers_proc.md#dt_ref_procpsinfo_prov)
-        -   [proc Examples](reference/dtrace_providers_proc.md#dt_ref_procexamples_prov)
-        -   [proc Stability](reference/dtrace_providers_proc.md#dt_ref_procstab_prov)
+        -   [proc Probes](reference/dtrace_providers_proc.md#proc-probes)
+        -   [proc Probe Arguments](reference/dtrace_providers_proc.md#proc-probe-arguments)
+            -   [lwpsinfo\_t](reference/dtrace_providers_proc.md#lwpsinfo_t)
+            -   [psinfo\_t](reference/dtrace_providers_proc.md#psinfo_t)
+        -   [proc Examples](reference/dtrace_providers_proc.md#proc-examples)
+        -   [proc Stability](reference/dtrace_providers_proc.md#proc-stability)
     -   [Profile Provider](reference/dtrace_providers_profile.md)
-        -   [profile-n Probes](reference/dtrace_providers_profile.md#dt_ref_profile-n_prov)
-        -   [tick-n Probes](reference/dtrace_providers_profile.md#dt_ref_profile-tick-n_prov)
-        -   [profile Probe Arguments](reference/dtrace_providers_profile.md#dt_ref_profargs_prov)
-        -   [profile Probe Creation](reference/dtrace_providers_profile.md#dt_ref_profprobecreate_prov)
-        -   [profile Stability](reference/dtrace_providers_profile.md#dt_ref_profstab_prov)
+        -   [profile-n Probes](reference/dtrace_providers_profile.md#profile-n-probes)
+        -   [tick-n Probes](reference/dtrace_providers_profile.md#tick-n-probes)
+        -   [profile Probe Arguments](reference/dtrace_providers_profile.md#profile-probe-arguments)
+        -   [profile Probe Creation](reference/dtrace_providers_profile.md#profile-probe-creation)
+        -   [profile Stability](reference/dtrace_providers_profile.md#prof-stability)
     -   [Rawtp Provider](reference/dtrace_providers_rawtp.md)
-        -   [rawtp Stability](reference/dtrace_providers_rawtp.md#dt_ref_rawtpstab_prov)
+        -   [rawtp Stability](reference/dtrace_providers_rawtp.md#rawtp-stability)
     -   [Sched Provider](reference/dtrace_providers_sched.md)
-        -   [sched Probes](reference/dtrace_providers_sched.md#dt_ref_schedprob_prov)
-        -   [sched Probe Arguments](reference/dtrace_providers_sched.md#dt_ref_schedargs_prov)
-            -   [lwpsinfo\_t and psinfo\_t](reference/dtrace_providers_sched.md#dt_ref_lwpsinfo_t_psinfo_t_sched_prov)
-            -   [cpuinfo\_t](reference/dtrace_providers_sched.md#dt_ref_cpuinfo_sched_prov)
-        -   [sched Examples](reference/dtrace_providers_sched.md#dt_ref_schedexamples_prov)
-        -   [sched Stability](reference/dtrace_providers_sched.md#dt_ref_schedstab_prov)
+        -   [sched Probes](reference/dtrace_providers_sched.md#sched-probes)
+        -   [sched Probe Arguments](reference/dtrace_providers_sched.md#sched-probe-arguments)
+            -   [lwpsinfo\_t and psinfo\_t](reference/dtrace_providers_sched.md#lwpsinfo_t-and-psinfo_t)
+            -   [cpuinfo\_t](reference/dtrace_providers_sched.md#cpuinfo_t)
+        -   [sched Examples](reference/dtrace_providers_sched.md#sched-examples)
+        -   [sched Stability](reference/dtrace_providers_sched.md#sched-stability)
     -   [SDT Provider](reference/dtrace_providers_sdt.md)
-        -   [Creating sdt Probes](reference/dtrace_providers_sdt.md#dt_ref_sdtcreatep_prov)
-            -   [Declaring Probes](reference/dtrace_providers_sdt.md#dt_ref_sdtdeclp_prov)
-            -   [sdt Probe Arguments](reference/dtrace_providers_sdt.md#dt_ref_sdtparg_prov)
-        -   [sdt Stability](reference/dtrace_providers_sdt.md#dt_ref_sdtstab_prov)
+        -   [Creating sdt Probes](reference/dtrace_providers_sdt.md#creating-sdt-probes)
+            -   [Declaring Probes](reference/dtrace_providers_sdt.md#declaring-probes)
+            -   [sdt Probe Arguments](reference/dtrace_providers_sdt.md#sdt-probe-arguments)
+        -   [sdt Stability](reference/dtrace_providers_sdt.md#sdt-stability)
     -   [Syscall Provider](reference/dtrace_providers_syscall.md)
-        -   [syscall Probes](reference/dtrace_providers_syscall.md#dt_ref_syscallprobes_prov)
-        -   [syscall Probe Arguments](reference/dtrace_providers_syscall.md#dt_ref_syscallargs_prov)
-        -   [syscall Stability](reference/dtrace_providers_syscall.md#dt_ref_syscallstab_prov)
+        -   [syscall Probes](reference/dtrace_providers_syscall.md#syscall-probes)
+        -   [syscall Probe Arguments](reference/dtrace_providers_syscall.md#syscall-probe-arguments)
+        -   [syscall Stability](reference/dtrace_providers_syscall.md#syscall-stability)
     -   [USDT Provider](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md)
-        -   [Defining USDT Providers and Probes](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdtprobes_prov)
-        -   [Adding USDT Probes to Application Code](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_probe_add_prov)
-        -   [Building Applications With USDT Probes](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_build_prov)
-        -   [USDT Examples](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdtexamples_prov)
-
+        -   [Defining USDT Providers and Probes](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#defining-usdt-providers-and-probes)
+        -   [Adding USDT Probes to Application Code](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#adding-usdt-probes-to-application-code)
+        -   [Building Applications With USDT Probes](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#building-applications-with-usdt-probes)
+        -   [USDT Examples](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#usdt-examples)
diff --git a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
index ca3d74ffc..1fab7dea7 100644
--- a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
+++ b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
@@ -9,7 +9,7 @@ USDT is for user space processes. For kernel modules, statically defined tracing
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## Defining USDT Providers and Probes {#dt_ref_usdtprobes_prov}
+## Defining USDT Providers and Probes
 
 Define USDT providers and probes in a `.d` file that you add to the source code. For example, a file `myproviders.d` contains:
 
@@ -37,7 +37,7 @@ The following example traces all processes with `myprov` probes, even if they ha
 sudo dtrace -Z -n 'myprov*:::my-put { printf("put %d %d\n", arg0, arg1); }'
 ```
 
-## Adding USDT Probes to Application Code {#dt_ref_usdt_probe_add_prov}
+## Adding USDT Probes to Application Code
 
 Consider this C code `func.c`:
 
@@ -66,7 +66,7 @@ You can place probes in the code, referring to the probes by using the macros, w
 
 An optional optimization is to test if a probe is enabled. While the computational overhead of a disabled DTrace probe is often similar to a few no-op instructions, setting up probe arguments can be expensive. In this example, `bar(1111)` and `bar(2222)`might be costly function calls. Therefore, for each probe, DTrace also supplies an `is-enabled` macro, named by appending `_ENABLED`. In the example, `MYPROV_MY_PUT_ENABLED()` for the `my-put` probe, to help minimize the cost of any work associated with disabled probes.
 
-## Building Applications With USDT Probes {#dt_ref_usdt_build_prov}
+## Building Applications With USDT Probes
 
 The `dtrace` command becomes part of the build procedure, which can be thought of in four parts:
 
@@ -101,7 +101,7 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
     ```
 
 
-## USDT Examples {#dt_ref_usdtexamples_prov}
+## USDT Examples
 
 1.  Create a file `myproviders.d` that contains:
 
diff --git a/doc/userguide/reference/dtrace_providers_cpc.md b/doc/userguide/reference/dtrace_providers_cpc.md
index 6c48c1586..d2e7ab35b 100644
--- a/doc/userguide/reference/dtrace_providers_cpc.md
+++ b/doc/userguide/reference/dtrace_providers_cpc.md
@@ -11,7 +11,7 @@ Start with higher event counter values for CPC probes and reduce them through tr
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## cpc Probes {#dt_ref_cpcprobes_prov}
+## cpc Probes
 
 Probes made available by the `cpc` provider have the following probe description format:
 
@@ -29,7 +29,7 @@ The definitions of the components of the probe name are listed in table.
 
 Note that when you list CPC probes, example count values are provided in the probe listings. The count values are artificially set high as a guideline.
 
-## cpc Probe Arguments {#dt_ref_cpcargs_prov}
+## cpc Probe Arguments
 
 The following table lists the argument types for the `cpc` probes.
 
@@ -40,7 +40,7 @@ The following table lists the argument types for the `cpc` probes.
 
 As the descriptions imply, if `arg0` is non-zero then `arg1` is zero; if `arg0` is zero then `arg1` is non-zero.
 
-## cpc Examples {#dt_ref_cpcexamples_prov}
+## cpc Examples
 
 The following example illustrates the use of a probe published by the `cpc` provider.
 
@@ -56,7 +56,7 @@ cpc:::cycles-all-50000000
 
 ```
 
-## cpc Stability {#dt_ref_cpcstab_prov}
+## cpc Stability
 
 The `cpc` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_dtrace.md b/doc/userguide/reference/dtrace_providers_dtrace.md
index 45f30457b..8af83eff2 100644
--- a/doc/userguide/reference/dtrace_providers_dtrace.md
+++ b/doc/userguide/reference/dtrace_providers_dtrace.md
@@ -7,7 +7,7 @@ Use these probes to initialize state before tracing begins, process state after
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## BEGIN Probe {#dt_ref_begin_prov}
+## BEGIN Probe
 
 The `BEGIN` probe fires before any other probe.
 
@@ -34,7 +34,7 @@ syscall::mmap:entry
 
 The `BEGIN` probe fires in an unspecified context, which means the output of `stack` or `ustack`, and the value of context-specific variables such as `execname`, are all arbitrary. These values should not be relied upon or interpreted to infer any meaningful information. No arguments are defined for the `BEGIN` probe.
 
-## END Probe {#dt_ref_end_prov}
+## END Probe
 
 The `END` probe fires after all other probes.
 
@@ -64,7 +64,7 @@ As with the `BEGIN` probe, no arguments are defined for the `END` probe. The con
 
 The `[exit](function_exit.md)` function causes tracing to stop and the `END` probe to fire. However, a delay exists between the invocation of the `exit` function and when the `END` probe fires. During this delay, no further probes can fire. After a probe invokes the `exit` function, the `END` probe isn't fired until DTrace determines that `exit` has been called and stops tracing. The rate at which the exit status is checked can be set by using `statusrate` option.
 
-## ERROR Probe {#dt_ref_error_prov}
+## ERROR Probe
 
 The `ERROR` probe fires when a runtime error occurs during the processing of a clause for a DTrace probe.
 
@@ -311,7 +311,7 @@ None.
 </td></tr><tbody></table>
 If the actions that are taken in the `ERROR` probe cause an error, that error is silently dropped. The `ERROR` probe isn't recursively invoked.
 
-## dtrace Stability {#dt_ref_dtstability_prov}
+## dtrace Stability
 
 The `dtrace` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_fbt.md b/doc/userguide/reference/dtrace_providers_fbt.md
index d4ee4366e..9ee9d5680 100644
--- a/doc/userguide/reference/dtrace_providers_fbt.md
+++ b/doc/userguide/reference/dtrace_providers_fbt.md
@@ -15,17 +15,17 @@ Because of the large number of FPB probes that are available, be specific about
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## fbt Probes {#dt_ref_fbtprobes_prov}
+## fbt Probes
 
 FBT provides an `entry` probe and a `return` probe for most functions in the kernel.
 
-## fbt Probe Arguments {#dt_ref_fbtargs_prov}
+## fbt Probe Arguments
 
 The arguments to `entry` probes are the same as the arguments to the corresponding operating system kernel function. These arguments can be accessed as `int64_t` values by using the `arg0`, `arg1`, `arg2`, ... variables.
 
 If the function has a return value, the return value is stored in `arg1` of the `return` probe. If a function doesn't have a return value, `arg1` isn't defined.
 
-## fbt Examples {#dt_ref_fbtexamples_prov}
+## fbt Examples
 
 You can use the `fbt` provider to explore the kernel's implementation. The following example script creates an aggregation on the number of times different functions allocate kernel virtual memory. The results of the aggregation are printed when the script exits. This would help somebody to monitor what functions are memory intensive. Type the following D source code and save it in a file named `getkmemalloc.d`:
 
@@ -74,7 +74,7 @@ Running this script results in output similar to the following:
 
 The output shows the internal kernel functions that are making calls to the `kmem*alloc` system calls and can be used to find which kernel functions most often allocate kernel virtual memory on a system.
 
-## fbt Stability {#dt_ref_fbtstab_prov}
+## fbt Stability
 
 The `fbt` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_io.md b/doc/userguide/reference/dtrace_providers_io.md
index 105ad477a..1e5b3dfd6 100644
--- a/doc/userguide/reference/dtrace_providers_io.md
+++ b/doc/userguide/reference/dtrace_providers_io.md
@@ -7,7 +7,7 @@ For example, you can use the `io` provider to understand I/O by device, I/O type
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## io Probes {#dt_ref_ioprobes_prov}
+## io Probes
 
 The following table describes the probes for the `io` provider. For all `io` probes, the module is `vmlinux` and the function is an empty string.
 
@@ -54,7 +54,7 @@ Fires when a thread finishes waiting for the completion of an I/O request. The `
 </td></tr><tbody></table>
 The `io` probes fire for all I/O requests to peripheral devices, and for all file read and file write requests to an NFS server. Requests for metadata from an NFS server, for example, don't trigger `io` probes because of a `readdir()` request.
 
-## io Probe Arguments {#dt_ref_ioargs_prov}
+## io Probe Arguments
 
 The following table describes the arguments for the `io` probes. The `argN` are implementation specific. Use `args[]` to access the probe arguments.
 
@@ -143,7 +143,7 @@ Probe
 
 DTrace doesn't provide the option to use `fileinfo_t` with `io` probes. In Linux, no information is accessible at the level where the `io` probes fire about the file where an I/O request originated.
 
-### bufinfo\_t {#dt_ref_iobuf_prov}
+### bufinfo\_t
 
 The `bufinfo_t` structure is the abstraction that describes an I/O request. The buffer that corresponds to an I/O request is pointed to by `args[0]` in the `start`, `done`, `wait-start`, and `wait-done` probes. Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/io.d`. The definition of `bufinfo_t` is as follows:
 
@@ -289,7 +289,7 @@ Indicates that the data is to be transferred from main memory to the peripheral
 
 `b_edev`: Contains the major and minor device numbers of the device accessed. You can use the D subroutines `getmajor` and `getminor` to extract the major and minor device numbers from the `b_edev` field.
 
-### devinfo\_t {#dt_ref_iodev_prov}
+### devinfo\_t
 
 The `devinfo_t` structure provides information about a device. The `devinfo_t` structure that corresponds to the destination device of an I/O is pointed to by `args[1]` in the `start`, `done`, `wait-start`, and `wait-done` probes. Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/io.d`. The definition of `devinfo_t` is as follows:
 
@@ -318,7 +318,7 @@ DTrace translates the members of `devinfo_t` from the `buffer_head` for the Linu
 
 `dev_pathname`: Is the full path of the device. The path that's specified by `dev_pathname` includes components expressing the device node, the instance number, and the minor node. However, note that all three of these elements aren't necessarily expressed in the statistics name. For some devices, the statistics name consists of the device name and the instance number. For other devices, the name consists of the device name and the number of the minor node. So, two devices that have the same `dev_statname` migh differ in their `dev_pathname`.
 
-### fileinfo\_t {#dt_ref_iofile_prov}
+### fileinfo\_t
 
 **Note:**
 
@@ -352,7 +352,7 @@ The `fi_fs` field contains the name of the file system type, or `<none>`, if no
 
 The `fi_oflags` field contains the flags that were specified when opening the file.
 
-## io Examples {#dt_ref_ioexamples_prov}
+## io Examples
 
 The following example script displays information for every I/O as it's issued. Type the following source code and save it in a file named `iosnoop.d`.
 
@@ -517,7 +517,7 @@ sdc1 (/dev/sdc1)
 
 The previous output shows that the USB drive \(`sdc1`\) is clearly the limiting device. The throughput of `sdc1` is between 256K/sec and 512K/sec, while `dm-00` delivered I/O at anywhere from 8 MB/second to over 64 MB/second.
 
-## io Stability {#dt_ref_iostab_prov}
+## io Stability
 
 The `io` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_lockstat.md b/doc/userguide/reference/dtrace_providers_lockstat.md
index c7259cd49..c89aa6f19 100644
--- a/doc/userguide/reference/dtrace_providers_lockstat.md
+++ b/doc/userguide/reference/dtrace_providers_lockstat.md
@@ -5,7 +5,7 @@ The `lockstat` provider provides probes that can be used to study lock usage and
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## lockstat Probes {#dt_ref_lockstatprobes_prov}
+## lockstat Probes
 
 For all `lockstat` probes, the module name is `vmlinux` and the function name is an empty string.
 
@@ -44,7 +44,7 @@ The following probe fires before a lock is acquired if there was contention for
 
 Finally, an `adaptive-acquire-error` probe indicates an error acquiring an adaptive lock.
 
-## lockstat Probe Arguments {#dt_ref_lockstatargs_prov}
+## lockstat Probe Arguments
 
 The following table lists the argument types for the `lockstat` probes. The `argN` are implementation specific. Use `args[]` to access the probe arguments.
 
@@ -245,7 +245,7 @@ Probe
 
 `args[0]` has a pointer to the lock in question. The probes that fire in case of contention report a `uint64_t` `args[1]`, which is the wait time in nanoseconds. The `rw` probes also report an `int` that's either `RW_READER` or `RW_WRITER`. Finally, `adaptive-acquire-error` reports an `int` with a non zero error.
 
-## lockstat Examples {#dt_ref_lockstatexamples_prov}
+## lockstat Examples
 
 The following examples illustrate the use of the probes that are published by the `lockstat` provider.
 
@@ -271,7 +271,7 @@ Run the program on the `date` command using `sudo dtrace -qs whatlock.d -c date`
 
 It might be surprising that so many locks are acquired with the `date` command. The large number of locks is a natural artifact of the fine-grained locking required of a scalable system such as the Linux kernel.
 
-## lockstat Stability {#dt_ref_lockstatstab_prov}
+## lockstat Stability
 
 The `lockstat` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_pid.md b/doc/userguide/reference/dtrace_providers_pid.md
index 0b11cdcb3..e03f52a95 100644
--- a/doc/userguide/reference/dtrace_providers_pid.md
+++ b/doc/userguide/reference/dtrace_providers_pid.md
@@ -5,7 +5,7 @@ The `pid` provider traces a user process, both function `entry` and `return`, an
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## pid Probes {#dt_ref_pidprobes_prov}
+## pid Probes
 
 A probe is fully specified by naming its provider, module, function, and name.
 
@@ -52,7 +52,7 @@ The probe name is one of:
 -   An instruction offset. The hexadecimal offset, without a leading `0x`, is relative to the named function, but it's an absolute offset when the function name is `-`.
 
 
-## pid Probe Arguments {#dt_ref_pidargs_prov}
+## pid Probe Arguments
 
 For `entry` probes, the probe arguments are the same arguments as those of the probed function.
 
@@ -60,7 +60,7 @@ For `return` probes, `arg1` is the return value of the probed function.
 
 For offset probes, there are no probe arguments.
 
-## pid Examples {#dt_ref_pidexamples_prov}
+## pid Examples
 
 Consider the following program, named `main.c`, that calls a function `foo()`:
 
@@ -173,7 +173,7 @@ The output looks similar to:
 
 We probe on the chosen instruction, using both a relative offset `foo:4`, and an absolute offset `-:40110a`. Both probes fire, both reporting the same PC `0x40110a`.
 
-## pid Stability {#dt_ref_pidstab_prov}
+## pid Stability
 
 The `pid` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_proc.md b/doc/userguide/reference/dtrace_providers_proc.md
index 1858ffcd5..53506b236 100644
--- a/doc/userguide/reference/dtrace_providers_proc.md
+++ b/doc/userguide/reference/dtrace_providers_proc.md
@@ -7,7 +7,7 @@ The `proc` provider makes available the probes that pertain to the following act
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## proc Probes {#dt_ref_procprobes_prov}
+## proc Probes
 
 The probes for the `proc` provider are listed in the following table.
 
@@ -128,7 +128,7 @@ Fires in the context of a newly created process. The `start` probe fires before
 
 No fundamental difference between a process and a thread that a process creates, exists in Linux. The threads of a process are set up so that they can share resources, but each thread has its own entry in the process table with its own process ID.
 
-## proc Probe Arguments {#dt_ref_procargs_prov}
+## proc Probe Arguments
 
 The following table lists the argument types for the `proc` probes. See [proc Probes](dtrace_providers_proc.md) for a description of the arguments. The `argN` are implementation specific. Use `args[]` to access the probe arguments.
 
@@ -357,7 +357,7 @@ Probe
 —
 
 </td></tr><tbody></table>
-### lwpsinfo\_t {#dt_ref_lwpsinfoproc_prov}
+### lwpsinfo\_t
 
 Several `proc` probes have arguments of type `lwpsinfo_t`. Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/procfs.d`. Some structure members, while still recognized for historical reasons, aren't implemented. The definition of the `lwpsinfo_t` structure is as follows:
 
@@ -475,7 +475,7 @@ The thread is a zombie.
  The equivalent Linux task state is `EXIT_ZOMBIE`, `EXIT_DEAD`, or `TASK_DEAD`.
 
 </td></tr><tbody></table>
-### psinfo\_t {#dt_ref_procpsinfo_prov}
+### psinfo\_t
 
 Several `proc` probes have an argument of type `psinfo_t`. Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/procfs.d`. The definition of the `psinfo_t` structure, is as follows:
 
@@ -527,7 +527,7 @@ Lightweight processes don't exist in Linux. In Linux, processes and threads are
 
 `pr_dmodel` is set to either `PR_MODEL_ILP32`, denoting a 32–bit process, or `PR_MODEL_LP64`, denoting a 64–bit process.
 
-## proc Examples {#dt_ref_procexamples_prov}
+## proc Examples
 
 The following examples illustrate the use of the probes that are published by the `proc` provider.
 
@@ -691,7 +691,7 @@ Running this script results in output similar to the following:
            swapper/6             pmlogger           14 1
 ```
 
-## proc Stability {#dt_ref_procstab_prov}
+## proc Stability
 
 The `proc` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_profile.md b/doc/userguide/reference/dtrace_providers_profile.md
index 40e6a4858..94a308984 100644
--- a/doc/userguide/reference/dtrace_providers_profile.md
+++ b/doc/userguide/reference/dtrace_providers_profile.md
@@ -7,7 +7,7 @@ Such probes aren't associated with any particular point of execution, but rather
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## profile-*n* Probes {#dt_ref_profile-n_prov}
+## profile-*n* Probes
 
 The `profile-*n*` probes fire at a fixed interval, at a high-interrupt level on all active CPUs.
 
@@ -86,7 +86,7 @@ days
 hertz \(frequency expressed as rate per second\)
 
 </td></tr><tbody></table>
-## tick-*n* Probes {#dt_ref_profile-tick-n_prov}
+## tick-*n* Probes
 
 The `tick-*n*` probes fire at fixed intervals, at a high interrupt level on only one CPU per interval.
 
@@ -98,7 +98,7 @@ The `tick-*n*` probes have several uses, such as providing some periodic output
 
 The highest available tick frequency is 5000 Hz \(`tick-5000`\).
 
-## profile Probe Arguments {#dt_ref_profargs_prov}
+## profile Probe Arguments
 
 The following table describes the arguments for the `profile` probes.
 
@@ -146,13 +146,13 @@ The arguments are as follows:
 -   `upc`: user-space program counter
 
 
-## profile Probe Creation {#dt_ref_profprobecreate_prov}
+## profile Probe Creation
 
 Unlike other providers, the `profile` provider creates probes dynamically on an as-needed basis. Thus, the preferred probe might not appear in a listing of all probes, for example, when using the `dtrace -l -P profile` command, but the probe is created when it's explicitly enabled.
 
 A time interval that's too short causes the machine to continuously field time-based interrupts and denies service on the machine. The `profile` provider refuses to create a probe that would result in an interval of less than two hundred microseconds and returns an error.
 
-## prof Stability {#dt_ref_profstab_prov}
+## prof Stability
 
 The `profile` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_rawtp.md b/doc/userguide/reference/dtrace_providers_rawtp.md
index 5246df85f..61f5e9d54 100644
--- a/doc/userguide/reference/dtrace_providers_rawtp.md
+++ b/doc/userguide/reference/dtrace_providers_rawtp.md
@@ -17,7 +17,7 @@ sudo dtrace -lvP rawtp
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## rawtp Stability {#dt_ref_rawtpstab_prov}
+## rawtp Stability
 
 The `rawtp` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_sched.md b/doc/userguide/reference/dtrace_providers_sched.md
index 0ac9af526..a8f8dcb8d 100644
--- a/doc/userguide/reference/dtrace_providers_sched.md
+++ b/doc/userguide/reference/dtrace_providers_sched.md
@@ -7,7 +7,7 @@ Because CPUs are the one resource that all threads must consume, the `sched` pro
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## sched Probes {#dt_ref_schedprob_prov}
+## sched Probes
 
 The probes for the `sched` provider are listed in the following table. For all `sched` probes, the module is `vmlinux` and the function is an empty string.
 
@@ -76,7 +76,7 @@ Fires as a part of clock tick-based accounting. In clock tick-based accounting,
 Fires immediately before the current thread wakes a thread sleeping on a synchronization object. Here, `args[0]` and `args[1]` refer to the sleeping thread, as an `lwpsinfo_t *` and `psinfo_t *`, respectively. The type and address of the synchronization object are contained in the `pr_stype` and `pr_wchan` members of the `lwpsinfo_t` of the sleeping thread. The meaning of this address is a private implementation detail, but the address value might be treated as a token unique to the synchronization object.
 
 </td></tr><tbody></table>
-## sched Probe Arguments {#dt_ref_schedargs_prov}
+## sched Probe Arguments
 
 Many of these probes refer to a particular thread. For these probes, the thread's `lwpsinfo_t` is pointed to by `args[0]` and the `psinfo_t` of the process containing the thread by `args[1]`. A few probes refer to a particular CPU. Its `cpuinfo_t` is pointed to by `args[2]`. Only `enqueue` has an `args[3]`, and that argument is a Boolean, as described. The `argN` values are implementation specific. Instead, use `args[]` to access the probe arguments.
 
@@ -243,11 +243,11 @@ Probe
 —
 
 </td></tr><tbody></table>
-### lwpsinfo\_t and psinfo\_t {#dt_ref_lwpsinfo_t_psinfo_t_sched_prov}
+### lwpsinfo\_t and psinfo\_t
 
 The `lwpsinfo_t` and `psinfo_t` structures are described in [Proc Provider](dtrace_providers_proc.md).
 
-### cpuinfo\_t {#dt_ref_cpuinfo_sched_prov}
+### cpuinfo\_t
 
 The `cpuinfo_t` structure defines a CPU. The `args[2]` arguments for the `enqueue` and `dequeue` probes point to the `cpuinfo_t` for the CPU associated with the run queue, which is sometimes different from the current CPU, whose `cpuinfo_t` is pointed to by the `curcpu` variable.
 
@@ -262,7 +262,7 @@ typedef struct cpuinfo {
 } cpuinfo_t;
 ```
 
-## sched Examples {#dt_ref_schedexamples_prov}
+## sched Examples
 
 The following examples illustrate the use of the probes that are published by the `sched` provider.
 
@@ -810,7 +810,7 @@ The output of the example script is two distributions of the millisecond offset
 
 The output histogram named `tick` shows that the clock tick is firing at a 1 millisecond offset. In this example, the output for `enqueue` is evenly spread across the ten millisecond interval and no spike is visible at 1 millisecond, so it seems the threads aren't being scheduled on a time basis.
 
-## sched Stability {#dt_ref_schedstab_prov}
+## sched Stability
 
 The `sched` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_sdt.md b/doc/userguide/reference/dtrace_providers_sdt.md
index bc50ebe3c..010c4f566 100644
--- a/doc/userguide/reference/dtrace_providers_sdt.md
+++ b/doc/userguide/reference/dtrace_providers_sdt.md
@@ -11,13 +11,13 @@ Both the name stability and the data stability of the probes are Private, which
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## Creating sdt Probes {#dt_ref_sdtcreatep_prov}
+## Creating sdt Probes
 
 If you are a device driver developer, you might be interested in creating `sdt` probes for a Linux driver that you are working on. The disabled probe effect of SDT is only the cost of several no-operation machine instructions. You are therefore encouraged to add `sdt` probes to device driver code as needed. Unless these probes negatively affect performance, you can leave them in shipped code.
 
 DTrace also provides a mechanism for application developers to define user-space static probes.
 
-### Declaring Probes {#dt_ref_sdtdeclp_prov}
+### Declaring Probes
 
 The `sdt` probes are declared by using the `DTRACE_PROBE` macro from `<linux/sdt.h>`.
 
@@ -34,11 +34,11 @@ SDT can also act as a metaprovider by registering probes so that they appear to
 
 Probes that use such macros appear to come from a provider other than `sdt`. The leading double underscore, provider name, and trailing underscore in the `name` argument are used to match the provider and aren't included in the probe name.
 
-### sdt Probe Arguments {#dt_ref_sdtparg_prov}
+### sdt Probe Arguments
 
 The arguments for each `sdt` probe are the arguments that are specified in the kernel source code in the corresponding `DTRACE_PROBE` macro reference. When declaring `sdt` probes, you can minimize their disabled probe effect by not dereferencing pointers and by not loading from global variables in the probe arguments. Both pointer dereferencing and global variable loading can be done safely in D functions that enable probes, so DTrace users can request these functions only when they're needed.
 
-## sdt Stability {#dt_ref_sdtstab_prov}
+## sdt Stability
 
 The `sdt` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_syscall.md b/doc/userguide/reference/dtrace_providers_syscall.md
index 7e8637c2a..877214772 100644
--- a/doc/userguide/reference/dtrace_providers_syscall.md
+++ b/doc/userguide/reference/dtrace_providers_syscall.md
@@ -7,17 +7,17 @@ Because system calls are the primary interface between user-level applications a
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## syscall Probes {#dt_ref_syscallprobes_prov}
+## syscall Probes
 
 `syscall` provides a pair of probes for each system call: an `entry` probe that fires before the system call is entered, and a `return` probe that fires after the system call has completed, but before control has been transferred back to user-level. For all `syscall` probes, the function name is set as the name of the instrumented system call.
 
 Often, the system call names that are provided by `syscall` correspond to names in the Section 2 manual pages. However, some `syscall` provider probes don't directly correspond to any documented system call, such as the case where a system call might be a sub operation of another system call or where a system call might be private in that they span the user-kernel boundary.
 
-## syscall Probe Arguments {#dt_ref_syscallargs_prov}
+## syscall Probe Arguments
 
 For `entry` probes, the arguments, `arg0` ... `arg*n*`, are arguments to the system call. For return probes, both `arg0` and `arg1` contain the return value. A non-zero value in the D variable `errno` indicates a system call failure.
 
-## syscall Stability {#dt_ref_syscallstab_prov}
+## syscall Stability
 
 The `syscall` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
 
-- 
2.47.3

