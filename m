Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE012D542F
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 20:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757623763; cv=fail; b=orvpW1jaHYA0UOWf1uOdP4x4u9DgrOFgd0XkNKh3+A5u6kKVobmaxs3+fGzL3innAJ3nPOP6M/VRDxlxqpdxTk5QTgEbM+uaxUSCLOvIOxyZXqM4P9YcH6OsfacbcVwU+oLaZzlVE6ktmm/qWB2o0Dcu846cmArJ7+G1huZiUUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757623763; c=relaxed/simple;
	bh=RmYPFuWZWbIQxWj7Ae5+UCoj0xynQonYbpdhJDti308=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FS4v9rr6KHwKJTqPWB39I8SXNRgCQgWHN6pVyW5sNhgcaFanM4F07L3eDwoU1rzvHuIv2aIDVAsaXaDA6ZV3FExo8rDhJhSHE5RzyS2AeZhKgsUWuQG0HTbXYjYGWZatcT4P4WHl5kclC/ZBChgfE39UDJAJyCkmiylDADJOULU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=U/RiXQg0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=niFfTces; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="U/RiXQg0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="niFfTces"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BHBfki016125
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 20:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=hHWOiMyzzWwGRmh2/d
	Te/J6uo8gaB7k9IBdeW7TZJA8=; b=U/RiXQg0l8/Gtts0qP8WPkaRHmK/4GQc2h
	1FO/UHbpGbOoMhtc8xDznbttrahtcW60gwFqMcJ7VGxE2+NVtRUuA+BE/QuXUNsc
	6bb+jlFkKNL+bM3ajuZIMAfk0hsIQKztBoR9qeUhlwWEgE/zmfIJhJabv5dtOMoK
	+sUoJoJANBoFzku90CJtGHNfAiRS/WFPLAO7GKmwHIw5qjPqFLQDcd22OMjQKz2l
	0VBnFboilGDhjBMQhrqjl5TjHGu8yNXi7Y1GHCVmV73zIBax2QRz9B9gc5L4cEce
	wKfh9vyBJcqK/vCluziuaaxwiV4sAOJsPCaGz6ndXudA1hxWuuVQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4921m2y3dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 20:49:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58BK9Bbl032858
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 20:49:19 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 490bddy1dj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Sep 2025 20:49:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZoav3WBxVpPSlvzJUWODT3Y2sKla55HXf8XrVsmO2xgDS62sCQIqkmy+z0sbhfI7K6nP7TBwdzI4GNQpTRZ7WZhHbuRuHLCel74XD/9G3CHJDec2x3NY3JQi6OkWC9yx9oTOoHz2Bsjc0H4rL1Oq/y50SO6QTFeJ26fiFJIljFAiv03LRvW/ZyxjflxY0lcJagGygej/EFAb+/hOT40qtYXNL6yLW70TpRLahIkVt3L/8P3JJvFPN0TV1JhxYriLxqgS4bT074PTYie1G5+OnxdqAbj1dNvb4cb45WG3eugroy6egIduHYB3HGZ0IlRyO0OdgnyZ78IZy4hfyppDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHWOiMyzzWwGRmh2/dTe/J6uo8gaB7k9IBdeW7TZJA8=;
 b=eQ+2wgMm9OKcJxXvPtLpQmUt7Vq6Z30bzWX41zx6q5n2Rf0kxZ1Fwrcmx7IRrzQIlqz03Qg9eDvCNw883yVKfCC7d4yERrxKIfPbnppsj608/qedfxtc/nd4FY5YW3oPMG14n+mnJLMxOvJ9GoPOH8EcbIWd7Z/Zdo89/l25XzW0X0aBsBvbKrjIoDzYqY5Gw+9K5MAaOgigCFYYkLASCDCafIMWwcT9YPTA0RSmkjMl8qDiBugaMFgQrFcFb+ZtOMkhfTNfgPnxj9nUyxe7HP8rqWjV4zwtWro4r+DgRNccJrcqpFP67zbWzIT6saeJtvxaii+y73qjukUS40UabQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHWOiMyzzWwGRmh2/dTe/J6uo8gaB7k9IBdeW7TZJA8=;
 b=niFfTcesmDYN0UM5JK1F7NEu5+5urILyCe3JJI/y62S/C+ZE5zID6Nt861J8eQR6HT4Z+D//iPc9QSC3H4Zj2u6dOpmtbH1ZgiQaeqlGlon84HohnVmGezGxlCtmsH4hxS9CeyMCgo1cALfIn7VAmcl0TYcPpvDbWuUnEzTx96k=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ0PR10MB5720.namprd10.prod.outlook.com (2603:10b6:a03:3ef::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 20:49:16 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 20:49:16 +0000
Date: Thu, 11 Sep 2025 16:49:13 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test: Update DTrace version string
Message-ID: <aMM1yUCxG85oX8c4@oracle.com>
References: <20250905170715.11981-1-eugene.loh@oracle.com>
 <20250905170715.11981-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905170715.11981-2-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:36e::19) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ0PR10MB5720:EE_
X-MS-Office365-Filtering-Correlation-Id: fa83d6c1-f490-422d-8b2e-08ddf174abff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A7mlD63XOolkQ2KtT62bZPuER5wNfRPpj4V3ZyndvtzfFRuGJbSyNVXeU55Z?=
 =?us-ascii?Q?zv/WZ9qQE6qCNzSkvyWXENAinyjwkmNHZg8gl7ZG1jlGeKyk6Wg9WHhW2NZs?=
 =?us-ascii?Q?+TKHhwqW1qzd9tiv7mk1veebHBbCHHccpLIFVGHIxiwMfr5ow2scM+RVxC4U?=
 =?us-ascii?Q?bFCNWpzAGjv8Dj0LYPgnUpKGXuYNo/82qCI5cbzMo54QbSQ/XLea9UZ+RvLW?=
 =?us-ascii?Q?Ct9UWB0rae432BO5Lg8AeCcSgLCto8vMPTx3uxJbVJOuSs1pDrZGqdB8KApJ?=
 =?us-ascii?Q?n0vhkavtVJYtnexbcWDSOg6JvFdYg8jEFekAZYsvGdmRac8IZ2sxNdmewkUM?=
 =?us-ascii?Q?UM93blQAiwRJDdID11h0UOwpGLa4b/y4Rgs4gosp3Gqhoilqcj6ZtHFzIWii?=
 =?us-ascii?Q?QZHrqy9gVzZ1fV2LbSdomaVah+bsIVqqzNemuH3DOpn9iMjWtlfqgWC5b+Yk?=
 =?us-ascii?Q?CXmj2aHKE8cEeZNAns1Ecw5ac1QOVcuh0puyTpnpFZOSb9npDLkh5pLiQPbf?=
 =?us-ascii?Q?qLzL5EchXx2GOAHRXqe21R3yDFi06IMdoNnK1wSU8cJuAtIPLspZXlfhJw7E?=
 =?us-ascii?Q?011C6XzFWtLbgJHD6nhWqBgk3ghrAzpJow+zLQranxvkI0AqID4HRxn5QtDG?=
 =?us-ascii?Q?8fQkacmxmQSng8lWQisjoEKQ1yFLQGd6eoH/hfa71lLtOTi2OCpGiiB1crRV?=
 =?us-ascii?Q?mGfUqQjtjApMQ7LZYqmEjIHsB1Q/H9NF1doaq5738V65GkrqZ6vtr2rtnq1i?=
 =?us-ascii?Q?EoWujFgEKaM9O1OkTcpTTQgXiMVRp9k6seGjRdL99ugpap5tVc1CoujnfD9o?=
 =?us-ascii?Q?1M5DpMS4nz3VT+Q9BKMYy/o17e0aUpjybrGr3kyGe9UAxZqzG6bmVvcVzOMi?=
 =?us-ascii?Q?CoXP8bqlTyy8kXL1hA1kaw0o3JVDNpYWZd4viK2has2ZTITqneQvfIDOAvL/?=
 =?us-ascii?Q?1Niq6hp3XbCYJEMp5hfP60n2c+vawFlLwXdRqazREUmHhbHTKVU0XrlcPvGX?=
 =?us-ascii?Q?a3oXMvjAS7e1niJcE9jbAZO68s5Bth5sktZGitYQhZ+Ei5GJrPLfM1b0bR4U?=
 =?us-ascii?Q?qJm+swoVktKpLzsDA/4KuPvYX7sYfTKfKp024auSfqZ+o/SKeQkpCV3CGbru?=
 =?us-ascii?Q?Pfeucz8ueGgd+GmJjsFcEBRZk+fyPTY+PtIWqaU2B8+PujsRtnDhI9bVESJI?=
 =?us-ascii?Q?mrMzDC5LIUV0gv3Oj0k6DOGlkMb6R0FJslgEI1KevwxXx8qdTKk9E9M0hkmk?=
 =?us-ascii?Q?8BATiwvHc46VUrPGtKLGpjftkoWb65w9ZtO4f7vsBdgfqW6N5LCmmHNVH9Jv?=
 =?us-ascii?Q?qSqliBUWHsMyzoepDJXNlc5obwKSbrss8Dz9jY02dNfkMYU1ig5T3ogRSqat?=
 =?us-ascii?Q?JUWJ1zohJ5yjzpUN4xGv1eGCT4QaZf+XrMDwfZd5nRchmHqh7cSHIgJhGUz+?=
 =?us-ascii?Q?rpXyxNEJnUw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?03PWnFBUQgAJQYwjx6/OFneym4x534ZP7aYROfXfj83ksFUov0AhQOIHHGHJ?=
 =?us-ascii?Q?v7o31X9FtwYyxa93n356ZzEeUusbUpdHWxH79eWB6IkJEhFJOlmoZEQPzsGX?=
 =?us-ascii?Q?lpXzyUsff7iMnngcG/hvZSvUIRgOtxb8ejLQplJz0VBTyVk9hb+bZ/l8TQfe?=
 =?us-ascii?Q?S5ONMC7p1JjBiLt7gnG/YMLDw5xUbwuWGABY/bPmHvEv75ODZhgFUqdJ5y9/?=
 =?us-ascii?Q?xB3N1FMOwCIpWVbrHeFBGb4rBvb01ZL4Ul90sgweQpJoXbvblLc5FYvrF0Na?=
 =?us-ascii?Q?ApoMSYGNjLL3bXhmM3OQFanJEVvuHe6DWmkxj2HbLBBVL0yOqc4cVfVVtkBA?=
 =?us-ascii?Q?1ZXUYJut8dYt+IcdFdh/oSiXDgveOUEFvqKcTVaf1WXBhHY6mDLtuBX55MaT?=
 =?us-ascii?Q?aKa/VuyZw75aAmIebZFSLIQJwGo2pAL1cSX8u4zitERhdhqfmu0Zgx2BbR8p?=
 =?us-ascii?Q?Uq8//vmKAEOqZg5B2GOUq5NOYymUGlkIeS+lWGS/pCKrB3NSbScoDG5KoJzT?=
 =?us-ascii?Q?Lq9Dn33g8of8enHkuHqfovBlLAC2GyrU+GxeRS1UPqiTY9R5M/6zHcvQYDQE?=
 =?us-ascii?Q?ims1GtLCUZUwpyMeRspZ2mDQzMyXCsSI9jDR5EOAGHldQ2gKVQYD02hC3cb5?=
 =?us-ascii?Q?K32aAhMnPh1bpXxGX0zj/Aw6IKFUy0BZ19AtAAaUrTMQnxH6cJYGeF8CTux4?=
 =?us-ascii?Q?oBEOcn6AOJRQZTjIFeu6hyLb5IUq/4cJTgdtGcG6j4wP3iaet3isMM5O+6gM?=
 =?us-ascii?Q?5iaLavMvtCqszf5WhtAHu0VjS+LMfse/B9zoM0TP1x9QoGcr4Pjdnf1VfGnv?=
 =?us-ascii?Q?YD4Ul6nQJX0LoLvESXlDyFDR39gYKFv59g0Fm9K1U1hRk+40OVmFrevGix3C?=
 =?us-ascii?Q?ZJqZsaWTHJirNKH+yepFfMkyzNfvYqmH8/KwAFvslMBcy6xA+F7bo0XikH+U?=
 =?us-ascii?Q?GP4R/IDxvFcdwSSaTptbmBGmr960qK47F1sIZAOitGcKQsppFbSeAerXqO9P?=
 =?us-ascii?Q?Cp31eopnP3YlIQuWfszf/7i+vDo7uvtwvNLrSVSHqZFIJQvVJY+5XavxgCU+?=
 =?us-ascii?Q?hWBXEg08ZgQhq0oVsFBdoTxguj3VUD48Qtm6QcjETrzJc3e/EC1Wkuzxa+9L?=
 =?us-ascii?Q?3vWazfvfyTEIS+i9d+6cV0/ZVAWIHgrnJ97x2uZMOOmFUSgMucjJSVJroWo9?=
 =?us-ascii?Q?oGxWKT4sXXNa2TKWWsn45qRFIYqPCY7qn3ZaogVAXgxSkh7gDzzfjaOLwhk3?=
 =?us-ascii?Q?00lEdzH0huFdtq8zllXbZzT4Cg4Ou6G3thQrQRgfJhatmMuFyVyAL+o+JVSN?=
 =?us-ascii?Q?qjWvLdouV52mP3T1zwgO8ubK0sXTAHw1T5HTjb7Y4AM7GbzAQKIH9OjTMdv6?=
 =?us-ascii?Q?c82byXt0wH91WgTjZdRoDljxps+jnXzTG2RRHaXCcpuK66pfeUD+bYMAVTM1?=
 =?us-ascii?Q?QAYl9uPi55atWJmRfj1B5vSINa8ti+Eg5BjhJsRF4GaBuEEHCGG0d8j6RCUx?=
 =?us-ascii?Q?EV8LFVtHU2ygfP62clu70P46IF4cuCgOv+9oYep2KncMCJxXsLaxCKn+ksqb?=
 =?us-ascii?Q?G4uaRMKtXNYSHt2Daw/ovZqz4WIlKMgmoyfiE5h/jaG+ERltJT10WW7hLIW4?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	35wygMR0qguEoKoI6UGZKpSi2FViMfGXHXU8PVjTsYYH0u9iVnfy9jsGDVhk/WnkQoiI62C72Rqnjv70D0RCIFCBsnfn6JOSkZJnjJh8UY8pW0D5RCo/XW1HecuQUZv+2YLYflUnNCJIWFVX1HvtAxp1cpkAELMG46LTiJT7gFy6McGnj3thwZN/kwQsaJYGVinH9FmabaTi54nBfc2gi2d+1noEeCgePExWGROKqfROKV2uDUWOEi39RgKuegPSm/BS3fXE11cWzeb6CTwVkdIcMlLJrH+Q0toFRMmA3SD9fJlVfKMuELPR4L1zpWZ7WSR2RUZ7+gWTYmQSlucloZ2ED8/Ihhu9qaG8j6pIezsw0LbsCLHQvDi6QkFBg7P+Gj+wSG9OVplXhjfoNfgg7HieKQiWLdDVaZrwaI5ajLiD/+8xIXHwlrVCk2wfeDV288E4o/mJmzXdVEEVC1IdjCVY4YCypZ73eYAUZ2SUvEAC2A26s6kJEnBUVcpkbzzEmPtZtkEjh7/owLY/zNV9WCr8lFVCtGzpiuktwqo55bbTH1vGVVFCTe2DxuK9K2q4r3ANk8ffajVW+FQMii8Ni6rKv3o18Xsk3HCeFvHSZ7w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa83d6c1-f490-422d-8b2e-08ddf174abff
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 20:49:16.2036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cclw1GUPsezTedL00TBe62Hm2U5+0v07uiD05Sbho5H/Qd+tjvMkMVJ7PMZi5TlBF+X8IuWsDYgvYtA8wBaPIRDR8y/Fy8A+OyWHu/KasBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5720
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509110187
X-Proofpoint-GUID: 4tM57FclG-o7IhYKGyBY9AWfZxoAsfuv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE1MSBTYWx0ZWRfX6j1pwT91d6pS
 Zgqcac/3kO18QFwwtF+HZasY9+vfS4HwxwswU5DamtP7GrnqkIYrYswwvmgRWc0PXx3HJFp1qoU
 l3CamJDB5VsPXP7AVfX3wc01UklLTM+taFCV5xNgCy3ruFSqKznSWgdx+ZOd8CpUOAl4v862kfT
 t9oeqB1IEAVc15jat0kIVElNKN4Pw7OMlbvck1AHixwZt5PSY9Fiy529pz3/b3+hSogx1MB0y9S
 QWmAd9thaoNIcha7gJ7cEK0na/wLRV9JhjbV3TtN6B8f1jumkzFDgTRNFMinshjLPog2V3/cbvr
 74L8Gw1C+LuK3JAjJvqYH26MKfT/0gr68sGaJLvuFjG/mhuE6D6RcvF14AyOyIfDUvkZDGrbEIF
 VNF4f0aD
X-Authority-Analysis: v=2.4 cv=Dp5W+H/+ c=1 sm=1 tr=0 ts=68c335d0 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=6mTWHuwD_vXiDxj2cUwA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 4tM57FclG-o7IhYKGyBY9AWfZxoAsfuv

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

On Fri, Sep 05, 2025 at 01:07:15PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Commit a48a76472 ("version: fix DTrace version string") changed
> the DTrace version string without addressing associated testing.
> 
> Update the test suite to match the version string change.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/dtrace-util/tst.APIVersion.r | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/test/unittest/dtrace-util/tst.APIVersion.r b/test/unittest/dtrace-util/tst.APIVersion.r
> index 0d88b694e..72d03e71c 100644
> --- a/test/unittest/dtrace-util/tst.APIVersion.r
> +++ b/test/unittest/dtrace-util/tst.APIVersion.r
> @@ -1 +1 @@
> -dtrace: Oracle D x.y.z
> +dtrace: D x.y.z
> -- 
> 2.47.3
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
